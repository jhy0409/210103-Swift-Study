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
//: [Previous](@previous)

import Foundation

/*:
 # Removing Substrings
 */
// 특정 문자나 범위 삭제
var str = "Hello, Awesome Swift!!!"
let lastCharIndex = str.index(before: str.endIndex)
var removed = str.remove(at: lastCharIndex)

removed
str

removed = str.removeFirst()
removed
str

str.removeFirst(2)
str

str.removeLast()
str

str.removeLast(2)
str

if let range = str.range(of: "Awesome") {
    str.removeSubrange(range)
    str
}

str.removeAll() // 파라미터 없으면 메모리공간도 함께 삭제
str

str.removeAll(keepingCapacity: true) // 초기화 후 다른문자 다시 저장시 메모리 유지하는게 좋음, --> 빈문자열, 메모리 삭제 X

str = "Hello, Awesome Swift!!!"

var substr = str.dropLast() // substring = 원본의 메모리 공유
substr = str.dropLast(3)

substr = str.drop(while: { (ch) -> Bool in
    return ch != ","
})

substr
