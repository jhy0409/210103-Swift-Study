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
 */
