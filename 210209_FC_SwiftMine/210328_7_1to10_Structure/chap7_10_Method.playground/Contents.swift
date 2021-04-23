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
 
 // 제곱, 반값
 extension Math {
    static func squre(value: Int) -> Int {
        return value * value
    }
    
    static func half(value: Int) -> Int {
        return value/2
    }
 }
 
 Math.squre(value: 5)
 Math.half(value: 20)
 
 var value: Int = 10
 
 extension Int {
    func squre() -> Int {
        return self * self
    }
    
    func half() -> Double {
        return Double(self/2)
    }
 }
 
 
 value.squre()
 value.half()
