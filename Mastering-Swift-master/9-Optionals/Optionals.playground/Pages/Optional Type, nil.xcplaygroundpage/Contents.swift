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

import UIKit
/*:
 # Optionals
 */
// 옵셔널 : 값을 가지지 않는 형식
let num = 1
let num2: Int // 값 저장 없이 자료형만 지정

// print(num)
// 변수와 상수는 값을 읽기전에 반드시 초기화 해야한다.

// 옵셔널 값 : 네트워크에서 값 받아서 저장할 경우(중간에 끊기는 등)
let num3: Int = 0
// 자료형은 항상문자로, 오타가 생길 수도 ㅇ, 바람직 X

let optionalNum: Int? = nil // = 값이 없다. 추론형식도 x
// objective C의 닐 : 존재하지 않는 객체에 대한 포인터
// 스위프트에서는 참조와 값형식에서 사용가능

/*:
 ## Optional Type
 ![optional-type-syntax](optional-type-syntax.png)
 */
let str: String = "Swift"
let optionalStr: String? = nil //읽을 때 : 옵셔널 스트링, nil저장가능, ?사용으로 값 저장하지 않는 형식으로 변경

let a: Int? = nil
let b = a
b
// 표현식 평가 값이 nil(없음) => 옵셔널 표현식
//: [Next](@next)
