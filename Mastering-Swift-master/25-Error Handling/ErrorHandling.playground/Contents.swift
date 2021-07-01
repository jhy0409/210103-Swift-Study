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
 # Error Handling
 
 ![throw](throw.png)
 ![throws](throws.png)
 */
/*
 에러처리 방법
 
 에러발생시 보통 프로그램 강제종료
 에러 직접처리 시 종료없이 프로그램 계속 실행가능
 
 [ 에러 종류 ]
 1. Compile Time Error : 대부분 문법과 관련이 있음
 2. Runtime Error :
 - 프로그램 실행되는동안 발생, 문법 외 디바이스나 리소스 상태에 따라 발생
 - 보통 프로그램 강제종료
 - 발생가능한 에러 미리 처리시 프로그램 크래시 없이 사용가능
 - 사용성 증가 : 강제종료 횟수 줄어듦에 따라
 
 [ 에러형식 ]
 - 에러 프로토콜을 채용
 - 열거형으로 선언
 
 - throw = 에러처리 : 에러 던진다.
 - throws : 에러 던질수 있다고 선언하는 것 (함수, 메소드, 생성자, 클로저)
 
 1. Throwing Function / Method
 2. Throwing Initializer
 3. Throwing Closure
 */

enum DataParsingError: Error { // 에러프로토콜 채용, 에러형식으로 선언됨
    case invalidType
    case invalidField
    case missingRequiredField(String)
} // 에러형식 : 스위프트 에러처리 형식에 통합됨

func parsing(data: [String: Any]) throws {
    guard let _ = data["name"] else {
        print("err1_ name")
        throw DataParsingError.missingRequiredField("name")
        // 코드블록 실행 즉시 종료
        
        guard let _ = data["age"] as? Int else {
            print("err2_ age")
            throw DataParsingError.invalidType // 에러 발생시에만 호출돼야함
        }
        // Parsing
    }
}

/*:
 # try Statements
 ![try](try.png)
 */
/*
 do-catch와 함께 사용
 -2 try?(옵셔널 트라이) : 옵셔널 결합형태, 표현식 에러 발생시 nil리턴
 -3 forced try : 에러 발생시 런타임에러 //미사용 권장
 
 throws : 함수, 메소드, 생성자, 클로저 try표현식으로 호출해야함
 */

try? parsing(data: [:])

/*
 [ 에러처리 방법 3가지 ]
 
 1. do-catch Statements : 코드발생 에러 개별 처리
 2. try Expression + Optional Binding (트라이표현식 + 옵셔널 바인딩)
 3. hand over : 전달받은 에러 다른 코드블럭으로 다시 전달
 */

var dict: [String: Int] = [:]
dict["name"] = 99
//dict["age"] = 13

try? parsing(data: dict)

/*
 for (key, value) in dict {
 print("key: \(key), value: \(value)")
 }
 */
