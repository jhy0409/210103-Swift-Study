import UIKit

struct Person {
    var firstName: String
    var lastName: String
    
    // read-only
    var fullName: String {
        get {
            return "\(firstName) \(lastName)"
        }
        
        set {
            // newValue "Jay Park"
            if let firstName = newValue.components(separatedBy: " ").first {
                self.firstName = firstName
            }
            
            if let lastName = newValue.components(separatedBy: " ").last {
                self.lastName = lastName
            }
        }
    }
    static let isAlien: Bool = false
}

var person = Person(firstName: "Jason", lastName: "Lee")
person.firstName
person.lastName
person.fullName

person.firstName = "Jim"
person.lastName = "Kim"

person.firstName
person.lastName
person.fullName

person.fullName = "Jay Park"
person.firstName
person.lastName
person.fullName

// Type Property : 생성된 인스턴스 상관없이 스트럭트 또는 클래스 타입자체의 속성을 정할 때 사용
Person.isAlien
