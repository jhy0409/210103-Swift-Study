import UIKit

struct Lecture {
    var title: String
    var maxStudents: Int = 10
    var numOfResistered: Int = 0
    
    func remainSeats() -> Int {
        let remainSeates = maxStudents - numOfResistered
        return remainSeates
    }
    
    mutating func register() {
        // 등록된 학생수 증가시키기
        numOfResistered += 8
    }
    
    static let target: String = "Anybody want to learn something"
    static func 학원이름() -> String {
        return "패캠"
    }
}

var lec = Lecture(title: "iOS Basic")

//func remainSeats(of lec: Lecture) -> Int {
//    let remainSeates = lec.maxStudents - lec.numOfResistered
//    return remainSeates
//}
//
//remainSeats(of: lec)


lec.remainSeats()
lec.register()
lec.remainSeats()

Lecture.target
Lecture.학원이름()
