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
 # Initialization
 
 ## Default Initializer
 */
/*
 생성자 새로운 인스턴스 생성하는 특별한 메소드
 
 - 구조체, 열거형, 클래스로 생성한 것 -> 인스턴스
 - 초기화 : 인스턴스 생성 -> 이니셜라이저 : 초기화 담당
 
 [기본값 초기화]
 인스턴스 정상 초기화 -> (완려후) 모든속성 기본값 가진다.
 없으면 초기화 실패 인스턴스 생성안됨
 
 초기화 방법 2가지
 1. 선언과 동시에 기본값 저장
 2. 이니셜라이저에서 초기화
 */

class Position {
    var x = 0.0 // 항상 동일한 값일때 초기화방법
    var y: Double = 0
    var z: Double? = nil // 값 미저장시 자동으로 nil로 초기화
    
    init() { // 파라미터로 초기화 할 때방법
        y = 0.0
    }
    // 기본값이 있고 생성자구현이 안돼있을 때 기본생성자 제공됨(default값)
    // init() { }
    // 생성자 만든 후에는 기본값 사용할 수 없으므로 직접 구현해야함
}

let p = Position()
let gab = p.x
print(gab)

/*:
 ## Initializer Syntax
 ![initializer](initializer.png)
 ![call](call.png)
 */
class SizeObj {
    var width = 0.0
    var height = 0.0
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    convenience init(value: Double) { // 생성자 중복제거, 다른 생성자 호출
        self.init(width: value, height: value) // initializer Delegation
    }
    // 오버로딩 지원, 파라미터 수, 자료형, argument lable로 구분 (이름, 리턴형 X)
}

/*:
 ## Memberwise Initializer
 */
// 파라미터로 모든속성 초기화
struct SizeValue {
    var width = 0.0
    var height = 0.0
}

let s = SizeValue()
SizeValue(width: 1.2, height: 3.4) // 기본 생성자
