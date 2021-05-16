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
 # Raw String
 */
/*
 " : 문자열 시작, 끝 표현
 / : 이스케이프 시퀀스
 */

var str = "\"Hello\", Swift"
var rawStr = #""Hello", Swift"#

str = "Lorem\nIpsum" //rawStr = #"Lorem\nIpsum"#
rawStr = #"Lorem\#nIpsum"#
rawStr = ###"Lorem\###nIpsum"###

// 보간문법
let value = 123
str = "The value is \(value)"
rawStr = #"The value is \#(value)"#

var non = "======"
print("\(non) str \(non)")
print(str + "\n")

print("\(non) raw str \(non)")
print(rawStr + "\n")

// 정규식 문자열
var zipCodeRegex = "^\\d{3}-?\\d{3}$" // 우편번호 정규식
zipCodeRegex = #"^\d{3}-?\d{3}$"# // 우편번호 정규식

let zipCode = "123-456"
if let _ = zipCode.range(of: zipCodeRegex, options: [.regularExpression]) {
    print("valid")
}
