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
 # do-catch Statements
 ![do-catch](do-catch.png)
 */
/*
 do-catch 문을 통해 오류를 처리하는 방법에 대해 공부합니다.
 
 - do-catch 문법
 - catch 블록 구현 방식
 
 =======================================================
 - do : 필수블록
 - catch pattern where condition : 매칭시킬 에러패턴 조건추가
 */
enum DataParsingError: Error {
    case invalidType
    case invalidField
    case missingRequiredField(String)
}

func parsing(data: [String: Any]) throws {
    guard let _ = data["name"] else { // 키 값이 name이 있는지 확인
        throw DataParsingError.missingRequiredField("name") // 여기서 에러가 do-catch문으로 전달.
    }
    
    guard let _ = data["age"] as? Int else { // 키값이 age고 인트로 변환할 수 있는지 확인
        throw DataParsingError.invalidType
    }
    // Parsing
}


func handleError() throws {
    do {
        try parsing(data: ["name" : ""])
    } catch {
        // 패턴없는 캐치블록, error 로컬상수 제공됨
        if let error = error as? DataParsingError { // 에러형식 아닌 프로토콜이어서 type casting 필요
            switch error {
            case .invalidType:
                print("invalid Type")
            default:
                print("handle error")
            }
        }
    }
    
    //catch DataParsingError.invalidType { // 까다로운 조건부터 나열
    //    print("invalid type error")
    //}
    //catch { // 패턴이 없는 형식은 마지막에
    //  print("handle error")
    //}
    
    /*
     글로벌스코프에서 함수내부로 이동
     -> 모든에러 해결
        - 1. 패턴 없는 catch문 작성(모든에러 처리위한) 또는
        - 2. 에러를 다른곳으로 던지도록 구현
     
     [ do-catch문 정리 ]
     - do블록에서 처리할 수 있는 모든에러 처리해야함
     - 처리하지 않은 에러 다른코드로 전파될 수 있도록 구현(throws)
     */
}

try handleError()
