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
 # Comparing Sets
 */

var a: Set = [1, 2, 3, 4, 5, 6, 7, 8, 9]
var b: Set = [1, 3, 5, 7, 9]
var c: Set = [2, 4, 6, 8, 10]
let d: Set = [1, 7, 5, 9, 3]

a == b
a != b
b == d
b.elementsEqual(d) // 저장된 요소 순서대로 비교

// 부분집합
a.isSubset(of: a)
a.isStrictSubset(of: a)
b.isSubset(of: a) // 부분집합
b.isStrictSubset(of: a) // 진부분집합

a.isSuperset(of: a) // 상위집합
a.isStrictSuperset(of: a) // 진상위집합
a.isSuperset(of: b)
a.isStrictSuperset(of: b)

a.isSuperset(of: c)
a.isStrictSuperset(of: c)

// 교집합
a.isDisjoint(with: b) // 교집합 일 때 F
a.isDisjoint(with: c)
b.isDisjoint(with: c) // 교집합 없는 서로수집합 T

/*:
 # Combining Sets
 */
a = [1, 2, 3, 4, 5, 6, 7, 8, 9]
b = [1, 3, 5, 7, 9]
c = [2, 4, 6, 8, 10]

// 집합연산
var result = b.union(c) // 합집합
result = b.union(a) // 원본 두고, 새로운 셋 리턴
b.formUnion(c) // Form 원본을 직접변경, 셋을 가변으로 선언
b
a = [1, 2, 3, 4, 5, 6, 7, 8, 9]
b = [1, 3, 5, 7, 9]
c = [2, 4, 6, 8, 10]

result = a.intersection(b) // 교집합 새 셋으로 리턴
result = c.intersection(b)
a.formIntersection(b)
a
b.formIntersection(c)
b

a = [1, 2, 3, 4, 5, 6, 7, 8, 9]
b = [1, 3, 5, 7, 9]
c = [2, 4, 6, 8, 10]

// 여집합
result = a.symmetricDifference(b)
result = c.symmetricDifference(b)
a.formSymmetricDifference(b)

a = [1, 2, 3, 4, 5, 6, 7, 8, 9]
b = [1, 3, 5, 7, 9]
c = [2, 4, 6, 8, 10]

// 차집합
result = a.subtracting(b)
a
a.subtract(b) // 원본바꾸기
a
