import UIKit

func printChapterTitle(title: String, isDone: Int) {
    let doneStates = (not: "🔴", ing: "🟠", done: "🟢")
    let line = "\t---------------------"
    
    var resultString = ""
    
    switch isDone {
    case 0:
        resultString = "\(doneStates.not) \(title) \(line)"
    case 1:
        resultString = "\(doneStates.ing) \(title) \(line)"
    case 2:
        resultString = "\(doneStates.done) \(title) \(line)"
    default:
        break
    }
    
    print(resultString)
}
/*: ## N번째*/
// MARK: - [] Person struct
// MARK: - [] 1. 속성
    // var firstName - willSet, didSet
    // var lastName
    
    // lazy var isPopular: Bool - Jay Park
    // var fullName - get, set / func fullName

    // static let isAlien - f

// MARK: - [] 2. var person - Jason, Lee
    // 1. Jim Kim ->
    // Jay Park >

    // Person.isAlien
    // person.isPopular

/*: ## 2번째*/
// MARK: - [🟠] Person struct
// MARK: - [🟠] 1. 속성
struct Person {
    // var firstName - willSet, didSet
    var firstName: String {
        willSet {
            print("\(firstName) ---> \(newValue)")
        }
        didSet {
            print("\(oldValue) ---> \(firstName)")
        }
    }
    // var lastName
    var lastName: String

    // lazy var isPopular: Bool - Jay Park
    lazy var isPopular: Bool = {
        if fullName == "Jay Park" {
            return true
        } else { return false }
    }()
    
    // var fullName - get, set / func fullName
    var fullName: String {
        get {
            return "\(firstName) \(lastName)"
        }
        
        set {
            if let firstName = newValue.components(separatedBy: " ").first {
                self.firstName = firstName
            }
            
            if let lastName = newValue.components(separatedBy: " ").last {
                self.lastName = lastName
            }
        }
    }

    // static let isAlien - f
    static let isAlien = false
}

// MARK: - [🟠] 2. var person - Jason, Lee
var person = Person(firstName: "Jason", lastName: "Lee")
person.firstName
person.lastName

    // 1. Jim Kim ->
person.firstName = "Jim"
person.lastName = "Kim"

person.firstName
person.lastName

    // Jay Park >
person.fullName
person.fullName = "Jay Park"
person.firstName
person.lastName

Person.isAlien
person.isPopular

    // Person.isAlien
    // person.isPopular


/*: ## 1번째*/
//// MARK: - [🔴] Person struct
//// MARK: - [🔴] 1. 속성
//    // var firstName - willSet, didSet
//printChapterTitle(title: "1번째 - Person struct", isDone: 0)
//struct Person {
//    var firstName: String {
//        willSet {
//            print("willSet: \(firstName) --> \(newValue)")
//        }
//
//        didSet {
//            print("didSet: \(oldValue) --> \(firstName)")
//        }
//    }
//    // var lastName
//    var lastName: String
//
//    // var fullName - get, set / func fullName
//    // lazy var isPopular: Bool - Jay Park
//    lazy var isPopular: Bool = {
//        if fullName == "Jay Park" { return true }
//        else { return false }
//    }()
//
//    var fullName: String {
//        get { return "\(firstName) \(lastName)"}
//        set { // newValue "Jay Park"
//            if let firstName = newValue.components(separatedBy: " ").first {
//                self.firstName = firstName
//            }
//
//            if let lastName = newValue.components(separatedBy: " ").last {
//                self.lastName = lastName
//            }
//        }
//    }
//
////    var fullName: String {
////        return "\(firstName) \(lastName)"
////    }
//
//    func ffullName() -> String {
//        return "\(firstName) \(lastName)"
//    }
//
//    // static let isAlien - f
//    static let isAlien: Bool = false
//}
//
//// MARK: - [🔴] 2. var person - Jason, Lee
//var person = Person(firstName: "Jason", lastName: "Lee")
//person.firstName
//person.lastName
//
//    // 1. Jim Kim ->
//person.firstName = "Jim"
//person.lastName = "Kim"
//
//person.firstName
//person.lastName
//person.fullName
//
//    // Jay Park >
//person.fullName = "Jay Park"
//person.firstName
//person.lastName
//person.fullName
//
//    // Person.isAlien
//Person.isAlien
//
//    // person.isPopular
//person.isPopular


