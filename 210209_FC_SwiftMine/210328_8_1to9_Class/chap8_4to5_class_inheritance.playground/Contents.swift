import UIKit

// ------------ 챕터 8-4 ------------

// 처음 주어진 코드
//struct Grade {
//    var letter: Character
//    var points: Double
//    var credits: Double
//}
//
//class Person {
//    var firstName: String
//    var lastName: String
//
//    init(firstName: String, lastName: String) {
//        self.firstName = firstName
//        self.lastName = lastName
//    }
//
//    func printMyName() {
//        print("My name is \(firstName) \(lastName)")
//    }
//}
//
//class Student {
//    var grades: [Grade] = []
//
//    var firstName: String
//    var lastName: String
//
//    init(firstName: String, lastName: String) {
//        self.firstName = firstName
//        self.lastName = lastName
//    }
//
//    func printMyName() {
//        print("My name is \(firstName) \(lastName)")
//    }
//}


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

let jay = Person(firstName: "Jay", lastName: "Lee")
let jason = Student(firstName: "Jason", lastName: "Lee")

jay.firstName
jason.firstName

jay.printMyName()
jason.printMyName()

let math = Grade(letter: "B", points: 8.5, credits: 3)
let history = Grade(letter: "A", points: 10, credits: 3)

jason.grades.append(math)
jason.grades.append(history)
//jay.grades

jason.grades.count

// ------------ 챕터 8-5 ------------
// 상속의 규칙과 실습 A is B (A는 B에 포함)
/*
 Person  : Super Class  (Parent Class)
 Student : SubClass     (Child Class)
 */

/*
 상속의 규칙
 
 1. 자식은 한개의 superclass만 상속 받음
 (X) [super 1] -> [sub], [super 2] -> [sub]
 (O) [super 1] -> [sub]
 
 2. 부모는 여러 자식들을 가질 수 있음
 [super] - [sub 1]
 - [sub 2]
 - [sub 3]
 
 3. 상속의 깊이는 상관이 없다.
 [super] - [sub 1]
 - [sub 2] - [sub 2-2]
 - [sub 3]
 */


// 학생인데 운동선수
class StudentAthelete: Student {
    var minimumTrainingTime: Int = 2
    var trainedTime: Int = 0
    
    func train() {
        trainedTime += 1
    }
}


// 운동선수인데 축구선수
class FootballPlayer: StudentAthelete {
    var footballTeam = "FC Swift"
    
    override func train() {
        trainedTime += 2
    }
}

// Person > Student > Athelete > Football Player
var athelete1 = StudentAthelete(firstName: "Yuna", lastName: "Kim")
var athelete2 = FootballPlayer(firstName: "Heung", lastName: "Son")

athelete1.firstName
athelete2.firstName

athelete1.grades.append(math)
athelete2.grades.append(math)

athelete1.minimumTrainingTime
athelete2.minimumTrainingTime

//athelete1.footballTeam
athelete2.footballTeam

athelete1.train()
athelete1.trainedTime

athelete2.train()
athelete2.trainedTime

// upper casting
athelete1 = athelete2 as StudentAthelete
athelete1.train()
athelete1.trainedTime

// down casting
if let son = athelete1 as? FootballPlayer {
    print("--> team: \(son.footballTeam)")
    son.firstName
    son.lastName
}
