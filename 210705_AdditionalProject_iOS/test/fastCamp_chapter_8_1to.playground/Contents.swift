import UIKit

// -------- chapter 8-1~2 Struct & Class
struct PersonStruct {
    var firstName: String
    var lastName: String
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    mutating func uppercaseName() {
        firstName = firstName.uppercased()
        lastName = lastName.uppercased()
        print("\(firstName) \(lastName)")
    }
}

class PersonClass {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    func uppercaseName() {
        firstName = firstName.uppercased()
        lastName = lastName.uppercased()
        print("\(firstName) \(lastName)")
    }
}

var pS = PersonStruct(firstName: "struct", lastName: "def")
pS.fullName
pS.uppercaseName()
pS.fullName

var pC = PersonClass(firstName: "class", lastName: "ghi")
pC.fullName

// -------- chapter 8-4 상속
struct Grade {
    var letter: Character
    var points: Double
    var credits: Double
}

class Person {
    var firstName: String
    var lastName: String
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func printMyName() {
        print("My name is \(firstName) \(lastName)")
    }
}

class Student: Person {
    var grades: [Grade] = []
}

let jayP = Person(firstName: "Jay-Person", lastName: "Lee")
let jasonStu = Student(firstName: "Jason-Student", lastName: "Lee")

jayP.firstName
jasonStu.firstName

jayP.printMyName()
jasonStu.printMyName()

let math = Grade(letter: "B", points: 8.5, credits: 3)
let history = Grade(letter: "A", points: 10.0, credits: 3)
jasonStu.grades.append(math)
jasonStu.grades.append(history)
jasonStu.grades.count

// -------- chapter 8-5 상속 --> chap8_4to5_class_inheritance.playground 파일 참고
