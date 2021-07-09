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
 
 // -------- chapter 7-6강 ~ 7-7강
 let doubleLine = "========================================="
 struct Person {
 var firstName: String { // Stored Property(저장속성)
 willSet { // didset보다 먼저 호출 됨, 세팅되기 전
 print(" - willSet\t이름변경 : 이전 (\(firstName)) --> 이후 (\(newValue))")
 print(" - \(firstName) \(lastName)\n")
 }
 didSet { // 세팅 후 호출
 print(" - didSet\t이름변경 : 이전 (\(oldValue)) --> 이후 (\(firstName))")
 print(" - \(firstName) \(lastName)\n\(doubleLine)\n")
 }
 }
 
 lazy var isPopular: Bool = { // 최적화위해 사용됨(사용자 접근시점에 실행, 주로 cost가 소모되는 행위일 경우)
 if fullName == "Jay Park" {
 return true
 } else {
 return false
 }
 }()
 
 var lastName: String
 // lazy property : 인스턴스 생성시 실행이 아닌 해당 프로퍼티 접근할 때 실행되는 코드
 var fullName: String { // Computed Property
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
 
 init(firstName: String, lastName: String) {
 self.firstName = firstName
 self.lastName = lastName
 print("인스턴스 생성 --> \(firstName) \(lastName)")
 }
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
 person.fullName = "Jay Park"
 person.isPopular
 
 person.firstName
 person.lastName
 
 Person.isAlien
 */

// -------- chapter 7-8강
/*
 - Property : 호출시 저장된 값을 하나 반환한다. (computed property)
 - Method : 호출시 어떤 작업을 한다. // 메소드가 값을 리턴하는 작업을 한다면 1과 동일
 
 // 경우에 따른 사용
 1. Computed Property
 - setter 필요
 
 2. Method
 - setter 미사용
 - DB access나 File io가 필요할 때
 */


// -------- chapter 7-9강
struct Lecture {
    var title: String
    var maxStudents: Int = 10
    var numOfRegistered: Int = 0
    func remainSeats() -> Int {
        let remainSeats = lec.maxStudents - lec.numOfRegistered
        return remainSeats
    }
    mutating func register() {
        // 등록된 학생 수 증가
        numOfRegistered += 1
    }
    
    static let target: String = "Anybody want to learn soemthing"
    static func 소속한원이름() -> String {
        return "패캠"
    }
}

var lec = Lecture(title: "1. iOS Basic")

lec.remainSeats()
lec.register()
lec.register()
lec.register()
lec.remainSeats()

Lecture.target // type property
Lecture.소속한원이름() // type method

// -------- chapter 7-10강 struct extension

struct Math {
    static func abs(value: Int) -> Int {
        if value > 0 {
            return value
        } else {
            return -value
        }
    }
}

Math.abs(value: -20)
// 코드가 숨겨져있거나 사용하는 코드 바로밑에서 만들어 쓰고 싶을 때
// 같은 struct안에 여러 코드 통합누적 시 충돌날 수 있음
// 제곱, 반값
extension Math {
    static func square(value: Int) -> Int {
        return value * value
    }
    static func half(value: Int) -> Int {
        return value/2
    }
}

Math.square(value: 5)
Math.half(value: 20)

var value: Int = 3
// 제곱, 반값

extension Int {
    func square() -> Int {
        return self * self
    }
    func half() -> Int {
        return self/2
    }
}

value.square()
value.half()
