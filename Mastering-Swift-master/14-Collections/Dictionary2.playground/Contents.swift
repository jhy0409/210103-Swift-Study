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
 # Adding Keys and Values
 */
var words = [String: String]()
words["A"] = "Apple"
words["B"] = "Banana"
words.count
words
words["B"] = "Ball" // 키 존재시 기존 저장값에서 교체, 없을 때 신규생성
words.count
words
words.updateValue("City", forKey: "C")
words.updateValue("Circle", forKey: "C") // 이전 저장값 리턴
words
/*:
 # Removing Keys and Values
 */
// 키 기준 삭제
words
words["B"] = nil // 키와 연관된 값 삭제
words
words["Z"] = nil // 존재하지 않는 값 삭제, 동작없이 종료 후 다음코드 실행

// 메소드 사용
words.removeValue(forKey: "A")
words.removeValue(forKey: "A")
words.removeAll()
