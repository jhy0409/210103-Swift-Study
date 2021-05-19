import UIKit

// 도전 과제
// 1. 강의 이름, 강사 이름, 학생수를 가지는 Struct 만들기 (Lecture)
// 2. 강의 어레이이와 강사이름을 받아서 , 해당 강사의 강의 이름을 출력하는 함수 만들기
// 3. 강의 3개 만들고 강사이름으로 강의 찾기

//struct Lecture {
//    let className: String
//    let gangSa: String
//    let inwon: Int
//}
//
//let class1 = Lecture(className: "국어", gangSa: "김국어", inwon: 1)
//let class2 = Lecture(className: "수학", gangSa: "김수학", inwon: 2)
//let class3 = Lecture(className: "영어", gangSa: "김영어", inwon: 3)
//
//let classes = [class1,class2,class3]
//func findClass (class5: [Lecture], Sam: String){
//    for lec in class5 {
//        if(lec.gangSa == Sam){
//            print("강의이름: \(lec.className)/ 강사명: \(lec.gangSa)/ 수강인원: \(lec.inwon)")
//        }
//    }
//}
//
//findClass(class5: classes, Sam: "김영어")

// --------------------------------------------------------------------
struct Lecture {
    let name: String
    let instructor: String
    let numOfStudent: Int
}

let lec1 = Lecture(name: "iOS Basic", instructor: "Jason", numOfStudent: 1)
let lec2 = Lecture(name: "iOS Advanced", instructor: "Jack", numOfStudent: 2)
let lec3 = Lecture(name: "iOS Pro", instructor: "Jim", numOfStudent: 3)

let lectures = [lec1,lec2,lec3]
//func printLectureName (from instructor : String, lectures: [Lecture]) {
//    var lectureName = ""
//
//    for lecture in lectures {
//        if instructor == lecture.instructor {
//            lectureName = lecture.name
//        }
//    }
//    print("해당강사(\(instructor))의 강의과목 : \(lectureName)")
//}



//func printLectureName (from instructor : String, lectures: [Lecture]) {
//    let lectureName = lectures.first { (lec) -> Bool in
//        return lec.instructor == instructor
//    }?.name ?? ""
//    print("해당강사(\(instructor))의 강의과목 : \(lectureName)")
//}



func printLectureName (from instructor : String, lectures: [Lecture]) {
    let lectureName = lectures.first { $0.instructor == instructor}?.name ?? ""
    print("해당강사(\(instructor))의 강의과목 : \(lectureName)")
}


printLectureName(from: "Jim", lectures: lectures)



