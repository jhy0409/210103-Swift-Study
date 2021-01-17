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
 # For-In Loops
 */
print("hello")
print("hello")


/*:
 ## Syntax
 ![syntax](syntax-range.png)
 */
// loopConstant : 반복 상수
// in Range(범위연산자로 지정), 반복상수 자료형: lower, upperBound와 동일

// 반복상수 생략하는 것 : Wildcard Pattern(언더스코어 문자 생략)
for _ in 1...5 {
    print("hello")
}

let power = 10
var result = 1

for _ in 1...power {
    result *= 2
}

result

// to: 종료범위, 실제범위에 포함x, ~9까지, by: 2씩 증가
for num in stride(from: 0, to: 10, by: 2){
    print(num)
}
/*:
 ## Syntax
 ![syntax](syntax-collection.png)
 */
// 배열이나 딕셔너리 같은 컬렉션 반복가능
// 컬렉션 열거: 컬렉션 포함된 요소 반복하는 것

let list = ["Apple", "Banana", "Orange"]
for fruit in list {
    print(fruit)
}

for i in 2...9 {
    for j in 1...9 {
        print("\(i) * \(j) = \(i * j)") // 스트링 인터플레이션 문법
    };print();
}
