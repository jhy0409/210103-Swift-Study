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
 # In-Out Parameters
 */
// 입출력 파라미터
var num1 = 12
var num2 = 34
/*:
 ## Syntax
 ![inout-def](inout-def.png)
 ![inout-call](inout-call.png)
 */
func swapNumber(_ a: inout Int, with b: inout Int) {
    let tmp = a
    a = b
    b = tmp
}
num1
num2

swapNumber(&num1, with: &num2)

num1
num2

// 동일변수 두번전달 불가능
// swapNumber(&num1, with: &num1)

// 상수로 값 전달 불가능 (바꿀 수 없다 : immutable)
// let a = 12
// let b = 34
// swapNumber(&a, with: &b)

// literel 전달 불가능, 메모리 공간가진 변수를 전달해야 함
// swapNumber(&12, with: &34)

// 기본값 선언 불가능 ( 변수 및 리터럴 ), 함수 호출 시 상수전달 x
// func swapNumber(_ a: inout Int, with b: inout Int) {

// 가변파라미터에서 사용 불가능
// func sum(ouf nums: inout Int...){ }
