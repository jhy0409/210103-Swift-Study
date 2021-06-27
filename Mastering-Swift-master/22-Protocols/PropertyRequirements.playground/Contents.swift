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
 # Property Requirements
 ![property](property.png)
 */
/*
 프로토콜에서 속성을 선언하고 형식에서 요구사항을 구현

 - var 키워드 용법
 - 가변성 선언
 - static 키워드와 class 키워드
 
 ============================================
 
 프로토콜에서는 항상 var키워드로 선언
    1. 가변성과 상관없이 선언멤버가 속성인걸 나타냄
    2. 가변성 결정 : get, set이 결정
        - 둘 다 있음 : 읽기, 쓰기 가능
        - get만    : 읽기전용 속성
 */

protocol Figure {
    static var name: String { get set }
}

struct Rectangle: Figure {
    // 프로토콜에 선언된 속성을 추가, 속성이름은 반드시 name, 형식은 String
    // get만 있으므로 읽기만 가능하면 요구사항 충족됨
    static var name = "Rect" // 상수 저장속성 : 값 쓰기(set) 불가능
}

struct Triangle: Figure {
    static var name = "Triangle" // 최소요구사항, 꼭 읽기전용으로 선언 X
}

//struct Circle: Figure {
//    static var name: String { // 계산속성으로 선언, set이 있을 때 : get, set블록 필요
//        get {
//            return "Circle"
//        }
//        set {
//        }
//    }
//}

class Circle: Figure {
    // 형식속성, 이름, 자료형, 가변성 동일 -> 프로토콜 요구사항 충족, 오버라이딩 가능
    class var name: String { // 계산속성으로 선언, set이 있을 때 : get, set블록 필요
        // static : 상속되지만, overriding 불가능
        get {
            return "Circle"
        }
        set {
        }
    }
}

