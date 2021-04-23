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
 # Arithmetic Operators
 */

let a = 12
let b = 34

/*:
 ## Unary Plus Operator
 ````
 +a
 ````
 */
//단항연산자
+a
+b

/*:
 ## Addition Operator
 ````
 a + b
 ````
 */

a + b

/*:
 ## Unary Minus Operator
 ````
 -a
 ````
 */

-a

/*:
 ## Subtraction Operator
 ````
 a - b
 ````
 */

a - b

/*:
 ## Multiplication Operator
 ````
 a * b
 ````
 */

a * b

/*:
 ## Division Operator
 ````
 a / b
 ````
 */
a
b
a / b
b / a

let c = Double(a)
let d = Double(b)

c / d
d / c
/*:
 ## Remainder Operator (Modulo Operator)
 ````
 a % b
 ````
 */
//모듈러 연산자라고도 함
a % b
//c % d 나머지 연산자는 정수만 가능
c.truncatingRemainder(dividingBy: d)
/*:
 ## Overflow
 */

let num: Int8 = 9 * 9
// 저장 한도 초과, 자료형범위가 큰걸 사용하거나 범위 지정전에 값을 미리 확인해 볼 것

