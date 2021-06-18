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
 # Substring
 */
let str = "Hello, Swift"
let l = str.lowercased()
var first = str.prefix(1)
// String.SubSequence == Substring / ctrl, cmd click 선언부 내용확인
// 서브스트링 : 원본문자열의 메모리 공유
// 값 읽을 때 : 원본 메모리 공유
// 변경시점에서 새로운 메모리 생성

first.insert("!", at: first.endIndex) // 원본문자열 바꿈, 추가 시점에서 새로운 메모리 생성
str
first // Copy-on-write Optimization

let newStr = String(str.prefix(1)) // 새로운 문자열 메모리 할당 및 바로 생성
//let s = str[str.startIndex ..< str.index(str.startIndex, offsetBy: 2)]
let s = str[..<str.index(str.startIndex, offsetBy: 2)] // one sided range = 단항연산자 이용

str[str.index(str.startIndex, offsetBy: 2)...]

let lower = str.index(str.startIndex, offsetBy: 2)
let upper = str.index(str.startIndex, offsetBy: 5)
str[lower ... upper]
