import UIKit

/*: ## N번째*/
// MARK: - [] 학년 - Grade struct, var letter(Ch), points(Double), credits(Double)


// MARK: - [] 사람 - Person Class, var firstName, lastName, init, func printMyName()

// MARK: - [] 학생: 사람 - Student Class, var grades: [Grade] = []
    // jay = Person, jason = Student
    // jay, jason firstName, printMyName

    // math = Grade B, 8.5, 3 / history = Grade A, 10.0, 3
    // jason grades math, history, count?

// MARK: - [] 학생인데 운동선수 - class StudentAthlete, Student
    // minimumTrainingTime = 2
    // trainedTime = 0
    // func train() += 1

// MARK: - [] 운동선수인데 축구선수 - class FootballPlayer, StudentAthlete
    // footballTeam = "FC Swift"
    // func train += 2

    // var athelete1 = 요나 킴(StudentAthlete), 2 = 흥민 손(Football)
    // firstName
    // grads.append(math)

    // minimumTrainingTime
    // footballTeam
    // .train(), .trainedTime

    // 1 = 2 as ... 학생선수
    // .train()
    // .trainedTime

    // if let ath1 as Football... print footballTeam

    



/*: ## 2번째*/
// MARK: - [🟢] 학년 - Grade struct, var letter(Ch), points(Double), credits(Double)
struct Grade {
    var letter: Character
    var points: Double
    var credits: Double
}

// MARK: - [🟢] 사람 - Person Class, var firstName, lastName, init, func printMyName()
class Person {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func printMyName() {
        print("My Name is... \(firstName) \(lastName)")
    }
}

// MARK: - [🟢] 학생: 사람 - Student Class, var grades: [Grade] = []
class Student: Person {
    var grades: [Grade] = []
}

    // jay = Person, jason = Student
    // jay, jason firstName, printMyName
let jay = Person(firstName: "Jay", lastName: "Lee")
let jason = Student(firstName: "Jason", lastName: "Lee")
jay.firstName
jason.firstName

jay.printMyName()
jason.printMyName()

    // math = Grade B, 8.5, 3 / history = Grade A, 10.0, 3
let math = Grade(letter: "B", points: 8.5, credits: 3)
let history = Grade(letter: "A", points: 10, credits: 3)
    // jason grades math, history, count?
jason.grades.append(math)
jason.grades.append(history)

jason.grades.count

// MARK: - [🟢] 학생인데 운동선수 - class StudentAthlete, Student
    // minimumTrainingTime = 2
    // trainedTime = 0
    // func train() += 1

class StudentAthlete: Student {
    var minimumTrainingTime: Int = 2
    var trainedTime: Int = 0
    
    func train() {
        trainedTime += 1
    }
}

// MARK: - [🟢] 운동선수인데 축구선수 - class FootballPlayer, StudentAthlete
    // footballTeam = "FC Swift"
    // func train += 2
class FootballPlayer: StudentAthlete {
    var footballTeam = "FC Swift"
    
    override func train() {
        trainedTime += 2
    }
}

    // var athelete1 = 요나 킴(StudentAthlete), 2 = 흥민 손(Football)
var athelete1 = StudentAthlete(firstName: "Yuna", lastName: "Kim")
var athelete2 = FootballPlayer(firstName: "Heung", lastName: "Son")
    // firstName
athelete1.firstName
athelete2.firstName

    // grads.append(math)
athelete1.grades.append(math)
athelete2.grades.append(math)

    // minimumTrainingTime
athelete1.minimumTrainingTime
athelete2.minimumTrainingTime

    // footballTeam
athelete2.footballTeam
    // .train(), .trainedTime

athelete1.train()
athelete1.trainedTime

athelete2.train()
athelete2.trainedTime

    // 1 = 2 as ... 학생선수
athelete1 = athelete2 as StudentAthlete
athelete1.train()
athelete1.trainedTime
    // .train()
    // .trainedTime

    // if let ath1 as Football... print footballTeam
if let son = athelete1 as? FootballPlayer {
    print("\(son.footballTeam)")
}


/*: ## 1번째*/
//// MARK: - [] 학년 - Grade struct, var letter(Ch), points(Double), credits(Double)
//struct Grade {
//    var letter: Character
//    var points: Double
//    var credits: Double
//}
//
//// MARK: - [] 사람 - Person Class, var firstName, lastName, init, func printMyname()
//class Person {
//    var firstName: String
//    var lastName: String
//
//    init(firstName: String, lastName: String) {
//        self.firstName = firstName
//        self.lastName = lastName
//    }
//
//    func printMyname() {
//        print("My name is \(firstName) \(lastName)")
//    }
//}
//// MARK: - [] 학생: 사람 - Student Class, var grades: [Grade] = []
//class Student: Person {
//    var grades: [Grade] = []
//}
//
//let jay = Person(firstName: "Class[P] - Jay", lastName: "Lee")
//let jason = Student(firstName: "Class[P - S] - Jason", lastName: "Lee")
//
//jay.firstName
//jason.firstName
//
//jay.printMyname()
//jason.printMyname()
//
//let math = Grade(letter: "B", points: 8.5, credits: 3)
//let history = Grade(letter: "A", points: 10.0, credits: 3)
//
//jason.grades.append(math)
//jason.grades.append(history)
//
//jason.grades.count
//// MARK: - [] 학생인데 운동선수 - StudentAthlete, Student
//class StudentAthlete: Student {
//    var minimumTrainingTime: Int = 2
//    var trainedTime: Int = 0
//
//    func train() {
//        trainedTime += 1
//    }
//}
//
//// MARK: - [] 운동선수인데 축구선수 - FootballPlayer, StudentAthlete
//class FootballPlayer: StudentAthlete {
//    var footballTeam = "FC Swift"
//
//    override func train() {
//        trainedTime += 2
//    }
//}
//
//// var athelete1 = 요나 킴, 2 = 흥민 손
//
//var athelete1 = StudentAthlete(firstName: "Yuna", lastName: "Kim")
//var athelete2 = FootballPlayer(firstName: "Heung", lastName: "Son")
//
//athelete1.firstName
//athelete2.firstName
//
//athelete1.grades.append(math)
//athelete2.grades.append(math)
//
//athelete1.minimumTrainingTime
//athelete2.minimumTrainingTime
//
//athelete2.footballTeam
//
//athelete1.train()
//athelete1.trainedTime
//
//athelete2.train()
//athelete2.trainedTime
//
//athelete1 = athelete2 as StudentAthlete
//athelete1.train()
//athelete1.trainedTime
//
//if let son = athelete1 as? FootballPlayer {
//    print("team : \(son.footballTeam)")
//}
