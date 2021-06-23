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
 # Inheritance
 ![inheritance](inheritance.png)
 */
/*
 상속
 
 교통수단
 공통특징
 
 탑승인원 속성
 1. 네개의 클래스, 개별선언 -> 코드중복
 문제 : 따로 다 고쳐야함 > 속성이름이나 형식(Type or etc) 변경
 
 2. 상속클래스
 - 모든 클래스 상속받는 클래스 선언
 - 속성 추가
 
 상속관계의 클래스   : 클래스 계층을 구성
 최상위           : Root, Base, Parent, Super class
 상속받는 하위 클래스 : Child Class, Sub Class
 
 --- * 베이스 -> 하위 서브클래스 존재하지만 슈퍼클래스는 꼭 상속하지 않아도 됨
 Objective-C : 모든클래스 상속해야 함 (NSObject)
 Swift       : 제약이 없음
 
 [가능]
 - 여러 서브 클래스가 공통 super class 상속
 
 [불가능]
 - 두개이상의 슈퍼클래스 상속(다중상속 미지원) -> 프로토콜 활용하여 지원
 
 * Subclassing   : 다른클래스 상속
 - 오버라이딩(재정의) : 구현수정
 */


// Base Class - 도형 추상화 클래스
class Figure {
    var name = "Unknown"
    
    init(name: String) {
        self.name = name
    }
    
    func draw() {
        print("draw \(name)")
    }
}

class Circle: Figure {
    var radius = 0.0
}

let c = Circle(name: "Circle") // 부모클래스의 생성자 및 멤버 상속받음
c.radius
c.name // 부모클래스
c.draw() // 부모클래스

/*:
 ## final class
 ![final class](final-class.png)
 */
// 상속 금지
final class Rectangle: Figure { // 사각형 < 도형, 다른클래스에서 상속받는건 가능
    var width = 0.0
    var height = 0.0
}

// 정사각형 < 사각형 < 도형
// -------------------> final클래스에서 상속하는건 금지 됨
//class Sqare: Rectangle {
//}





