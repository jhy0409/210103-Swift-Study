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
 # Adding Elements
 */
// 배열 편집
var alphabet = ["A", "B", "C"]
alphabet.append("E") // 마지막에 동일자료형 추가

alphabet.append(contentsOf: ["F", "G"])
alphabet.insert("D", at: 3)

alphabet.insert(contentsOf: ["a", "b", "c"], at: 0)
// 인서트는 인덱스 이동하므로 오버헤드 발생, 꼭 필요한 경우에만 사용 주로 append

// 배열 일부분 바꾸기
// 1- subscript 문법
alphabet[0...2] = ["x", "y", "z"]
alphabet

// 2- 메소드로 바꾸기
alphabet.replaceSubrange(0...2, with: ["a", "b", "c"])
alphabet

// 부분 교체
alphabet[0...2] = ["z"]
alphabet

// 부분 삭제
alphabet[0..<1] = []
alphabet

/*:
 # Removing Elements
 */
// 요소 삭제

alphabet = ["A", "B", "C", "D", "E", "F", "G"]
alphabet.remove(at: 2)
alphabet

alphabet.removeFirst()
alphabet

alphabet.removeFirst(2)
alphabet

alphabet.removeLast()
alphabet

alphabet.removeAll() // 인덱스, 배열이 비어있는지 확인 필요
alphabet.popLast() // 좀 더 안전한 코드

alphabet = ["A", "B", "C", "D", "E", "F", "G"]
alphabet.popLast()
alphabet

alphabet.removeSubrange(0...2)
alphabet

alphabet[0...2] = []
alphabet


