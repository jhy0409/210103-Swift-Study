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
 # Array Basics
 ## Creating an Array
 */

let nums = [1, 2, 3]
let emptyArray: [Int] = [] // 추론 요소가 없음, 자료형 직접 지정

let emptyArray2 = Array<Int>() // 생성자 사용
let emptyArray3 = [Int]()

let zeroArray = [Int](repeating: 0, count: 3) // 배열만들고 기본값으로 채움

/*:
 ## Inspecting an Array
 */
nums.count
nums.count == 0
nums.isEmpty
emptyArray.isEmpty

/*:
 ## Accessing Elements
 */
// 배열요소 접근

let fruits = ["Apple", "Banana", "Melon"]
fruits[0]
fruits[2] // fruits[fruits.count - 1]
fruits[0...1]

fruits[fruits.startIndex]
fruits[fruits.index(before: fruits.endIndex)]

fruits.first
fruits.last

emptyArray.first
emptyArray.last

// emptyArray[0] <- 빈 배열이므로 에러
