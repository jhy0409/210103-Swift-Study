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
 # Comparing Dictionaries
 */
let a = ["A": "Apple", "B": "Banana", "C": "City"]
let b = ["A": "Apple", "C": "City", "B": "banana"]
// 정렬되어있지 않기때문에 키와 값이 같으면 같은 딕셔너리로 판별
a == b
a != b
//a.elementsEqual(b) { (lhs, rhs) -> Bool in
//    print(lhs.key, rhs.key)
//    return lhs.key.caseInsensitiveCompare(rhs.key) == .orderedSame && lhs.value.caseInsensitiveCompare(rhs.value) == .orderedSame
//}
let aKeys = a.keys.sorted()
let bkeys = b.keys.sorted()

aKeys.elementsEqual(bkeys) { (lhs, rhs) -> Bool in
    guard lhs.caseInsensitiveCompare(rhs) == .orderedSame else {
        return false
    }
    
    guard  let lv = a[lhs], let rv = b[rhs], lv.caseInsensitiveCompare(rv) == .orderedSame else {  return false
    }
    print(lhs, rhs); print(lv, rv); return true
}
/*:
 # Finding Elements
 */
var words = ["A": "Apple", "B": "Banana", "C": "City"]
let c: ((String, String)) -> Bool = {
    $0.0 == "B" || $0.1.contains("i")
}

words.contains(where: c)
let r = words.first(where: c) // 옵셔널 튜플
r?.key
r?.value

words.filter(c)
