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
/*: ## N번째 - 도전 과제*/
// MARK: - [] 1. 강의 이름(name), 강사 이름(instructor), 학생수(numOfStudent)를 가지는 Struct 만들기 (Lecture) / CustomStringConvertible

// MARK: - [] 2. 강의배열과 강사이름을 받아서 , 해당 강사의 강의 이름을 출력하는 함수 만들기 - printLectureName

// MARK: - [] 3. 강의 3개 만들고 강사이름으로 강의 찾기
    // iOS Basic, Jason
    // iOS Advanced, Jack
    // iOS Pro, Jim


/*: ## 2번째 - 도전 과제*/
// MARK: - [🟢] 1. 강의 이름(name), 강사 이름(instructor), 학생수(numOfStudent)를 가지는 Struct 만들기 (Lecture) / CustomStringConvertible

struct Lecture: CustomStringConvertible {
    let name: String
    let instructor: String
    let numOfStudent: Int
    
    var description: String {
        return "Title: \(name),  Instructor: \(instructor)"
    }
}


// MARK: - [🟢] 2. 강의배열과 강사이름을 받아서 , 해당 강사의 강의 이름을 출력하는 함수 만들기 - printLectureName

func printLectureName(from instructor: String, lectures: [Lecture]) {
    var lectureName = ""
    
//    for lecture in lectures {
//        if instructor == lecture.instructor {
//            lectureName = lecture.name
//        }
//    }
    
    lectureName = lectures.first{$0.instructor == instructor}?.name ?? ""
    print("강사 : \(instructor) - 담당 강의 이름: \(lectureName)")
}

// MARK: - [🟢] 3. 강의 3개 만들고 강사이름으로 강의 찾기
    // iOS Basic, Jason
    // iOS Advanced, Jack
    // iOS Pro, Jim
let lec1 = Lecture(name: "iOS Basic", instructor: "Jason", numOfStudent: 5)
let lec2 = Lecture(name: "iOS Advanced", instructor: "Jack", numOfStudent: 5)
let lec3 = Lecture(name: "iOS Pro", instructor: "Jim", numOfStudent: 5)

let lectures = [lec1, lec2, lec3]

printLectureName(from: "Jason", lectures: lectures)
print(lec3)
/*: ## 1번째 - 도전 과제*/

//printChapterTitle(title: "1번째 - 도전 과제", isDone: 1)
//// MARK: - [🟠] 1. 강의 이름(name), 강사 이름(instructor), 학생수(numOfStudent)를 가지는 Struct 만들기 (Lecture) / CustomStringConvertible
//struct Lecture: CustomStringConvertible {
//    var description: String {
//        return "Title: \(name), Instructor: \(instructor)"
//    }
//
//    let name: String
//    let instructor: String
//    let numOfStudent: Int
//}
//
//// MARK: - [🟠] 2. 강의배열과 강사이름을 받아서 , 해당 강사의 강의 이름을 출력하는 함수 만들기 - printLectureName
//func printLectureName(from instructor: String, lectures: [Lecture]) {
//    var lectureName = ""
//
//    for lecture in lectures {
//        if instructor == lecture.instructor {
//            lectureName = lecture.name
//        }
//    }
//    print("\(instructor)담당 강의 : \(lectureName)")
//}
//
//// MARK: - [🟠] 3. 강의 3개 만들고 강사이름으로 강의 찾기
//    // iOS Basic, Jason
//    // iOS Advanced, Jack
//    // iOS Pro, Jim
//
//let lec1 = Lecture(name: "iOS Basic", instructor: "Jason", numOfStudent: 5)
//let lec2 = Lecture(name: "iOS Advanced", instructor: "Jack", numOfStudent: 5)
//let lec3 = Lecture(name: "iOS Pro", instructor: "Jim", numOfStudent: 5)
//
//let lectures = [lec1, lec2, lec3]
//
//printLectureName(from: "Jack", lectures: lectures)
//print(lec1)
