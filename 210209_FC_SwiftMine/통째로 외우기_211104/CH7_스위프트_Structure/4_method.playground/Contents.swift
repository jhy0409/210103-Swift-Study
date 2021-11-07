import UIKit

func printChapterTitle(title: String, isDone: Int) {
    let doneStates = (not: "🔴", ing: "🟠", done: "🟢")
    let line = "\t---------------------"
    
    var resultString = ""
    
    switch isDone {
    case 0:
        resultString = "\(doneStates.not) \(title) \(line)"
    case 1:
        resultString = "\(doneStates.ing) \(title) \(line)"
    case 2:
        resultString = "\(doneStates.done) \(title) \(line)"
    default:
        break
    }
    
    print(resultString)
}
/*: ## N번째 */
// MARK: - [] 1. struct Lecture
    /*
     1. title - String
     2. maxStudents - Int / 10
     3. numOfRegistered - Int
 
     4. func remainSeats return remainSeats
     max - numof...
    
     5. func register - numOf... += 1
 
     static let target - String : Anybody want to learn something
 
     6. func 소속학원이름 -> return String "패캠"
    */

// MARK: - [] 2. lec = title - iOS Basic

// MARK: - [] 3. func remainSeats(of lec: Lecture) -> Int / return remainSeats

// MARK: - [] 4. Lecture.target

// MARK: - [] 5. Lecture.소속학원이름()

// MARK: - [] Math struct
    // static func abs -> int -> 절대값 반환 / -20
    // static func square -> int -> 제곱 반환 / 5
    // static func half -> int -> 반값 반환 / 20
    
// MARK: - [] Int 자료형 확장
    // value = 10
    // square
    // half


/*: ## 2번째 */
printChapterTitle(title: "2번째 struct Lecture", isDone: 1)
// MARK: - [🟡] 1. struct Lecture
    /*
     1. title - String
     2. maxStudents - Int / 10
     3. numOfRegistered - Int
 
     4. func remainSeats return remainSeats
     max - numof...
    
     5. func register - numOf... += 1
 
     static let target - String : Anybody want to learn something
 
     6. func 소속학원이름 -> return String "패캠"
    */

struct Lecture {
    var title: String
    var maxStudents: Int = 10
    var numOfRegistered: Int = 0
    
    func remainSeats() -> Int {
        let remainSeats = maxStudents - numOfRegistered
        return remainSeats
    }
    
    mutating func register() {
        numOfRegistered += 1
    }
    
    static let target: String = "Anybody want to learn something"
    static func 소속학원이름() -> String {
        return "패캠"
    }
}

// MARK: - [🟡] 2. lec = title - iOS Basic
var lec = Lecture(title: "iOS Basic")

// MARK: - [🟡] 3. func remainSeats(of lec: Lecture) -> Int / return remainSeats
func remainSeats(of lec: Lecture) -> Int {
    let remainSeats = lec.maxStudents - lec.numOfRegistered
    return remainSeats
}
lec.register()
lec.register()

remainSeats(of: lec)
lec.remainSeats()
// MARK: - [🟡] 4. Lecture.target
Lecture.target

// MARK: - [🟡] 5. Lecture.소속학원이름()
Lecture.소속학원이름()

// MARK: - [🟡] Math struct
    // static func abs -> int -> 절대값 반환 / -20
    // static func square -> int -> 제곱 반환 / 5
    // static func half -> int -> 반값 반환 / 20
struct Math {
    static func abs(value: Int) -> Int {
        if value > 0 {
            return value
        } else {
            return -value
        }
    }
}
extension Math {
    static func square(value: Int) -> Int {
        return value * value
    }
    
    static func half(value: Int) -> Int {
        return value/2
    }
}

Math.abs(value: -20)
Math.square(value: 5)
Math.half(value: 20)
    
// MARK: - [🟡] Int 자료형 확장
    // value = 10
    // square
    // half

var value: Int = 10
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

/*: ## 1번째 */
//printChapterTitle(title: "1번째 struct Lecture", isDone: 1)
//// MARK: - [🟠] 1. struct Lecture
//    /*
//     1. title - String
//     2. maxStudents - Int / 10
//     3. numOfRegistered - Int
//
//     4. func remainSeats return remainSeats
//     max - numof...
//
//     5. func register - numOf... += 1
//
//     static let target - String : Anybody want to learn something
//
//     6. static func 소속학원이름 -> return String "패캠"
//    */
//
//struct Lecture {
//    var title: String
//    var maxStudents: Int = 10
//    var numOfRegistered: Int = 0
//
//    func remainSeats() -> Int {
//        let remainSeats = maxStudents - numOfRegistered
//        return remainSeats
//    }
//
//    mutating func register() {
//        numOfRegistered += 1
//    }
//
//    static let target: String = "Anybody want to learn something"
//    static func 소속학원이름() -> String {
//        return "패캠"
//    }
//}
//
//// MARK: - [🟠] 2. lec = title - iOS Basic
//var lec = Lecture(title: "iOS Basic")
//
//// MARK: - [🟠] 3. func remainSeats(of lec: Lecture) -> Int / return remainSeats
//func remainSeats(of lec: Lecture) -> Int {
//    let remainSeats = lec.maxStudents - lec.numOfRegistered
//    return remainSeats
//}
//remainSeats(of: lec)
//lec.remainSeats()
//
//// MARK: - [🟠] 4. Lecture.target
//lec.register()
//lec.register()
//lec.register()
//lec.register()
//
//lec.register()
//lec.register()
//lec.register()
//lec.register()
//
//lec.remainSeats()
//
//Lecture.target
//
//// MARK: - [🟠] 5. Lecture.소속학원이름()
//Lecture.소속학원이름()
//
//// MARK: - [🟠] Math struct
//    // static func abs -> int -> 절대값 반환 / -20
//    // static func square -> int -> 제곱 반환 / 5 / extension ↓
//    // static func half -> int -> 반값 반환 / 20
//
//struct Math {
//    static func abc(value: Int) -> Int {
//        if value > 0 {
//            return value
//        } else {
//            return -value
//        }
//    }
//}
//Math.abc(value: -20)
//
//extension Math {
//    static func square(value: Int) -> Int {
//        return value * value
//    }
//
//    static func half(value: Int) -> Int {
//        return value/2
//    }
//}
//Math.square(value: 5)
//Math.half(value: 20)
//
//// MARK: - [🟠] Int 자료형 확장
//    // value = 10
//    // square
//    // half
//var value = 10
//
//extension Int {
//    func square() -> Int {
//        return self * self
//    }
//
//    func half() -> Int {
//        return self/2
//    }
//}
//
//value.square()
//value.half()
