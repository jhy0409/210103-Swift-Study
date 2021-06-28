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
 # Protocol Extension
 */
/*
 프토토콜 익스텐션을 통해 공통 구현을 제공하는 방법에 대해 공부합니다.

 - 프로토콜 확장
 - 멤버 우선순위
 - 멤버 추가 형식 제한
 
 1] extension : 형식 확장,
    -> 프로토콜도 형식이므로 확장 가능
 
 1]시 프로토콜 확장한 모든 형식에 기본구현 제공할 수 있음
    - 문법 : 프로토콜에 구현 추가
    - 실제 : 프로토콜 채용한 형식에 구현이 추가됨
 
    - 장점 : 코드 중복을 줄이고 프로토콜 요구사항 충족시킴
 */

protocol Figure {
    var name: String { get }
    func draw()
}
/*
 where Self 4]: Equatable 5]
 4] : 프로토콜 채용한 형식
 4]가 5]채용하고 있으면 true
 
 제한적 채용 : 5]와 Figure프로토콜 채용해야 -> extension에서 구현된 제한멤버 사용 가능
 */

extension Figure where Self: Equatable {
    func draw() { // 2]
        print("draw figure")
    }
}

struct Rectangle: Figure, Equatable {
    var name = ""
    // func draw() 기본메소드 구현 및 현재 구조체에 자동 추가됨
    
    /*
     func draw() { // 3], -> 2]의 메소드와 동일하고 **extensiong으로 추가**한 2]가 그냥 무시됨
     // -> 우선순위 : 형식에서 직접 구현한 멤버 > **로 추가된 멤버
     // protocol extension 프로토콜 채용한 모든형식에 멤버 추가
     print("draw rectangle")
     }
     */
}

let r = Rectangle()
r.draw()
