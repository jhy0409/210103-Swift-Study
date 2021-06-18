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
 # Appending Strings and Characters
 */
// 7-StringEditing1 / 문자열 편집1
// 문자열 연결
var str = "Hello"
str.append(", ") // 대상 문자열 직접 변경
str

let s = str.appending("Swift") // ing, ed : 원본 그대로 두고 연결 후 새로운 문자열 리턴, 상수, 변수 상관 X
str
s

// s.append("D") 직접 변경시 변수로 선언해야함
s.appending("!!!")
s
"File size is".appendingFormat("%.1f", 12.3456)
var str2 = "Hello Swift"
str2.insert(",", at: str2.index(str2.startIndex, offsetBy: 5))

if let sIndex = str2.firstIndex(of: "S") {
    str2.insert(contentsOf: "Awesome ", at: sIndex)
}
str2

//: [Next](@next)
