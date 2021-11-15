import UIKit

/*: ## N번째*/
// MARK: - [] struct Grade var letter(Ch), points, credits(Double)

// MARK: - [] class Person var firstName, lastName, init, func printMyName()

// MARK: - [] class Student : Person, var grades: [Grade] = []
    // init(firstName, lastName)
    // convenience(student: Student)

// MARK: - [] class StudentAthlete: Student 학생인데 운동선수
    // var minimunTrainingTime: Int = 2
    // var trainedTime = 0
    // var sports: [String]

    // init
    // convenience init
    // func train() += 1

// MARK: - [] class FootballPlayer: StudentAth... 운동선수인데 축구선수

    // var footballTeam = "FC Swift"
    // train() += 2

// MARK: - [] try..
    // student1 = Jason Lee
    // student1_1 = Student(student: student1)

    // student2 = StudentAthlete Jay, Lee, Football
    // student3 = Mike


/*: ## 2번째*/
// MARK: - [] struct Grade var letter(Ch), points, credits(Double)
struct
// MARK: - [] class Person var firstName, lastName, init, func printMyName()

// MARK: - [] class Student : Person, var grades: [Grade] = []
    // init(firstName, lastName)
    // convenience(student: Student)

// MARK: - [] class StudentAthlete: Student 학생인데 운동선수
    // var minimunTrainingTime: Int = 2
    // var trainedTime = 0
    // var sports: [String]

    // init
    // convenience init
    // func train() += 1

// MARK: - [] class FootballPlayer: StudentAth... 운동선수인데 축구선수

    // var footballTeam = "FC Swift"
    // train() += 2

// MARK: - [] try..
    // student1 = Jason Lee
    // student1_1 = Student(student: student1)

    // student2 = StudentAthlete Jay, Lee, Football
    // student3 = Mike


/*: ## 1번째*/
//// MARK: - [🟡] struct Grade var letter(Ch), points, credits(Double)
//struct Grade {
//    var letter: Character
//    var points: Double
//    var credits: Double
//}
//
//// MARK: - [🟡] class Person var firstName, lastName, init, func printMyName()
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
//        print("my name is \(firstName) \(lastName)")
//    }
//}
//
//// MARK: - [🔴] class Student : Person, var grades: [Grade] = []
//    // init(firstName, lastName)
//    // convenience(student: Student)
//class Student: Person {
//    var grades: [Grade] = []
//
//    override init(firstName: String, lastName: String) {
//        super.init(firstName: firstName, lastName: lastName)
//    }
//
//    convenience init(student: Student) {
//        self.init(firstName: student.firstName, lastName: student.lastName)
//    }
//}
//
//// MARK: - [🔴] class StudentAthlete: Student 학생인데 운동선수
//    // var minimunTrainingTime: Int = 2
//    // var trainedTime = 0
//    // var sports: [String]
//
//    // init
//    // convenience init
//    // func train() += 1
//class StudentAthlete: Student {
//    var minimumTariningTime: Int = 2
//    var trainedTime: Int = 0
//    var sports: [String]
//
//    init(firstName: String, lastName: String, sports: [String]) {
//        self.sports = sports
//        super.init(firstName: firstName, lastName: lastName)
//
//        self.train()
//    }
//
//    convenience init(name: String) {
//        self.init(firstName: name, lastName: "", sports: [])
//    }
//
//    func train() {
//        trainedTime += 1
//    }
//}
//
//
//// MARK: - [🔴] class FootballPlayer: StudentAth... 운동선수인데 축구선수
//
//    // var footballTeam = "FC Swift"
//    // train() += 2
//class FootballPlayer: StudentAthlete {
//    var footballTeam = "FC Swift"
//
//    override func train() {
//        trainedTime += 2
//    }
//}
//
//
//// MARK: - [🔴] try..
//    // student1 = Jason Lee
//    // student1_1 = Student(student: student1)
//
//    // student2 = StudentAthlete Jay, Lee, Football
//    // student3 = Mike
//let student1 = Student(firstName: "1. Class - Student / Jason", lastName: "Lee")
//let student1_1 = Student(student: student1)
//
//let student2 = StudentAthlete(firstName: "2. Class - StuAthlete / Jay", lastName: "Lee", sports: ["Football"])
//
//let student3 = StudentAthlete(name: "Mike")
