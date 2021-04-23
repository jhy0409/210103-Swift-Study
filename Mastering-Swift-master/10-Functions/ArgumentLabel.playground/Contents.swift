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
 # Argument Label
 */

/*:
 ## Syntax
 ![arg1](arg1.png)
 ![arg2](arg2.png)
 */
// 함수이름 가독성 높이려고 사용, 함수이름은 동사,
// 인자레이블은 전치사 주로 사용(to, in, with...)

func sayHello(name: String) {
   print("Hello 1, \(name)")
}

sayHello(name: "Swift")

func sayHello(to name: String) {
    print("Hello 2, \(name)")
}
sayHello(to: "Swift")

func sayHello(_ name: String){
    print("Hello 3, \(name)")
}
sayHello("Swift")
// 컨트롤 커맨드키 상태에서 클릭 -> 구현된 함수설명으로 이동
