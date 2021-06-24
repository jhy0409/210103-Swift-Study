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
 # Initializer Delegation
 
 ## Value Type
 */
/*
 - 뜻   : 다른 생성자 호출
    Delegation : 위임, 대리 > 모든생성자 실행 후 전체 속성이 초기화 돼야함
 
 - 목적 : 초기화코드 중복제거, 효율적 초기화 위해 사용
 - 구현 : 값, 참조형식에서 다른 규칙으로 구현됨
 
 [값 형식]
 1. 상속 불가능
 2. 생성자 종류가 하나므로 단순하게 구현 가능
 
 여러 생성자 올바르게 미수정시 논리적 오류 발생, -> 유지보수, 디버깅 어려워짐
 -> 해결 : 생성자 하나 구현 후 다른 생성자가 호출하도록 하는게 좋음
 [참조 형식]
 */
struct Size {
   var width: Double
   var height: Double

   init(w: Double, h: Double) {
      width = w
      height = h
   }

   init(value: Double) {
    self.init(w: value, h: value)
   }
}


/*:
 ## Class
 */

/*
 상속계층 따라 올라가면서 모든생성자 올바른 순서로 호출되도록 하는게 중요
 1] : 지정생성자(designated initializer), 2] 간편생성자 (convenience initializer)
 
 [ 규 칙 ]
 1. Delegate Up : 1]은 super class의 1]을 호출해야함
 ==============================================
      - 슈퍼클래스 [1D]  <-  [C]     <-  [C]
                 ↑↑-------\
      - 서브클래스 [2-1D]    [2-2D]  <-  [C]
 ==============================================
 가능  : 1D <- (2-1D, 2-2D)
 불가능 : 2-1D <- 2-2D 동일 클래스 내 다른 1]호출
 
 2. Delegate Across : 2]는 동일 클래스 내 다른 생성자 호출 해야함 (간편또는 지정 생성자)
    - 불가능 : super class 생성자 직접호출
 
 3. 간편생성자 호출 시 동일 클래스의 지정생성자 호출 돼야함
 */

class Figure { // super class
    let name: String
    
    init(name: String) { // D, 지정생성자 [1]
        self.name = name
    }
    
    convenience init() { // [1] 호출 -> 2. Delegate Across
        self.init(name: "unknown")
    }
}

class Rectangle: Figure { // sub class 1
    var width = 0.0
    var height = 0.0
    
    init(n: String, w: Double, h: Double) {
        width = w
        height = h
        super.init(name: n) // 지정생성자는 슈퍼클래스의 지정생성자를 호출해야한다. -> 1. Delegate Up
    }
    
    convenience init(value: Double) {
        self.init(n: "rect", w: value, h: value)
    }
}

class Square: Rectangle { // sub class 2
    // 별도 속성이 없고, 해당 클래스내 지정생성자 미구현 -> rect 지정생성자 상속됨
    convenience init(value: Double) {
        self.init(n: "square", w: value, h: value) // 여기서 self는 상속받은 생성자임
    }
    
    convenience init() { // 첫번째 생성자 호출
        self.init(value: 0.0)
    }
}

/*
 클래스 초기화 방식
 1. [첫단계] 선언된 모든 속성 초기화
    - 초기화 : 서브 -> 슈퍼 클래스 순으로 상속계층 따라 위로 올라감
    - [초기화 실패] 초기화 할 수 없는 속성 존재시 초기화 실패 및 더 올라가지 않음
    - [초기화 성공] 첫번째 단계 완료, 인스턴스 유효성 확보
 
 2. [두번째] 슈퍼 -> 서브 클래스 순으로 내려옴
    - 부가적 초기화 작업 수행
    - 작업 : 인스턴스 속성 접근 및 메소드 호출 가능
    - 부가적 작업이므로 아무 단계없이 완료되는 경우가 다수
 */
