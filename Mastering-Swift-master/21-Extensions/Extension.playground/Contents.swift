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
 # Extension
 ![syntax](extension.png)
 ![syntax2](extension-protocol.png)
 */
/*
 extensions : 형식 확장, 멤버(속성, 메소드, 생성자)를 형식에 추가
 
 1. 확장가능 : Class, Structure, Enumeration, Protocol
     - 새로운 멤버 추가 : 별도의 코드조각으로 구현, 형식 연관시켜 기존멤버와 함께사용
     - 형식선언 포함코드 수정할 수 없는경우에도 가능
     ex) 구조체로 구현된 Int, String
     
     - 기존멤버 수정은 불가능, 단 확장 가능
     - 가능   : add member
     - 불가능 : overriding Member -> 필요한 경우 : 상속을 통해 sub classing
 
 2. 추가가능 속성
     - 계산속성 제한
     - 인스턴스, 타입메소드
     - 클래스 확장시 간편생성자만 추가
 
     [불가능]
     - 저장속성 (stored property
     - 속성감시자 (property observer)
     - 지정생성자(designated initializer), 소멸자(deinitializer) -> 원본 형식에서만 구현 or 추가하려면 subclassing
     - 생성자 추가시 delegation 정상실행되도록 구현해야함
 */
struct Size {
    var width = 0.0
    var height = 0.0
}

extension Size {
    var area: Double {
        return width * height
    }
}

let s = Size()
s.width
s.height
s.area

// 비교기능 구현 시 Equatable 프로토콜 채용
extension Size: Equatable {
    public static func == (lhs: Size, rhs: Size) -> Bool {
        return lhs.width == rhs.width && lhs.height == rhs.height
        // 프로토콜의 연산자 메소드 구현 -> 인스턴스를 비교할 수 있음
        // 익스텐션으로 프로토콜 구현 추가할 수 있음
    }
}
