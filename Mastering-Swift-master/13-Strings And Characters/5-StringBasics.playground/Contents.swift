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
 # String Basics
 */
// 문자열 기초
var str = "Hello, Swift String"
var emptyStr = "" // 빈 문자열
emptyStr = String() // 생성자 호출, 파라미터 미전달 => 길이 0인 빈 문자열 생성

// 문자열 생성자 : 다른값 문자열로 바꿀 때 사용
let a = String(true)
let b = String(12)
let c = String(12.34)
let d = String(str)
let hex = String(123, radix: 16) // 16진수 문자
let octar = String(123, radix: 8)
let binary = String(123, radix: 2)

let repeatStr = String(repeating: "👏", count: 7)
let unicodeScr = "\u{1f44f}"
let e = "\(a) \(b)" // 문자열 연결
let f = a + " " + b

str += "!!" // 복합할당 연산자 사용
str.count //문자열 길이 확인
str.isEmpty // str.count == 0
str == "Apple" // 문자열 비교
"apple" != "Apple"
"apple" < "Apple" // 사전순서로 비교, 같은경우 문자코드로 비교

str.lowercased() // ed or ing : 원본 두고 바꾼 새로운 값 리턴
str.uppercased() // 대문자
str
"apple ipad".capitalized // upper camel case 문자로 변환
str.capitalized // 각 단어문자 대문자로 바꿈

// 문자 = 문자열 집합(character sequence)
for char in "Hello" {
    print(char)
}

let num = "1234567890"
num.randomElement()
num.shuffled() // 문자 랜덤 섞고 문자배열로 리턴
