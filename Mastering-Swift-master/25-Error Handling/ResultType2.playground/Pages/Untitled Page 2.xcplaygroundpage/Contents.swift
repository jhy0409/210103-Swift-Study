//
//  Copyright (c) 2018 KxCoding <kky0317@gmail.com>
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
//: [Previous](@previous)

import Foundation

/*:
 # Result Type in Async Code
 */
/*
 동일코드에서 Result형식의 사용
 */
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

enum ApiError: Error {
    case general
    case invalidFormat
}

typealias CompletionHandler = (Result<BookListData, ApiError>) -> ()

func parseBookList(completion: @escaping CompletionHandler) {
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let error = error {
            completion(.failure(.general))
            return
        }
        
        guard let data = data else {
            completion(.failure(.general))
            return
        }
        
        do {
            let list = try JSONDecoder().decode(BookListData.self, from: data)
            completion(.success(list))
        } catch {
            completion(.failure(.general))
        }
    }
    task.resume()
}

parseBookList { (result) in
    switch result {
    case .success(let data):
        data.list.forEach{ print($0.title)}
    case .failure(let error):
        print(error.localizedDescription)
        
        switch error {
        case .general:
            //code
            break
        case .invalidFormat:
            // code
            break
        }
    }
}

//: [Next](@next)
