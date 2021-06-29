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
 # Weak Reference
 ![weak](weak.png)
 */
/*
 약한참조
 
 - 인스턴스 참조하지만 소유하지는 않는다.
 - 참조카운트 변동 X
 
 - 인스턴스 참조중 대상인스턴스는 언제든지 사라질 수 있음
 - 소유자보다 짧은 생명주기 가진인스턴스 참조시 주로 사용
 - 참조 인스턴스 해제시 자동 nil로 초기화
 */

class Person {
    var name = "John Doe"
    var car: Car?
    
    deinit {
        print("person deinit")
    }
}

class Car {
    var model: String
    weak var lessee: Person? // person인스턴스 참조하지만 소유하지 않으므로 강한참조 제거됨
    
    init(model: String) {
        self.model = model
    }
    
    deinit {
        print("car deinit")
    }
}

var person: Person? = Person()
var rentedCar: Car? = Car(model: "Porsche")

person?.car = rentedCar
rentedCar?.lessee = person // 약한참조

person = nil // 참조카운트 0, 메모리에서 제거
// 메모리 해제되면서 ?.car속성 제거 -> car인스턴스 소유권 자동 포기
// 약한참조 : 참조인스턴스 해제되면 자동 nil로 초기화
rentedCar = nil
// 메모리 누수없이 모든 인스턴스 정상제거 완료
//: [Next](@next)
