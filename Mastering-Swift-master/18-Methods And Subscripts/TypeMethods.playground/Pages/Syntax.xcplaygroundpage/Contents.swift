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
 # Type Methods
 ![static-func](static-func.png)
 ![class-func](class-func.png)
 ![call](call.png)
 */
/*
 인스턴스 메소드
 타입 메소드 : 형식에 연관된 메소드
 
 구현 : 클래스, 구조체, 열거형
 
 1] static  : 오버라이딩 금지
 2] class   : 서브클래스에서 오버라이딩 허용시 사용
 */

class Circle {
    static let pi = 3.14
    var radius = 0.0
    func getArea() -> Double {
        return radius * radius * Circle.pi
    }
    class func printPi() { // 타입 메소드 : 타입속성에 static키워드 없이 바로 접근, 인스턴스 멤버 직접접근 불가능
        print("parent class\t- Circle\t\t: \(pi)")
    }
}

Circle.printPi()

class StrokeCircle: Circle {
    override static func printPi() {
    // 스태틱으로 선언한 메소드 서브클래스에서 오버라이딩 XXX
    // 인스턴스 메소드도 동일
        print("subclass\t\t- StrokeCircle\t: \(pi)")
    }
}
StrokeCircle.printPi()
