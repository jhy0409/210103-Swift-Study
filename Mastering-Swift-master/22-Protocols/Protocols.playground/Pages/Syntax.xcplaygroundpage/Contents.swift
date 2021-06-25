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
 # Defining Protocols
 ![define](define.png)
 ![protocol-inheritance](protocol-inheritance.png)
 */
/*
 형식에서 공통적으로 제공하는 멤버 목록 // 자바, 씨샵의 인터페이스와 유사
 
 [Protocol]                                 [Type]
 - Declaration                            Implementation
 - Declaration  -- Adopting Protocols* -> Implementation // * : 프로토콜을 따른다, 채용한다.
 - Declaration                            Implementation
 
 Protocol : 구현해야하는 멤버 선언돼 있음, Declarations(= 요구사항)
 실제 구현은 Type(형식에서)
 
 ==========================
 - 선언만 오고 구현은 X
 - 상속지원, 클래스 상속문법과 동일
 - 다중상속 허용
 */

protocol Something {
    func doSomething()
}

/*:
 # Adopting Protocols
 ![adopting](adopting.png)
 */
/*
 프로토콜 채용문법
 프로토콜 채용시 명시적으로 선언
 
 - 클래스 : super class, Protocol같이 상속받으면 항상 슈퍼클래스 먼저 나열
 */

struct Size: Something {
    func doSomething() { // 메소드 헤드만 프로토콜 선언과 일치,
        // 메소드 바디는 자유롭게 구현가능
    }
}

/*:
 # Class-Only Protocols
 ![class-only](class-only.png)
 */
/*
 클래스 전용 프로토콜 선언 : 구조체, 열거형에서는 프로토콜 채용 불가능
 */

protocol SomethingObject: AnyObject, Something {
}

class Object: SomethingObject {
    func doSomething() {
    }
}

/*
 struct Value: SomethingObject {
 // errorMsg : 비 클래스 유형 'Value'는 클래스 프로토콜 'SomethingObject'를 준수 할 수 없습니다.
 }
 */
