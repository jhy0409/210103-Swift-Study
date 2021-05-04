import UIKit

// URLSession

// 1. URLSessionConfiguration
// 2. URLSession
// 3. URLSessionTask를 이용해서 서버와 네트워킹


// URLSessionTask

// - dataTask
// - uploadTask
// - downloadTask

let config = URLSessionConfiguration.default
let session = URLSession(configuration: config)

// URL
// URL Conponents
var urlComponents = URLComponents(string: "https://itunes.apple.com/search?")!
let mediaQuary = URLQueryItem(name: "media", value: "music")
let entityQuery = URLQueryItem(name: "entity", value: "song")
let termQuary = URLQueryItem(name: "term", value: "Gdragon")
urlComponents.queryItems?.append(mediaQuary)
urlComponents.queryItems?.append(entityQuery)
urlComponents.queryItems?.append(termQuary)
let requestURL = urlComponents.url!

struct Response: Codable {
    let resultCount: Int
    let tracks: [Track]
    
    enum CodingKeys: String, CodingKey {
        case resultCount
        case tracks = "results"
    }

struct Track: Codable {
    let title: String
    let artistName: String
    let thumbnailPath: String
    
    enum CodingKeys: String, CodingKey {
        case title = "trackName"
        case artistName
        case thumbnailPath = "artworkUrl30"
        }
    }
    
}



let dataTask = session.dataTask(with: requestURL) { (data, response, error) in
    guard error == nil else { return }
    
    guard let statausCode = (response as? HTTPURLResponse)?.statusCode else { return }
    let successRange = 200..<300
    
    guard successRange.contains(statausCode) else {
        // handle response error
        return
    }
    
    guard let resultData = data else { return }
    let resultString = String(data: resultData, encoding: .utf8)
    
    // 트랙리스트 오브젝트로 가져오기
    
    // 해야할 목록
    // - Data -> Track 목록으로 가져오고 싶음 [Track]
    // - Track 오브젝트를 만듦
    // - Data에서 struct로 파싱 > Codable 이용해서 만들기
    //  - Json 파일, 데이터 > 오브젝트 (Codable이용)
    //  - Response, Track Struct 두개
    
    
    // 할 일
    //  - Response, Track Struct 두개
    //  - struct의 프로퍼티 이름과 실제 데이터 키와 맞추기 (Codable 디코딩 위해)
    //  - 파싱하기 (Decoding)
    //  - 트랙리스트 가져오기
    
    // 파싱 및 트랙 가져오기
    do {
        let decoder = JSONDecoder()
        let response = try decoder.decode(Response.self, from: resultData)
        let tracks = response.tracks
        
        print("---> tracks: \(tracks.count)     -\(tracks.last?.title), -\(tracks.last?.thumbnailPath)")
    } catch let error {
        print("---> error: \(error.localizedDescription)")
    }
//    print("---> result: \(resultString)")
}

dataTask.resume()
