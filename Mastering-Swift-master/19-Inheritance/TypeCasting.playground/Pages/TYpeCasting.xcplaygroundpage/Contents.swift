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
 # Type Casting
 */
/*
 용도 : 인스턴스형식 확인, 다른형식으로 인스턴스 처리 및 다운캐스팅에서 사용
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

class Triangle: Figure {
   override func draw() {
      super.draw()
      print("🔺")
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

class Circle: Figure {
   var radius = 0.0
   
   override func draw() {
      super.draw()
      print("🔴")
   }
}

/*:
 ## Type Check Operator
 ![type-check](type-check.png)
 */
// 타입체크 연산자 is연산자, 이항연산자
/*
 형식 확인대상 is 형식
 
 [ true 리턴 ]
 - 피연산자 형식동일
 - 동일한 상속계층
 - 우측 피연산자가 super class인 경우
 
 > 그 외 : false
 */

let num = 123
num is Int
num is Double
num is String

let t = Triangle(name: "Triangle")
let r = Rectangle(name: "Rect")
let s = Square(name: "Square")
let c = Circle(name: "Circle")

r is Rectangle
r is Figure // 상속 받고 있으므로 upcasting 가능 -> T
r is Square // 타입체크는 런타임에 실행 됨

/*:
 ## Type Casting Operator
 ![type-casting](type-casting.png)
 */
// 타입 캐스팅 연산자
/*
 Compile Time Cast
 as : 컴파일 타임에 결과 알 수 있응
 
 왼쪽 표현식이 오른쪽 형식으로 호환되면 우측형식으로 캐스팅된 인스턴스 리턴
 새 인스턴스가 아닌 임시 인스턴스
 
 Bridging 브릿징 : 서로 호환되는 형식 캐스팅
 컴파일 타임 캐스트 : 브릿징에 주로 사용
 */

let nssstr = "str" as NSString // 컴파일 성공시 에러 미발생
//"str" as Int

/*
 Runtime cast : 런타임에 실행됨
    - conditional cast : 성공 > 리턴, 실패 > nil
    - forced cast      : 실패시 크래시 발생, 비권장
 */

t as? Triangle
t as! Triangle

var upcasted: Figure = s // square -> Figure(parent)
upcasted = s as Figure // compile time upcasting* : 업캐스팅 항상안전, 성공

// downcasting -> *사용 불가능 안전하지 않음, 실패할 수 있어서
upcasted as? Square
upcasted as! Square

upcasted as? Rectangle
upcasted as! Rectangle

upcasted as? Circle
//upcasted as! Circle // 앱 크래시 주요원인

// [ 클래스 상속관계 ]
// 도형 > Rect > square
// 도형 > 삼각형, 도형 > 원

// 주요 사용문법
if let c = upcasted as? Circle { // conditional cast, optional binding
}

/*
 // 배열 : 동일한 형식 저장
 서로 다른형식 저장
 
 모든요소 동일한 상속계층에 있음 > 가장 인접한 슈퍼클래스로 업캐스트 되어 저장
 */
let list = [t, r, s, c]

for item in list {
    item.draw()
    
    if let c = item as? Circle { // 부모클래스형이므로 조건식 추가하여 확인, (다운캐스팅)
        c.radius = 3
        print(c.radius)
    }
}

/*
 다형성(Polymorphism) :
 업캐스팅 된 인스턴스 메소드 호출해도 실제형식에서 오버라이딩 한 메소드 호출됨
 */
