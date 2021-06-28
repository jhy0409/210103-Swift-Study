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
 # Optional Protocol Requirements
 ![optional](optional.png)
 */
/*
 옵셔널 형식이 아닌 선택적이란 뜻
 
 1] objc Attribute
 - 스위프트 코드 objective-C에서 사용할 수 있게 해주는 코드
 - @문자로 시작
 - 선언이나 형식에 부가적 속성(attribute) 선언할 때 사용
 
 2] optional modifier
 - 선택적 멤버 선언시 사용
 
 * = objective C
 */
protocol Drawable_1org { // 현재 선언된 모든 속성이 필수사항
    var strokeWidth: Double { get set }
    var strokeColor: UIColor { get set }
    func draw()
    func reset()
}

@objc protocol Drawable_2opt { // 현재 선언된 draw 메소드만 필수사항
    @objc optional var strokeWidth: Double { get set }
    @objc optional var strokeColor: UIColor { get set }
    func draw()
    @objc optional func reset()
}

/*
    1]로 선언한 프로토콜 -> objc 프로토콜
        - 클래스에서만 채용할 수 있음 (애니오브젝트 자동 상속되므로)
        - *과 swift간 호환성 위해 필요한 제한 (*는 구조체, 열거형에서 프로토콜 미지원)
 
    - 선택적 멤버 접근 : 옵셔널 체이닝
        -> 선택적 멤버로 선언 : 옵셔널 형식,
        -> non-O -> 존재하지 않는 멤버의 접근이므로 선택적 멤버 옵셔널 형식으로 대체 됨
 */

class Rectangle: Drawable_2opt {
    func draw() {
    }
}

let r: Drawable_2opt = Rectangle()
r.draw()
// 선택적 멤버(=옵셔널 형식) 접근시 옵셔널 체이닝 필요
r.strokeWidth
r.strokeColor

r.reset?()
