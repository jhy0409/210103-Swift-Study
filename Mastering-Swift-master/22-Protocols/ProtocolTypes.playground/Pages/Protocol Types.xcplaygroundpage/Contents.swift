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
 # Protocol Types
 */
/*
 프토토콜 타입과 프로토콜 적합성에 대해 공부합니다.

 - 프로토콜 타입
 - 프로토콜과 타입 캐스팅
 - 프로토콜 적합성
 - 상속과 유사한 패턴 구현
 
 =========================================
 protocol
 1. First-class Citizen : 독립적 형식
    - 형식으로 사용 가능
    - 변수나 상수 선언 시 자료형으로 선언 가능
    - 파라미터 자료형, 리턴형 선언 가능
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
let r: Resettable = Size()
// 프로토콜 채용하는 인스턴스를 Resettable 형식으로 저장가능
// 슈퍼클래스 형식으로 저장하는 업캐스팅과 유사
// 업캐스팅이므로 기존 속성 접근 불가능 r.width 등..

//: [Next](@next)
