//
//  Copyright (c) 2019 KxCoding <kky0317@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//
import UIKit

/*:
 # Result Type in Async Code
 */
//네트워크 코드 : 비동기방식으로 구현
guard let url = URL(string: "http://kxcoding-study.azurewebsites.net/api/books") else {
   fatalError("invalid url")
}

struct BookListData: Codable {
   let code: Int
   let totalCount: Int
   let list: [Book]
}

struct Book: Codable {
   let title: String
}

typealias CompletionHandler = (BookListData?, Error?) -> ()
// 옵셔널 : 에러발생시 불필요한 값 전달하지 않기위해 사용
func parseBookList(completion: @escaping CompletionHandler) {
   let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      if let error = error {
         completion(nil, error)
         return
      }
      
      guard let data = data else {
         completion(nil, nil)
         return
      }
      
      do { // json으로 넘어오는 데이터를 디코딩 -> 스위프트 객체로
         let list = try JSONDecoder().decode(BookListData.self, from: data)
         completion(list, nil)
        // 1] list에 nil전달되면 논리적 오류 및 크래시 발생
      } catch {
         completion(nil, error)
      }
   }
   task.resume()
}

// 2] 옵셔널이므로 실제 값 전달되는지 확인필요 optional binding, chaining
parseBookList { (data, error) in
   if let error = error {
      print(error.localizedDescription)
      return
   }
   data?.list.forEach { print($0.title) }
}
/*
 [ 현재코드 문제점 ]
 - error: data와 nil이 쌍으로 전달되는 보장이 없음
 */


//: [Next](@next)
