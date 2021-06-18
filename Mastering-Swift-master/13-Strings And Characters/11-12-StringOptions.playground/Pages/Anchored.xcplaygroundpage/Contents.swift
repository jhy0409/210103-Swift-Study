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
 # Anchored Option
 */
// 검색부분을 문자열 시작이나 마지막으로 제한
let str = "Swift Programming"

if let result = str.range(of: "Swift") {
    print(str.distance(from: str.startIndex, to: result.lowerBound))
} else {
    print("not found")
}

if let result = str.range(of: "Swift", options: .backwards) {
    print(str.distance(from: str.startIndex, to: result.lowerBound))
} else {
    print("not found")
}

if let result = str.range(of: "Swift", options: .anchored) {
    print(str.distance(from: str.startIndex, to: result.lowerBound))
} else {
    print("not found")
}

if let result = str.range(of: "Swift", options: [.anchored, .backwards]) {
    print(str.distance(from: str.startIndex, to: result.lowerBound))
} else {
    print("not found")
}

str.lowercased().hasPrefix("swift")

if let _ = str.range(of: "swift", options: [.anchored, .caseInsensitive]) {
    print("same prefix")
}


str.hasSuffix("Programming")

if let _ = str.range(of: "Programming", options: [.anchored, .backwards, .caseInsensitive]) {
    print("same suffix")
}


//: [Next](@next)
