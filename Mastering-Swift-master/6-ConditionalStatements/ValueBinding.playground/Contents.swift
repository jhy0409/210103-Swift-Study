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
 # Value Binding Pattern
 ## Syntax
 ![value-binding](value-binding.png)
 */
// 매칭대상 상수나 변수로 바인딩한 후 case블록에서 활용

let a = 1

switch a {
case var x where x > 100:
    x = 200
    print(x)
    
default:
    break
}
//a를 x로 바인딩, a상수 값 x에 복사
//바인딩된 상수는 케이스문 내부에서만 사용가능, 다른 케이스 블록에서도 사용불가능

let pt = (1, 2)
// 튜플매칭에서 자주 사용
switch pt {
case let(x, y):
    print(x, y)
case (let x, let y):
    print(x, y)
case (let x, var y):
    print(x, y)
case let(x, _):
    print(x)
}














