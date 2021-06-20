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
 # Comparing Arrays
 */
// 배열 비교, 검색, 정렬

let a = ["A", "B", "C"]
let b = ["a", "b", "c"]

a == b
a != b
// ==, != : 개별요소, 저장순서 비교

a.elementsEqual(b)
a.elementsEqual(b) { (lhs, rhs) -> Bool in
    return lhs.caseInsensitiveCompare(rhs) == .orderedSame }


/*:
 # Finding Elements
 */
let nums = [1, 2, 3, 1, 4, 5, 2, 6, 7, 5, 0]
nums.contains(1)
nums.contains(8)

nums.contains { (n) -> Bool in
    return n % 2 == 0
}

// 인덱스 요소 직접 검색
nums.first { (n) -> Bool in
    return n % 2 == 0
}

nums.firstIndex { (n) -> Bool in
    return n % 2 == 0
}

nums.firstIndex(of: 1) // 값 전달하여 검색
nums.lastIndex(of: 1) // 검색된 요소의 마지막 인덱스


/*:
 # Sorting on Array
 */
// sort(동사형) : 배열을 직접 정렬
// sorted : 정렬된 새로운 배열을 리턴
nums.sorted()
nums
// 내림차순 정렬
nums.sorted { (a, b) -> Bool in
    return a > b
}

nums.sorted().reversed() // 새 배열생성 X, 배열 메모리 공유 역순열거가능한 형식 리턴
[Int](nums.sorted().reversed()) // 역순배열 생성 -> 배열생성자로 전달

var mutableNums = nums
mutableNums.sort() // 새로운 배열을 리턴하지 않음
mutableNums.reverse()
mutableNums

// 특정요소 교체
mutableNums.swapAt(0, 1)
mutableNums.shuffle()
mutableNums.shuffled()

mutableNums
