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
 # Designated Initializer
 ![designated](designated.png)

 # Convenience Initializer
 ![convenience](convenience.png)
 */
/*
 - 클래스에서 사용하는 이니셜라이저
 1] 지정생성자 : 메인, 모든속성 초기화
 2] 간편생성자
 
 ※ 클래스 : 생성자 실행 완료전 슈퍼클래스 - 1] 호출해야 함*
          * -> Initializer Delegation
 
 1]의 생성 수는 제한 없지만 보통하나만 만듦.
 - 기본생성자 사용 또는
 - super class에서 1]상속 시 직접 구현필요 X
    -> 그 외 최소 1개의 1]이 필요 (= 최소 1개의 모든속성 초기화하는 생성자가 필요)
 
 2] 다양한 초기화방법 구현위한 유틸리티 성격의 생성자
 - 모든속성 초기화 강제X, 필요한 것만 초기화 후 1] 호출하여 나머지 초기화 함
 
 - 이니셜라이저 상속
 */

class Position {
    var x: Double
    var y: Double
    
    init(x: Double, y: Double) { // 1]
        self.x = x
        self.y = y
    }
    
    convenience init(x: Double) {
        self.init(x: x, y: 0.0)
    }
}

// 과제
let pX = Position(x: 5) // 간편생성자 사용 2]
pX.x
pX.y

let pXY = Position(x: 8, y: 9) // 지정생성자 사용 1]
pXY.x
pXY.y


//: [Next](@next)

