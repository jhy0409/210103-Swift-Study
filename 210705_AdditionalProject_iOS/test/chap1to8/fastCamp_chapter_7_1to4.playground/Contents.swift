import UIKit

// chapter 7-2 실습
// chapter 1~6 : basic types Int, String, Array, Dictionary...
/*
 관계있는 값끼리 한꺼번에 표현 및 저장
 ex) 강의 이름, 학생 수 인원 묶어서 저장
 
 Obcect = Data + Method (관계있는 데이터 묶어서 저장)
 Struct = 관계있는 데이터 묶어서 저장
 
 오브젝트 구현방식 : Structure, Class
 
 편의점 정보를 묶어서 표현 - [ 브랜드, 위치, 로고, 물품 목록 ]
 - 가장 가까운 편의점 찾기
 */

// 문제 : 가장 가까운 편의점 찾기
// 맨처음 시작시 코드

/*
 =============== 코드 개선 전(struct 미사용)
 
 // 현재 스토어 위치들
 let store1 = (x: 3, y: 5, name: "gs편의점")
 let store2 = (x: 4, y: 6, name: "seven편의점")
 let store3 = (x: 1, y: 7, name: "cu편의점")
 
 // 거리 구하는 함수
 func distance(current: (x: Int, y: Int), target: (x: Int, y: Int)) -> Double {
 let distanceX = Double(target.x - current.x) // 거리차이 : 가로
 let distanceY = Double(target.y - current.y) // 거리차이 : 세로
 let distance = sqrt(distanceX * distanceX + distanceY * distanceY) // 피타고라스
 return distance
 }
 
 // 가장 가까운 편의점 프린트하는 함수
 func printClosestStore(currentLocation: (x: Int, y: Int), stores:[(x: Int, y: Int, name: String)]) { // 사람의 현재위치, 편의점 목록을 받는다.
 var closestStoreName = "" // 근처 편의점 이름 저장할 변수선언
 var closestStoreDistance = Double.infinity // 근처매장거리 - 최소값 대조위한 변수선언
 
 for store in stores {
 let distanceToStore = distance(current: currentLocation, target: (x: store.x, y: store.y))
 // 현위치의 튜플을 넘김, 현재 순서의 배열 내 매장위치 튜플값을 넘김
 closestStoreDistance = min(distanceToStore, closestStoreDistance)
 // 현재배열 순서에서 계산된 거리(더블 최대값)중에서 최소값으로 재할당
 // 두번째 실행 시 첫번째 편의점 값에서 대조함!
 
 if closestStoreDistance == distanceToStore { // 최소값이 계산된 값과 같으면
 closestStoreName = store.name // 근처 편의점 이름을 현재 편의점이름으로 정의한다.
 }
 }
 print("Closest store: \(closestStoreName)")
 }
 */



/*
 // =============== 코드 개선1 (struct - Location)
 // 현재 스토어 위치들
 let store1 = (loc: Location(x: 3, y: 5), name: "gs편의점")
 let store2 = (loc: Location(x: 4, y: 6), name: "seven편의점")
 //let store3 = (x: 1, y: 7, name: "cu편의점")
 let store3 = (loc: Location(x: 1, y: 7), name: "cu편의점")
 
 // 거리 구하는 함수
 func distance(current: Location, target: Location) -> Double {
 let distanceX = Double(target.x - current.x) // 거리차이 : 가로
 let distanceY = Double(target.y - current.y) // 거리차이 : 세로
 let distance = sqrt(distanceX * distanceX + distanceY * distanceY) // 피타고라스
 return distance
 }
 
 // 가장 가까운 편의점 프린트하는 함수
 func printClosestStore(currentLocation: Location, stores:[(loc: Location, name: String)]) { // 사람의 현재위치, 편의점 목록을 받는다.
 var closestStoreName = "" // 근처 편의점 이름 저장할 변수선언
 var closestStoreDistance = Double.infinity // 근처매장거리 - 최소값 대조위한 변수선언
 
 for store in stores {
 let distanceToStore = distance(current: currentLocation, target: store.loc)
 // 현위치의 튜플을 넘김, 현재 순서의 배열 내 매장위치 튜플값을 넘김
 closestStoreDistance = min(distanceToStore, closestStoreDistance)
 // 현재배열 순서에서 계산된 거리(더블 최대값)중에서 최소값으로 재할당
 // 두번째 실행 시 첫번째 편의점 값에서 대조함!
 
 if closestStoreDistance == distanceToStore { // 최소값이 계산된 값과 같으면
 closestStoreName = store.name // 근처 편의점 이름을 현재 편의점이름으로 정의한다.
 }
 }
 print("Closest store: \(closestStoreName)")
 }
 
 // Stores Array 세팅, 내위치 세팅
 let myLocation = Location(x: 2, y: 2)
 let stores = [store1, store2, store3] // Location struct와 편의점 이름을 가진 편의점 튜플 배열
 
 // printClosetStore 함수 이용해서 현재 가장 가까운 스토어 출력
 printClosestStore(currentLocation: myLocation, stores: stores)
 
 // Improve Code
 // - make Location struct
 // - make Store struct
 
 struct Location {
 let x: Int
 let y: Int
 }
 
 struct Store {
 let loc: Location
 let name: String
 }
 */

/*
 // =============== 코드 개선2 (struct - Locatio, Store)
 // 현재 스토어 위치들
 let store1 = Store(loc: Location(x: 3, y: 5), name: "gs편의점")
 let store2 = Store(loc: Location(x: 4, y: 6), name: "seven편의점")
 //let store3 = (x: 1, y: 7, name: "cu편의점")
 let store3 = Store(loc: Location(x: 1, y: 7), name: "cu편의점")
 
 // 거리 구하는 함수 ----- (개선 후) 의미단위로 표현 가능
 func distance(current: Location, target: Location) -> Double {
 let distanceX = Double(target.x - current.x) // 거리차이 : 가로
 let distanceY = Double(target.y - current.y) // 거리차이 : 세로
 let distance = sqrt(distanceX * distanceX + distanceY * distanceY) // 피타고라스
 return distance
 }
 
 // 가장 가까운 편의점 프린트하는 함수
 func printClosestStore(currentLocation: Location, stores:[Store]) { // 사람의 현재위치, 편의점 목록을 받는다.
 var closestStoreName = "" // 근처 편의점 이름 저장할 변수선언
 var closestStoreDistance = Double.infinity // 근처매장거리 - 최소값 대조위한 변수선언
 var isDeliverable = false
 
 var addMsg = ""
 for store in stores {
 let distanceToStore = distance(current: currentLocation, target: store.loc)
 // 현위치의 튜플을 넘김, 현재 순서의 배열 내 매장위치 튜플값을 넘김
 closestStoreDistance = min(distanceToStore, closestStoreDistance)
 // 현재배열 순서에서 계산된 거리(더블 최대값)중에서 최소값으로 재할당
 // 두번째 실행 시 첫번째 편의점 값에서 대조함!
 
 if closestStoreDistance == distanceToStore { // 최소값이 계산된 값과 같으면
 closestStoreName = store.name // 근처 편의점 이름을 현재 편의점이름으로 정의한다.
 isDeliverable = store.isDeliverable(userLoc: currentLocation)
 
 addMsg = isDeliverable ? "배달 가능" : "배달 불가"
 }
 }
 print("Distance: \(closestStoreDistance) \nClosest store: \(closestStoreName), isDeliverable: \(addMsg)")
 }
 
 // Stores Array 세팅, 내위치 세팅
 let myLocation = Location(x: 2, y: 5)
 let stores = [store1, store2, store3] // Location struct와 편의점 이름을 가진 편의점 튜플 배열
 
 // printClosetStore 함수 이용해서 현재 가장 가까운 스토어 출력
 printClosestStore(currentLocation: myLocation, stores: stores)
 
 // Improve Code
 // - make Location struct
 // - make Store struct
 
 struct Location {
 let x: Int
 let y: Int
 }
 
 struct Store {
 let loc: Location
 let name: String
 let deliveryRange = 2.0
 
 func isDeliverable(userLoc: Location) -> Bool {
 let distanceToStore = distance(current: userLoc, target: loc)
 return distanceToStore < deliveryRange
 // ex) 계산값이 5면 < 2 -> false
 }
 }
 */

// chapter 7-3 실습
let doubleLineStr = "=============================="

/*
 실습문제
 
 1. 강의 이름, 강사 이름, 학생수를 가지는 Struct 만들기 (Lecture)
 2. 강의 어레이, 강사이름 전달 -> 해당강사 강의이름 출력하는 함수 만들기
 3. 강의 3개 만들고 강사 이름으로 강의 찾기
 */
/*
 // ------------ 내 풀이 ------------
 struct Lecture {
 let subject: String
 let gangsa: String
 var studentNum: Int
 }
 
 func printLecture(lec: [Lecture], gangsaIrum: String) {
 //    var lectureName = ""
 //    for tmp in lec {
 //        if(gangsaIrum == tmp.gangsa) { // 받아오는 값 == 현재강사 이름
 //            lectureName = tmp.gangsa
 //        }
 //    }
 
 // 클로저 활용1 - 축약 전 정식문법
 //let lectureName = lectures.first{ (lec) -> Bool in
 //    return lec.gangsa == gangsaIrum
 //}?.subject ?? ""
 
 // 클로저 활용2 - 축약
 let lectureName = lectures.first{ $0.gangsa == gangsaIrum }?.subject ?? ""
 let lc = lectures.first{ $0.gangsa == gangsaIrum } ?? nil
 
 if lectureName.count == 0 {
 print("해당 강사의 강의가 존재하지 않습니다.")
 return
 }
 print("강의이름 : \(lectureName)")
 }
 
 let gangwi_1 = Lecture(subject: "1강의", gangsa: "1강사", studentNum: 1111)
 let gangwi_2 = Lecture(subject: "2강의", gangsa: "2강사", studentNum: 2222)
 let gangwi_3 = Lecture(subject: "3강의", gangsa: "3강사", studentNum: 3333)
 
 let lectures: [Lecture] = [gangwi_1, gangwi_2, gangwi_3]
 
 printLecture(lec: lectures, gangsaIrum: "1강사")
 */


// chapter 7-4 실습
/*
 struct Lecture: CustomStringConvertible {
 // 설명형으로 쓸 때 CustomStringConvertible 프로토콜 활용
 var description: String {
 return "Title \(subject), gangsa: \(gangsa)"
 }
 
 let subject: String
 let gangsa: String
 var studentNum: Int
 }
 
 func printLecture(lec: [Lecture], gangsaIrum: String) {
 
 var lectureName = ""
 
 for lc in lec {
 if gangsaIrum == lc.gangsa {
 lectureName = lc.gangsa
 }
 }
 if lectureName.count == 0 {
 print("해당 강사의 강의가 존재하지 않습니다.")
 return
 }
 print("강의이름 : \(lectureName)")
 }
 
 let gangwi_1 = Lecture(subject: "1강의", gangsa: "1강사", studentNum: 1111)
 let gangwi_2 = Lecture(subject: "2강의", gangsa: "2강사", studentNum: 2222)
 let gangwi_3 = Lecture(subject: "3강의", gangsa: "3강사", studentNum: 3333)
 
 let lectures: [Lecture] = [gangwi_1, gangwi_2, gangwi_3]
 
 printLecture(lec: lectures, gangsaIrum: "5강사")
 print(gangwi_1)
 */