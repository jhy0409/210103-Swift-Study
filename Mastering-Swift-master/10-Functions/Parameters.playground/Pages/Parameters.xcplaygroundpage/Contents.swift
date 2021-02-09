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
 # Parameters
 ![define](define.png)
 ![param](param.png)
 */
func add(a: Int, b: Int) -> Int {
    return a + b
}
// 전달하는 값을 파라미터라고 함, 함수바디에서 사용하는 임시상수
/*:
 ## Calling Functions
 ![call](call.png)
 */
add(a: 12, b: 34)
// 값이나 표현식으로 전달
// 포멀, actual 파라미터 = 아규먼트(인자)
/*:
 ## Default Value
 ![defval](defval.png)
 */
// 파라미터 기본값 선언(파라미터 생략, 값 할당하면 됨)
func sayHello(to: String = "Stranger") {
    print("Hello, \(to)")
}

sayHello(to: "Swift")
sayHello()
// 파라미터의 스코프는 함수바디로 제한, 생성과 삭제 ->
// (life cycle) 함수호출 하면서 생성, 실행 완료 시 삭제

