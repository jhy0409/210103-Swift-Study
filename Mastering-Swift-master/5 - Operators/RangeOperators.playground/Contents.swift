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
 # Range Operators
 */
// 1 ~ 5, 4 ~ 2
// 범위 연산자

/*:
 ## Closed Range Operator
 ````
 a ... b
 a...
 ...a
 ````
 */
// 이항 연산자: , 단항 연산자 : 피연산자와 공백없이 붙여 씀
1 ... 10
// 1에서 10까지 범위 표현
// ~10까지 범위, closed -> 범위에 upperBound가 포함이 됨
// 실수도 가능 12.34 ... 56.78

(1 ... 10).reversed()
// 내림차순 범위

var sum = 0
for num in 1 ... 10 {
    num
    sum += num
}
sum
// 반복횟수를 범위연산자로 사용

let list =  ["A", "B", "C", "D", "E"]
list[2...]
list[...2]

// 무한루프 주의, 앱이 멈추거나 폰이 멈춤. ex) for num in 1... { print(num) }
// upperBound 생략하고 사용시 고정범위에서 사용할 것
/*:
 ## Half-Open Range Operator
 ````
 a ..< b
 ..<a
 ````
 */
// upperBound가 범위에 포함되지 않음
sum = 0
for num in 1 ..< 10 {
    sum += num
}
sum

list
list[..<2]

//for num in ..<10 {
//    print(num)
//}

// 단독 사용시 lowerBound 무한대
let range = ...5
range.contains(7)
range.contains(1)
range.contains(-1)
range.contains(Int.min)










