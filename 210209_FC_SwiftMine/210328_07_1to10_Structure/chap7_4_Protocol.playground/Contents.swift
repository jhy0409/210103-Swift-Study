import UIKit

// 도전 과제
// 1. 강의 이름, 강사 이름, 학생수를 가지는 Struct 만들기 (Lecture)
// 2. 강의 어레이이와 강사이름을 받아서 , 해당 강사의 강의 이름을 출력하는 함수 만들기
// 3. 강의 3개 만들고 강사이름으로 강의 찾기

// CustomStringConvertible

struct Lecture: CustomStringConvertible {
    let name: String
    let instructor: String
    let numOfStudent: Int
    
    var description: String {
        return "Title: \(name), Instructor: \(instructor)"
    }
}

func printLectureName (from instructor : String, lectures: [Lecture]) {
    var lectureName = ""
    
    for lecture in lectures {
        if instructor == lecture.instructor {
            lectureName = lecture.name
        }
    }
    
    // let lectureName = lectures.first { $0.instructor == instructor}?.name ?? ""
    print("해당강사(\(instructor))의 강의과목 : \(lectureName)")
}

let lec1 = Lecture(name: "iOS Basic", instructor: "Jason", numOfStudent: 1)
let lec2 = Lecture(name: "iOS Advanced", instructor: "Jack", numOfStudent: 2)
let lec3 = Lecture(name: "iOS Pro", instructor: "Jim", numOfStudent: 3)
let lectures = [lec1,lec2,lec3]

printLectureName(from: "Jim", lectures: lectures)
print(lec1)


