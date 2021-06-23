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
 # Overriding
 */
/*
 오버라이딩(재정의) : 상속멤버를 서브클래스 맞게 구현
 
 - 서브클래스에서 슈퍼클래스의 동일한 멤버 구현
 - 가능 종류 : method, properties, subscripts, initializers
 - 구현 : 1. 부모클래스에서 새로운 코드 추가, 2. 무시하고 완전히 새로
 */

class Figure {
    var name = "Unknown"
    
    init(name: String) {
        self.name = name
    }
    
    final func draw() {
        print("[parent]\tFigure class - draw \(name)")
    }
}

class Circle: Figure {
    final var radius = 0.0 // 변수 저장속성 : 속성 오버라이딩, 프로퍼티 옵저버 추가가능
    var diameter: Double { // 읽기전용 속성
        return radius * 2
    }
    
    /*
     override func draw() {
     super.draw()
     print("[child]\t\tCircle class - draw재정의 : \(name)") // 상위구현 무시
     }
     */
}

let c = Circle(name: "Circle")
//c.draw()

class Oval: Circle {
    override var diameter: Double {
        get {
            return super.diameter
        }
        set {
            super.radius = newValue / 2
        }
        /*
         저장(var)속성에서만 사용가능 : 읽기 전용이므로 값 바뀌는거 감시 불가능
         willSet { print(newValue) }
         didSet { print(oldValue) }
         */
    }
    /*
     override var radius: Double {
     willSet {
     print(newValue)
     }
     didSet {
     print(oldValue)
     }
     
     //get {
     //    return super.radius
     //}
     //set {
     //    super.radius = newValue
     //}
     */
     //}
    // 속성 오버라이딩 : 계산속성이나 프로퍼티 옵저버로 구현
    /*
     오버라이딩
     
     [ 가능 ]
     - 읽기전용 -> 읽기, 쓰기(다른값을 설정해야함)
     - 읽기쓰기 -> 읽기, 쓰기 반드시 둘 다 구현
     
     오버라이딩한 멤버에서 self접근 시 재귀 호출 발생하지 않도록 주의
     */
}
let o = Oval(name: "Oval")
o.radius
o.draw()
