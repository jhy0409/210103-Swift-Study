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
import UIKit

/*:
 # optional try
 ![optional-try](optional-try.png)
 */
/*
 try표현식
    - 사용 : 에러를 던지는 함수 또는 생성자 호출시
 
 1. try? expression (optional try)
    - do-catch외에서 호출 시 사용
 
 2. try! expression (forced try)
    - 실행중지, 런타임에러 발생
 
 -> 에러를 옵셔널값으로 변경함 -> 주로 옵셔널 바인딩과 함께 사용
 */
enum DataParsingError: Error {
   case invalidType
   case invalidField
   case missingRequiredField(String)
}

func parsing(data: [String: Any]) throws {
   guard let _ = data["name"] else {
      throw DataParsingError.missingRequiredField("name")
   }
   
   guard let _ = data["age"] as? Int else {
      throw DataParsingError.invalidType
   }
   // Parsing
}

if let _ = try? parsing(data: [:]) {
    print("success")
} else {
    print("fail if문")
}

do {
    try parsing(data: [:])
    print("success")
} catch {
    print("fail do-catch문")
}

try? parsing(data: [:])
try! parsing(data: ["name": "steve", "age": 33])
/* 비권장
 //try! parsing(data: [:])
    - 에러발생시 강제로 종료되므로
    - 표현식에서 발생하는 에러를 다른곳으로 전달할 수 없음
    - do-catch로 에러처리 불가능
 */
