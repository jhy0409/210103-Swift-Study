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

import Foundation

/*:
 # Protocol Composition
 ![composition](composition.png)
 */

protocol Resettable {
   func reset()
}

protocol Printable {
   func printValue()
}

class Size: Resettable, Printable {
   var width = 0.0
   var height = 0.0
   
   func reset() {
      width = 0.0
      height = 0.0
   }
   
   func printValue() {
      print(width, height)
   }
}

class Circle: Resettable {
   var radius = 0.0
   
   func reset() {
      radius = 0.0
   }
}

class Oval: Circle { // resettable만 채용
   
}

let r: Resettable = Size()
let p: Printable = Size()

// r, p 모두 충족하는 인스턴스의 저장 '&' -> 병합된 임시 프로토콜로 처리 : 새로운 프로토콜 생성은 아님

var rp: Resettable & Printable = Size()
// rp = Circle() // rp -> r, p / Circle() -> r만 채용하므로 저장 불가능

/*:
 ![composition2](composition2.png)
 */
/*
 Class & Protocol & ...
 
 - 클래스 저장시 모든 서브 클래스 저장할 수 있음
 */

// r, circle의 서브클래스인 인스턴스
var cr: Circle & Resettable = Circle()
cr = Oval()
