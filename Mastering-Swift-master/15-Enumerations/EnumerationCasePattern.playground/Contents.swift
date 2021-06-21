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
 # Enumeration Case Pattern
 ![enum-case](enum-case.png)
 */
/*
 연관값 가진 열거형 케이스 매칭
 사용 : switch, if, guard, for in, while
 */

// 연관값 개별 바인딩
enum Transporation {
    case bus(number: Int)
    case taxi(company: String, number: String)
    case subway(lineNumber: Int, express: Bool)
}
var tpt = Transporation.bus(number: 7)

switch tpt {
case .bus(let n):
    print(n)
case .taxi(let c, var n): // 번호 생략하려면 와일드카드 패턴(case .taxi(let c, _):)
    print(c, n)
case let .subway(l, e): // 연관값을 동일형식으로 바인딩
    print(l, e)
}

tpt = Transporation.subway(lineNumber: 2, express: false)

// 2호선 확인, 급행여부 따라 코드 분기
if case let .subway(2, express) = tpt { // express => 바인딩
    if express { } else { }
}

print("\n급행만 확인 ============")
if case .subway(_, true) = tpt {
    print("express")
}

let list = [
    Transporation.subway(lineNumber: 2, express: false),
    Transporation.bus(number: 4412),
    Transporation.subway(lineNumber: 7, express: true),
    Transporation.taxi(company: "SeoulTaxi", number: "1234")
]

print("\n지하철만 ============")
for case let .subway(n, _) in list {
    print("subway \(n)")
}

print("\n급행만 ============")
for case let .subway(n, true) in list {
    print("subway \(n)")
}

print("\n부가조건 추가 where ============")
for case let .subway(n, false) in list where n == 2 {
    print("subway \(n)")
}
