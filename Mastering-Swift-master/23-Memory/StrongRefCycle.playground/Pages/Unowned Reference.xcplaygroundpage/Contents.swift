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
 # Unowned Reference
 ![unowned](unowned.png)
 */
/*
 비소유 참조 : 약한참조 동일한 방식으로 강한참조 해결
 - non-optional 형식
 - 용도 : 참조사이클 해결 및 속성을 넌옵셔널로 선언해야할 때 사용
 - 인스턴스 생명주기 : 소유자와 같거나 더 긴 경우 사용
 
 - 옵셔널이 아니므로 참조인스턴스 해제돼도 nil로 초기화되지 않음
    -> 해제된 인스턴스 접근시 runtime error
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
   unowned var lessee: Person

   init(model: String, lessee: Person) {
      self.model = model
      self.lessee = lessee
   }

   deinit {
      print("car deinit")
   }
}

var person: Person? = Person()
var rentedCar: Car? = Car(model: "Porsche", lessee: person!)

person?.car = rentedCar

person = nil
rentedCar = nil
