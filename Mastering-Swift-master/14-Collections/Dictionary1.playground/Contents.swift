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
import Foundation
/*:
 # Dictionary
 ## Dictionary Literal
 ![dictliteral](dict-literal.png)
 */
// unordered, key: unique, value: 같아도 됨,
// (키, 값) 자료형이 일치 해야함
var dict = ["A": "Apple", "B": "Banana"]
dict = [:] // 빈 딕셔너리 -> 콜론

/*:
 ## Dictionary Type
 ![type1](dict-type.png)
 ![type2](dict-type2.png)
 */
let dict1: Dictionary<String, Int> // 정식문법
let dic2: [String:Int] // 단축문법

/*:
 ## Creating a Dictionary
 */
let words = ["A": "Apple", "B": "Banana", "C": "City"]
let emptyDict: [String: String] = [:]
// 리터럴이용한 생성 추론값이 없어 에러

// 단축문법 -  생성자 이용 빈 딕셔너리 생성
let emptyDict2 = [String: String]()

// 정식문법 -  생성자 이용 빈 딕셔너리 생성
let emptyDict3 = Dictionary<String, String>()

/*:
 ## Inspecting a Dictionary
 */
// 저장된 요소의 수 확인, 배열과 동일
words.count
words.isEmpty

/*:
 ## Accessing Keys and Values
 */
// 저장된 요소 접근, 서브스크립트 문법
words["A"] // 키를 전달
words["Apple"] // 값 바로검색 불가능, 키로만 가능

let a = words["E"]
let b = words["E", default: "Empty"]

for k in words.keys.sorted() {
    print(k)
}

for v in words.values {
    print(v)
}

let keys = Array(words.keys)
let values = Array(words.values)
