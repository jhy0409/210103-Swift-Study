import UIKit

// ------------ 챕터 8-6 ------------
/*
 클래스 상속의 사용?
 
 1. 코드를 줄일 수 있음
 2. 상속 깊이가 깊어지면 유지보수 어려워짐
 -----------------
 
 1. 단일 책임 Single Responsibility (클래스 당 한개의 고려사항만)
 2. 타입의 명료성 Type Safety (타입의 명확한 구분 / 여러반, 해당 반만 보려고할 때)
 3. 다자녀가 있음 Shared Base Classes (기본동작이 다양하게 구현돼야할 때)
    (동작 : 공부, <-> 과에따른 다른 '공부' -> 상속)
 
 4. 확장성의 필요 Extensibility (캔 -> 콜라/사이다.. etc)
 5. 정체성 구분 Identity (상속된 클래스로 파악, 학생 -> 체대생)
 */




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
