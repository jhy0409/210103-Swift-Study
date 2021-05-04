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
    
    print("---> result: \(resultString)")
}

dataTask.resume()
