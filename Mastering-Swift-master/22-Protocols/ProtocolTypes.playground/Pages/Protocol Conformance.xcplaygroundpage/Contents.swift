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

import UIKit

/*:
 # Protocol Conformance
 ![is](is.png)
 ![as](as.png)
 */
/*
 프로토콜 적합성 : 특정형식이 프로토콜 채용하는지 나타내는 척도
 확인         : 타입캐스팅 연산자로 확인
 성격         : 클래스 다운캐스팅과 유사
 
 as연산자 :
    - 인스턴스를 프로토콜 형식으로 캐스팅
    - 프로토콜 형식 저장된 인스턴스 실제형식 캐스팅시 사용
 */
protocol Resettable {
   func reset()
}

class Size: Resettable {
   var width = 0.0
   var height = 0.0
   
   func reset() {
      width = 0.0
      height = 0.0
   }
}

let s = Size()
s is Resettable // 채용 프로토콜
s is ExpressibleByNilLiteral // 미채용 프로토콜
let r = Size() as Resettable
r as? Size // 2] runtime cast

/*
  1] compile type cast, 2] runtime cast
 
    - 인스턴스 프로토콜 형식 캐스팅 : 1], 2] 둘다 가능
    - 원래형식 되돌릴 때         : 2]만 가능
 */

//: [Next](@next)
