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
 # Iterating Collections
 
 ## for-in
 ![for-in](for-in.png)
 */
// 컬렉션 열거 뜻 : 저장된 요소로 반복작업 수행 -> 배열, 딕셔너리, 셋

print("Array", "================")
let arr = [1, 2, 3]
for num in arr {
    print(num)
}

print("Set", "================") // 정렬되지 않은 컬렉션, 열거순서는 그때마다 달라짐
let set: Set = [1, 2, 3]
for num in set {
    print(num)
}

print("Dictionary", "================") // 정렬되지 않은 컬렉션, 열거순서는 그때마다 달라짐
let dict = ["A":1, "B":2, "C":3]
for (key, value) in dict {
    print(key, value)
}

//: [Next](@next)
