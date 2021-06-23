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
 # Upcasting & Download Casting
 */

class Figure {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func draw() {
        print("draw \(name)")
    }
}

class Rectangle: Figure {
    var width = 0.0
    var height = 0.0
    
    override func draw() {
        super.draw()
        print("⬛️ \(width) x \(height)")
    }
}

class Square: Rectangle {
}

let f = Figure(name: "Unknown")
f.name

let r = Rectangle(name: "Rect")
r.width
r.height
r.name

// Upcasting : 서브클래스 인스턴스를 슈퍼클래스 형식으로 저장
// - 동일한 클래스에서 업캐스팅 : 안전(에러 미발생)해서 별도 문법 필요 X
let s: Figure = Square(name: "Square") // 1 - 3
s.name
/*
 -- S(F(이름), 너비, 높이) -> F로 선언 -> 이름만 접근가능
 s.width
 s.height
 */

// 1 Figure > 2 Rectangle > 3 Sqaure > 4 Rhombus
let downcasted = s as! Square // 업캐스팅 된 클래스의 서브 클래스, 원본클래스의 슈퍼클래스 다운캐스팅 가능
downcasted.name
downcasted.width
downcasted.height

/*
 - 다운캐스팅 : upcasting된걸 내리는 거
     - 에러 발생할 수 ㅇ
     - 항상 성공하지는 않음
 */

class Rhombus: Square {
    var angle = 45.0
}

// let dr = s as! Rhombus // angle 속성이 없으므로 실패
// 원본보다 아래인 서브클래스로 다운캐스팅 허용되지 않음
