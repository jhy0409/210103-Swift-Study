import UIKit
/*
 // -------- chapter 7-5강
 struct Person {
     var firstName: String   // Stored Property(저장속성)
     var lastName: String    // Stored Property(저장속성)
     
     /*
      Computed Property (계산속성) var만 가능
      1-1. read only 값 세팅 불가능
      1-2. 세팅 가능하게 -> get, set 삽입
      
      2. Type Property : 생성된 인스턴스 상관없이 타입자체의 속성 정하고 싶을 때 사용하는 것
      */
     var fullName: String {
         get {
             return "\(firstName) \(lastName)"
         }
         set {
             if let firstName = newValue.components(separatedBy: " ").first {
                 self.firstName = firstName
             }
             // newValue : 할당되는 새로운 값
             if let lastName = newValue.components(separatedBy: " ").last {
                 self.lastName = lastName
             }
         }
     }
     static let isAlien: Bool = false
 }

 var person = Person(firstName: "Jason", lastName: "1-1")
 person.firstName
 person.lastName

 person.firstName = "Jim"
 person.lastName = "1-2"

 person.firstName
 person.lastName

 person.fullName
 person.fullName = "Jay P_1-3"

 person.firstName
 person.lastName
 Person.isAlien

 */
// -------- chapter 7-6강
struct Person {
    var firstName: String   // Stored Property(저장속성)
    var lastName: String    // Stored Property(저장속성)
    
    /*
     Computed Property (계산속성) var만 가능
     1-1. read only 값 세팅 불가능
     1-2. 세팅 가능하게 -> get, set 삽입
     
     2. Type Property : 생성된 인스턴스 상관없이 타입자체의 속성 정하고 싶을 때 사용하는 것
     */
    var fullName: String {
        get {
            return "\(firstName) \(lastName)"
        }
        set {
            if let firstName = newValue.components(separatedBy: " ").first {
                self.firstName = firstName
            }
            // newValue : 할당되는 새로운 값
            if let lastName = newValue.components(separatedBy: " ").last {
                self.lastName = lastName
            }
        }
    }
    static let isAlien: Bool = false
}

var person = Person(firstName: "Jason", lastName: "1-1")
person.firstName
person.lastName


person.firstName = "Jim"
person.lastName = "1-2"

person.firstName
person.lastName

person.fullName
person.fullName = "Jay P_1-3"

person.firstName
person.lastName

Person.isAlien
