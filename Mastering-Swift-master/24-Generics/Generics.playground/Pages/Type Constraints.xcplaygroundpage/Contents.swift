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
 # Type Constraints
 ![type-constraints](type-constraints.png)
 */
/*
 형식제약
 대체할 수 있는 타입 클래스와 클래스 상속한 클래스로 제한됨
 프로토콜 채용형식으로 제한
 */
func swapValue<T: Equatable>(lhs: inout T, rhs: inout T) {
    // 비교값이 같다면 리턴
    // (대체형식 제한 없음)
    // 비교기능 구현되지않은 전달값 파라미터로 올 수 있으므로 제한둬야함
    if lhs == rhs { return } //형식제약, 동등연산자로 비교할 수있는 값만 전달할 수 있게 됨
    let tmp = lhs
    lhs = rhs
    rhs = tmp
}
//: [Next](@next)
