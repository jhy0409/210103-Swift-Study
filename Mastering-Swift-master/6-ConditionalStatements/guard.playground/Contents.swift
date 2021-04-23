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
 # guard
 ## Syntax
 ![guard-syntax](guard-syntax.png)
 */
// Early Exit 해당조건 없으면 일찍 종료
// guard 조건(boolean) else(생략 불가능, 코드의 실행을 중지해야함)
// 가드문 호출한 스코프 종료, if문은 중첩되면 코드 길어짐 / 가드문은 간결한 편

// 문자열 파라미터로 받아 불린 리턴함수
func validate(id: String?) -> Bool {
    guard let id = id else{
     return false
    }
    
    guard id.count >= 6 else {
        return false
    }
    
//    guard let id = id, id.count >= 6 else {
//        return false
//    }
    
    return true
}

validate(id: nil)
// nil: 빈 값, 코드실행 중지 > 제어가 호출된 곳으로 전달되었다.

validate(id: "abc")
validate(id: "swiftlang")

func validateUsingIf() {
    var id: String? = nil
    if let str = id {
        if str.count >= 6 {
            print(str)
        }
    }
}

func validateUsingGuard() {
    var id: String? = nil

    guard let str = id else { return }
    guard str.count >= 6 else { return }
    print(str)
}


