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
 # Initializer Requirements
 ![init](init.png)
 */
/*
 프로토콜에서 생성자를 선언하고 형식에서 요구사항을 구현합니다.

 - 구조체와 클래스에서 생성자 구현의 차이
 - final 클래스에서 프로토콜 구현
 - 상속과 중복 선언 오류
 - Non-failable Initializer와 Failable Initializer
 
 1. 헤드만 작성, 바디 생략
 */

protocol Figure {
    var name: String { get }
    init(n: String)
}

struct Rectangle: Figure {
    var name: String
    
    init(n: String) {
        name = n
    }
}
/*
 memberwise initializer : 속성이름과 동일한 argument lable가지고 있는데
 프로토콜의 생성자와 동일
 
 속성이름 ≠ lable -> 직접 구현해야함
 */

class Circle: Figure {
    var name: String
    
    required init(n: String) {
        name = n
    } // required initializer : 상속고려, 모든 서브클래스에서 프로토콜 요구사항 충족해야함
}


// 예외사항
final class Triangle: Figure { // 상속안되는 클래스, 상속고려하지 않으므로 required 키워드 불필요
    var name: String
    
    init(n: String) {
        name = n
    }
}

// 상속 멤버로 자동으로 요구사항 충족 Circle: Figure
class Oval: Circle {
    /*
     중복선언으로 에러
     class Oval: Circle, Figure {
     
     super class로부터 프로토콜(figure) 채용중인데, +Figure 채용 불가능
     */
    
    var prop: Int
    init() { // 프로토콜의 생성자, 파라미터 목록과 불일치 -> 요구사항 미충족
        prop = 0
        super.init(n: "Oval")
    }
    
    required convenience init(n: String) { // 프로토콜 선언과 동일한 생성자 구현
        self.init()
    } // 꼭 지정생성자로 구현 X, 단 required키워드 필요
}

protocol GrayScale {
    init?(white: Double)
    // 프로토콜에서 failable -> nonF, F 모두 요구사항 충족 -> ?, !, 없는 것 다 가능
}

struct Color: GrayScale {
    init!(white: Double) { // 해당 생성자: 옵셔널 컬러 인스턴스 생성
        // 요구사항 충족시키지만 초기화 실패시 런타임오류
    }
}

