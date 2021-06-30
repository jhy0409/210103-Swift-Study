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
 # Generics
 */
/*
 
 특정 형식과 연관되지 않은 함수를 구현하는 방법에 대해 공부합니다.

 - 제네릭 함수
 - Type Parameters
 - Type Constraints
 - Specialization
 
 형식에 의존하지 않는 범용코드 작성ㅇ
 코드 재사용성성, 유지보수 편이성 ↑
 */
func swapInteger(lhs: inout Int, rhs: inout Int) {
   let tmp = lhs
   lhs = rhs
   rhs = tmp
}

var a = 10
var b = 20

swapInteger(lhs: &a, rhs: &b)
a
b


func swapInteger16(lhs: inout Int16, rhs: inout Int16) {
   // ...
}

func swapInteger64(lhs: inout Int64, rhs: inout Int64) {
   // ...
}

func swapDouble(lhs: inout Double, rhs: inout Double) {
   // ...
}


/*:
 ## Generic Function
 ![generic-function](generic-function.png)
 */
// 형식에 관계없이 모든 값을 파라미터로 전달가능
func swapValue<T>(lhs: inout T, rhs: inout T) {
   let tmp = lhs
   lhs = rhs
   rhs = tmp
}
/*
 <T> -> 타입 파라미터
    - 함수내부에서 파라미터 형식이나 리턴형으로 사용됨
    - 함수바디에서 사용 가능
    - T나 다른이름 사용해도 문제 없음
 
    - 형식이름으로 사용하므로 upper camel case로 선언
    - 타입 2개이상 선언 가능
 */

a = 1
b = 2
swapValue(lhs: &a, rhs: &b)
a
b

var c = 1.2
var d = 3.4
swapValue(lhs: &c, rhs: &d)
c
d
// 컴파일러가 전달한 형식에 적합한 코드 자동 생성함 -> T가 int면 int로 대체코드 생성
// 형식관련없이 하나의 구현으로 모든 자료형 처리

// T : 실제 자료형으로 대체되는 placeholder
//: [Next](@next)


