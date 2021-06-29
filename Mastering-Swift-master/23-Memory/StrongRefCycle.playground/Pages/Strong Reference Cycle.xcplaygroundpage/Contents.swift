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
 # Strong Reference Cycle
 */
/*
 강한 참조 사이클이 발생하는 원인과 해결 방법
    -> 강한참조 해결 : 약한(weak) 참조, 비소유(unowned) 참조를 통해
 
 - 강한 참조 사이클
 - 약한(weak) 참조,
 - 비소유(unowned) 참조
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
   var lessee: Person?
   
   init(model: String) {
      self.model = model
   }
   
   deinit {
      print("car deinit")
   }
}

var person: Person? = Person()
var rentedCar: Car? = Car(model: "Porsche")
// p와 rC의 참조카운팅 모두 1

person?.car = rentedCar
// car 참조카운팅 2 : +1 rC, +1 ~.car = rC
rentedCar?.lessee = person
// person 참조카운팅 2 : +1 p, +1 ~.lessee = p

person = nil
rentedCar = nil
/*
 - 두 인스턴스가 속성을 통해 서로 소유하고 있음 (메모리 해제되지 않음)
 - 각 인스턴스 변수에 nil을 할당하여 속성에 접근할 방법이 없다.
 
 Strong Reference Cycle(강한참조 사이클) : 강한참조때문에 인스턴스 정상적으로 해제 할 수 없는 것
 ARC는 메모리 처리 대신하지만 참조 사이클까지 자동처리 불가능
 
 [ 해결 ]
 1. Weak Reference (약한참조)
 2. Unowend Reference (비소유 사이클)
 
 강한참조와 달리 참조카운트 증가나 감소시키지 않는다.
 가능     : 참조통해 인스턴스 접근가능
 불가능    : 인스턴스 사라지지 않게 유지하는 것
 */
//: [Next](@next)
