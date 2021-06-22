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
 # Property Observer
 ![property-observer](property-observer.png)
 */
/*
 속성감시자
 willset : 속성에 값 저장되기 직전 호출 (매개변수: 새로저장되는 값 기본(newValue))
 didset  : 값 저장된 직후, 이전값이 파라미터에 저장됨 (기본(oldValue))
 
 변수 저장속성에 추가 가능
 
 
 [ 추가 불가능 ]
 - 상수    : X
 - 지연    : (구현조건) 초기화 코드에서 구현
 - 계산속성 : (구현조건) set블록에서 구현
 
 - 예외    :
    - 서브클래스 계산속성 오버라이딩, 속성감시자 구현 가능
    - 기능수행 위해서는 willSet, didSet 둘 중 하나는 반드시 구현 해야함
 
 */
class Size {
    var width = 0.0 {
        willSet {
            print("willSet\t> 이전 : \(width) => 변경 :\(newValue)")
        }
        didSet {
            print("didSet\t> 이전 : \(oldValue) => 변경 :\(width)")
        }
    }
}

let s = Size()
s.width = 123
print()
s.width = 55
