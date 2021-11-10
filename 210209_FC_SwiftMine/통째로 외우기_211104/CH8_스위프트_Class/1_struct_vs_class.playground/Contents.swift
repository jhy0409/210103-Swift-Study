import UIKit

let LINE = "-------------------------------------"
/*: ## N번째*/
// MARK: - [] 1. PersonStruct
    // var firstName, lastName, 생성자
    // var fullName(계산속성)
    // func uppercaseName() : first, last

// MARK: - [] 2. PersonClass
    // var firstName, lastName, 생성자
    // var fullName(계산속성)
    // func uppercaseName() : first, last

// MARK: - [] personStruct1 - Jason Lee, per...2 = per..1할당
// MARK: - [] personClass1 - Jason Lee, perC...2 = per..1할당

/*
 personStruct2.firstName = "Jay"
 personStruct1.firstName
 personStruct2.firstName
 
 personClass2.firstName = "Jay"
 personClass1.firstName
 personClass2.firstName
 
 personClass1 = personClass2
 personClass1.firstName
 personClass2.firstName
 */

// MARK: - [] struct Point - let x, let y: Int
    /*
     point1 = 3, 5
     point2 = 3, 5
     */

// MARK: - [] struct Mac
    // var owner

/*
 myMac = "Jason"
 yourMac = myMac
 yourMac.owner = "Jay"
 
 myMac.owner
 yourMac.owner
 */


/*: ## 2번째*/
// MARK: - [🟢] 1. PersonStruct
    // var firstName, lastName, 생성자
    // var fullName(계산속성)
    // func uppercaseName() : first, last
struct PersonStruct {
    var firstName: String
    var lastName: String
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    mutating func uppercaseName() {
        self.firstName = firstName.uppercased()
        lastName = lastName.uppercased()
    }
}

// MARK: - [🟢] 2. PersonClass
    // var firstName, lastName, 생성자
    // var fullName(계산속성)
    // func uppercaseName() : first, last

class PersonClass {
    var firstName: String
    var lastName: String
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func uppercaseName() {
        firstName = firstName.uppercased()
        lastName = lastName.uppercased()
    }
}

// MARK: - [🟢] personStruct1 - Jason Lee, per...2 = per..1할당
// MARK: - [🟢] personClass1 - Jason Lee, perC...2 = per..1할당

var personStruct1 = PersonStruct(firstName: "struct - Jason", lastName: "Lee")
var personStruct2 = personStruct1

var personClass1 = PersonClass(firstName: "class - Jason", lastName: "Lee")
var personClass2 = personClass1

print(personStruct1.fullName)
print(personStruct2.fullName)
personStruct2.firstName = "Jay 복사되어 할당되므로 하나만 바뀝니다."

print()
print(personStruct1.fullName)
print(personStruct2.fullName)

print("\n\(LINE)")
print(personClass1.fullName)
print(personClass2.fullName+"\n 여기부터") // 여기부터
personClass2.firstName = "Jay 객체를 공유하므로 둘 다 바뀝니다."

print(personClass1.fullName)
print(personClass2.fullName+"\n\npersonClass2에 새로운 객체를 생성 및 할당합니다.\n")

personClass2 = PersonClass(firstName: "Bob", lastName: "Lee")
print(personClass1.fullName)
print(personClass2.fullName+"\n\npersonClass1에 personClass2(Bob)를 할당합니다.")

personClass1 = personClass2
print(personClass1.fullName)
print(personClass2.fullName)

// MARK: - [🟢] struct Point - let x, let y: Int
    /*
     point1 = 3, 5
     point2 = 3, 5
     */

struct Point {
    let x: Int
    let y: Int
}

var point1 = Point(x: 3, y: 5)
var point2 = Point(x: 3, y: 5)

// MARK: - [🟢] struct Mac
    // var owner

struct Mac {
    var owner: String
}

var myMac = Mac(owner: "Jason")
var yourMac = myMac
yourMac.owner = "Jay"

myMac.owner
yourMac.owner
/*
 myMac = "Jason"
 yourMac = myMac
 yourMac.owner = "Jay"
 
 myMac.owner
 yourMac.owner
 */


/*: ## 1번째*/
//// MARK: - [🟢] 1. PersonStruct
//    // var firstName, lastName, 생성자
//    // var fullName(계산속성)
//    // func uppercaseName() : first, last
//
//struct PersonStruct {
//    var firstName: String
//    var lastName: String
//
//    init(firstName: String, lastName: String) {
//        self.firstName = firstName
//        self.lastName = lastName
//    }
//
//    var fullName: String {
//        return "\(firstName) \(lastName)"
//    }
//
//    mutating func uppercaseName() {
//        firstName = firstName.uppercased()
//        lastName = lastName.uppercased()
//    }
//}
//
//// MARK: - [🟢] 2. PersonClass
//    // var firstName, lastName, 생성자
//    // var fullName(계산속성)
//    // func uppercaseName() : first, last
//
//class PersonClass {
//    var firstName: String
//    var lastName: String
//
//    init(firstName: String, lastName: String) {
//        self.firstName = firstName
//        self.lastName = lastName
//    }
//
//    var fullName: String {
//        return "\(firstName) \(lastName)"
//    }
//
//    func upperCaseName() {
//        firstName = firstName.uppercased()
//        lastName = lastName.uppercased()
//    }
//}
//
//// MARK: - [🟢] personStruct1 - Jason Lee, per...2 = per..1할당
//// MARK: - [🟢] personClass1 - Jason Lee, perC...2 = per..1할당
//
//var personStruct1 = PersonStruct(firstName: "struct - Jason", lastName: "Lee")
//var personStruct2 = personStruct1
//
//var personClass1 = PersonClass(firstName: "class - Jason", lastName: "Lee")
//var personClass2 = personClass1
//
//personStruct1.fullName
//personStruct2.fullName // 둘 다 Jason Lee
//personStruct2.firstName = "Jay"
//
//personStruct1.fullName
//personStruct2.fullName // 값이 복사되어 할당된다.
//// Jason Lee, Jay Lee
//
//personClass1.fullName
//personClass2.fullName
//personClass2.firstName = "Jay"
//
//personClass1.fullName // 둘 다 Jay Lee
//personClass2.fullName // 같은 주소를 참조. (공유된 원본 값이 변경됨)
//
//
//personClass2 = PersonClass(firstName: "Bob", lastName: "Lee")
//personClass1.fullName
//personClass2.fullName // 새로 할당하여 각자 다른 객체를 참조한다.
//// Jay Lee, Bob Lee
//
//personClass1 = personClass2
//personClass1.fullName
//personClass2.fullName // 둘 다 Bob Lee
//
//// MARK: - [🟢] struct Point - let x, let y: Int
//    /*
//     point1 = 3, 5
//     point2 = 3, 5
//     */
//struct Point {
//    let x: Int
//    let y: Int
//}
//
//let point1 = Point(x: 3, y: 5)
//let point2 = Point(x: 3, y: 5)
//
//// MARK: - [🟢] struct Mac
//    // var owner
//
//struct Mac {
//    var owner: String
//}
//
//// 주석 : 인강설명 기억나는 대로
//var myMac = Mac(owner: "Jason") // 같은 모델의 맥을 다른 사람끼리 장바구니에 넣을 수 있다.
//var yourMac = myMac // Jason의 장바구니를 보고 항목에 추가
//yourMac.owner = "Jay" // 실제구입 할 때 소유주(받는사람)을 바꿈
//
//myMac.owner // 처음 구매한 사람
//yourMac.owner // 나중에 구매한 사람
//// 값을 복사하여 할당한다. (객체공유 X)
