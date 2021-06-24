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
 # Initializer Inheritance
 */
/*
 ---------------- 생성자 상속 ----------------
 
 이니셜라이저 : 서브클래스로 상속되지 않음
 
 상속되는 규칙
 1. 서브클래스 모든값이 기본값으로 초기화 되어있고 1] 미구현시 super class의 모든 1]이 상속됨
 2. 서브클래스가 모든 1]을 상속 받았거나 오버라이딩 시 모든 2]가 상속됨
 */

class Figure {
   var name: String

   init(name: String) {
      self.name = name
   }

   func draw() {
      print("draw \(name)")
   }
    
    convenience init() { // 해당클래스의 1] 호출 및 기본값 사용할 문자열 전달
        self.init(name: "unknown")
    }
}

class Rectangle: Figure {
    var width: Double = 0.0
    var height: Double = 0.0
    
    init(name: String, width: Double, height: Double) { // 1]
        self.width = width
        self.height = height
        super.init(name: name) // 현재 클래스 속성 초기화 후 상위구현 호출
    }
    
    override init(name: String) { // 1]-2 상속받은 생성자 오버라이딩, 1] 클래스 구현 후 상위클래스 호출
        width = 0
        height = 0
        super.init(name: name)
    }
    
    /*
     1]-2 에러이유 - 상속계층 포함됐을 때 구현
     - super 1] 호출
     - 상위구현 호출 전 상속받은 name속성의 접근 불가능
     */
    
    convenience init() { // Figure의 간편생성자 복붙, -> "동일한 클래스"의 다른 생성자 호출
        // 슈퍼클래스의 생성자 직접호출 불가능해서 오버라이딩 안됨
        self.init(name: "unknown")
    }
}


//: [Next](@next)
