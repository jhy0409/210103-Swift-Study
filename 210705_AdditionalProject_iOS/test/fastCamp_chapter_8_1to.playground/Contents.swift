import UIKit

/*
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
 */
// -------- chapter 8-6 상속의 사용 --> chap8_6to9_class_override.playground

// ------------ 생성자 이해하기 #1 ------------
/*
 var athelete1 = StudentAthelete(firstName: "Yuna", lastName: "Kim")
 var athelete2 = FootballPlayer(firstName: "Heung", lastName: "Son")
 */

// 처음 코드
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
    
    override init(firstName: String, lastName: String) {
        super.init(firstName: firstName, lastName: lastName)
    }
    
    convenience init(student: Student){
        self.init(firstName: student.firstName, lastName: student.lastName)
    }
}

// 학생인데 운동선수
class StudentAthlete: Student {
    var minimumTrainingTime: Int = 2
    var trainedTime: Int = 0
    var sports: [String]

    init(firstName: String, lastName: String, sports: [String]){
        // Phase 1
        self.sports = sports
        super.init(firstName: firstName, lastName: lastName)
        
        // Phase 2
        self.train()
    }
    
    
    convenience init(name: String){
        self.init(firstName: name, lastName: "", sports: [])
    }
    
    
    func train() {
        trainedTime += 1
    }
}

// 운동선인데 축구선수
class FootballPlayer: StudentAthlete {
    var footballTeam = "FC Swift"

    override func train() {
        trainedTime += 2
    }
}

let student1 = Student(firstName: "Jason", lastName: "Lee")
let student1_1 = Student(student: student1)

let student2 = StudentAthlete(firstName: "Jay", lastName: "Lee", sports: ["Football"])

let student3 = StudentAthlete(name: "Mike")


// ------------ 생성자 이해하기 #2 ------------
/*
 생성시점에 부모-자식 클래스 property 세팅해야함
 
 2-phase Initialization (클래스 생성시 두가지 단계)
 
 Phase 1
 1. 자식 -> 2. 부모 클래스
 
 Phase 2
 1. 부모 -> 2. 자식 클래스
 */


// ------------ 생성자 이해하기 #3 ------------
/*
 1. designated initialization (지정)
 - di는 자신부모의 di를 호출
 - ci는 같은 클래스의 이니셜라이저 꼭 하나 호출
 - ci는 궁극적으로 di를 호출
 2. convenience initialization (간편)
*/
