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
 # self
 ![self](self.png)
 */
/*
 self & super
 형식에 기본적으로 추가되는 속성
 
 - 인스턴스 내부 : 해당 인스턴스 접근
 - 타입멤버 내부 : 형식자체 접근
 
=========================
 1] self : 인스턴스 자체 접근
 2] 인스턴스 속성 접근
 3] 인스턴스 메소드 호출  // 2]~3] : "self." 생략
 4] 서브스크립트 호출
 5] 동일형식 다른 생성자 호출 // self생략 불가능
 */

class Size {
   var width = 0.0
   var height = 0.0
    
    
    // 1- 인스턴스 멤버에서 self사용 ----------------------
    func calcArea() -> Double {
        return width * height // self생략
        //return self.width * self.height
    }
    
    var area: Double { // 계산속성
        return calcArea()
        //return self.calcArea()
    }
    
    // ---- self 생략 불가능1 ---- 속성, 파라미터와 구분
    func update(width: Double, height: Double) {
        self.width = width // 속성, 파라미터와 구분 -> "self." 추가
        self.height = height
    }
    
    // ---- self 생략 불가능2 ---- 클로저 내부에서 속성 접근
    func doSomething() {
        let c = { self.width * self.height } // self캡처 (클로저 내부에서 속성 접근위해)
    }
    
    // 2- 형식속성, 형식 메소드에서 self사용 ----------------------
    // 타입멤버에서 사용 > 형식 자체
    static let unit = ""
    static func doSomething() {
        // self.width // width의 형식속성(static)은 없음
        self.unit
        unit // self 생략가능
    }
}

struct STR_Size {
    var width = 0.0
    var height = 0.0
    
    mutating func reset(value: Double) {
        //width = value; height = value // 개별속성 하나씩 초기화
        
        self = STR_Size(width: value, height: value) // 인스턴스가 새로운 인스턴스로 교체
        // 생성자로 초기화 가능, 클래스에선 사용 불가능
    }
}


/*:
 # super
 ![super](super.png)
 */
/*
 - 문법 : self와 크게 차이없음
 - 사용 : 상속과 관련이 있어 클래스만
 */
