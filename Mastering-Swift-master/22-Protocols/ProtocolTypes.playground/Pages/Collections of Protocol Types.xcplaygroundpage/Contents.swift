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
//: [Previous](@previous)

import Foundation

/*:
 # Collections of Protocol Types
 */
/*
 프로토콜 활용한 상속과 유사한 패턴 구현
 */

protocol Figure {
   func draw()
}

struct Triangle: Figure {
   func draw() {
      print("draw triangle")
   }
}

class Rectangle: Figure {
   func draw() {
      print("draw rect")
   }
}

struct Circle: Figure {
   var radius = 0.0

   func draw() {
      print("draw circle")
   }
}

let t = Triangle()
let r = Rectangle()
let c = Circle()

let list: [Figure] = [t, r, c] // 독립형식이어서 형식으로 사용가능(First-class Citizen)
/*
  인스턴스 형식 모두 다름, 값-참조 형식 혼재하여 에러
  동일 상속계층 클래스일 때는 자동 업캐스팅되어 저장
 */

for item in list {
    item.draw()
    
    if let c = item as? Circle {
        c.radius
    }
    // up, down casting => 상속 미지원 값형식에서도 유사한 패턴으로 구현가능
    // 값, 참조형식 상관없이 함께 처리 가능
}
