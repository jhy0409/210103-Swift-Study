import UIKit

struct Person {
    // 값이 바뀔 때 찍기
    var firstName: String {
        //        willSet {
        //            print("willSet: \(firstName) --> \(newValue)")
        //        }
        
        // stored property일때 observation으로 확인가능 (willSet, Didset)
        didSet {
            print("didSet: \(oldValue) --> \(firstName)")
        }
    }
    var lastName: String
    
    // 사용자가 접근할 때 쓰는거
    lazy var isPopular: Bool = {
        if fullName2() == "Jay Park" {
            return true
        } else {
            return false
        }
    }()
    
    // read-only
    //    var fullName: String {
    //        get {
    //            return "\(firstName) \(lastName)"
    //        }
    //
    //        set {
    //            // newValue "Jay Park"
    //            if let firstName = newValue.components(separatedBy: " ").first {
    //                self.firstName = firstName
    //            }
    //
    //            if let lastName = newValue.components(separatedBy: " ").last {
    //                self.lastName = lastName
    //            }
    //        }
    //    }
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    func fullName2() -> String {
        return "\(firstName) \(lastName)"
    }
    
    static let isAlien: Bool = false
}

var person = Person(firstName: "Jason", lastName: "Lee")
//person.firstName
//person.lastName
//person.fullName
//
//person.firstName = "Jim"
//person.lastName = "Kim"
//
//person.firstName
//person.lastName
//person.fullName
//
//person.fullName = "Jay Park"
//person.firstName
//person.lastName
//person.fullName
//
//// Type Property : 생성된 인스턴스 상관없이 스트럭트 또는 클래스 타입자체의 속성을 정할 때 사용
//Person.isAlien
//person.isPopular

person.fullName2()
person.fullName

// Property : 호출시 저장값 하나 반환 (setter 필요)
// Method : 호출시 어떤 작업을 한다. (연산이나 파일접근)

