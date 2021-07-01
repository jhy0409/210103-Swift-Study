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
 # Associated Types
 ![associatedtype](associatedtype.png)
 */
/*
 프로토콜 내에서 실제 형식으로 대체되는 연관 형식을 선언하는 방법에 대해 공부합니다.
 
 - 제네릭 프로토콜
 - Associated Types
 - typealias 를 통한 실제 형식 선언
 - 연관 형식에 제약 추가
 
 프로토콜에서 사용하는 플레이스 홀더 형식, 요구사항 선언은 아님
 */
protocol QueueCompatible {
    associatedtype Element: Equatable
    func enqueue(value: Element)
    func dequeue() -> Element?
}

/*:
 ## typealias AssociatedTypeName = Type
 */
/*
 연관형식 대체하는 실제형식 -> 프로토콜 채용형식에 따라 결정됨
 */

class IntegerQueue: QueueCompatible {
    typealias Element = Int // 주로 생략하는 편
    
    func enqueue(value: Int) {
    }
    func dequeue() -> Int? {
        return 0
    }
}

// 연관형식 생략 : 사용된 실제형식으로 연관형식 추론하기때문에 생략해도 문제 X
class DoubleQueue: QueueCompatible {
    func enqueue(value: Double) {
    }
    
    func dequeue() -> Double? {
        return 0.0
    }
}
