import UIKit

var arr1: Array<Int> = [1, 2, 3]
var arr2: [Int] = [1, 2, 3]
var strArr: [String] = ["아이스 아메리카노", "아이스 까나리카노", "캬라멜 마끼아또", "핫초코", "스무디", "에이드", "복불복"]

for (i, j) in arr2.enumerated() {
    print("\(i)번째 값 : \(j)")
}
let doubleLine = "========================"
print("\n\(doubleLine)\n\t메뉴의 전체 개수는 \(strArr.count)\n\(doubleLine)")
for (idx, value) in strArr.enumerated() {
    print("\(idx + 1)번째 메뉴는 : \(value)")
}

// chapter 6-6 실습
var scoreDic: [String: Int] = ["짱구":15, "유리":30, "훈이":25, "맹구":50, "철수":70]

if let cholsu = scoreDic["철수"] {
    print("철수의 점수는 \(cholsu)점이다.")
}

//scoreDic = [:] // 빈 깡통 만들기
scoreDic.isEmpty
scoreDic.count

// 실습문제

// 이름, 직업, 도시
// 도시: 부산으로 업데이트
// 이름 도시 프린트 함수 만들기

print()
var myDic: [String: String] = ["name":"yjh", "job":"iOS 신입 개발자", "city":"Daegu"]
myDic["city"] = "★ Busan ★"

for (key, value) in myDic {
    print("\(key) - \(value)")
}

func printDic(dic: [String:String]) {
    if let name = dic["name"], let city = dic["city"] {
        print("이름 : \(name), 도시 : \(city)")
    } else {
        print("(안내) 값이 없습니다.")
    }
}

print()
//myDic = [:]
printDic(dic: myDic)

// chapter 6-7 실습
// array: 순서가 있는 아이템, dictionary: 키로 값 관리, Set: 중복없는 유니크한 아이템
// 공통 property : isEmpty, count, inser, remove
print("\n\(doubleLine)\nchapter 6-7 실습 : Set\n\(doubleLine)")
var someArray: Array<Int> = [1, 2, 3, 3, 3]
print("someArray count\t: \(someArray.count)") // print : 5

var someSet: Set<Int> = [1, 2, 2, 2, 3, 3, 3]
print("someSet count\t: \(someSet.count)") // print : 3

// chapter 6-8 클로저 : 이름이 없는 메소드
print("\n\(doubleLine)\nchapter 6-8 클로저 : 이름이 없는 메소드\n\(doubleLine)")

// 1. 정식문법
var gopagiClosure1_defSytx: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
    return a * b
}

// 2. 생략1
var gopagiClosure2_shrt1: (Int, Int) -> Int = { (a, b) in
    return a * b
}
/*
 1. 타입 파라미터, 소괄호 생략
 2. 반환형 생략
 3. 파라미터 인덱스로 바꿀 수 있음
 4. 리턴 생략
 */

// 2. 생략2
var gopagiClosure2_shrt2: (Int, Int) -> Int = { return $0 * $1 }

// 2. 생략3
var gopagiClosure2_shrt3: (Int, Int) -> Int = { $0 * $1 }

let num1 = 3
let num2 = 2

gopagiClosure1_defSytx(num1, num2)
gopagiClosure2_shrt1(num1, num2)
gopagiClosure2_shrt2(num1, num2)
gopagiClosure2_shrt3(num1, num2)

func operateTwoNum(a: Int, b: Int, operation: (Int, Int) -> Int) -> Int {
    let result = operation(a, b)
    return result
}

var addClosure: (Int, Int) -> Int = { a, b in
    return a + b
}
operateTwoNum(a: num1, b: num2, operation: gopagiClosure2_shrt1)
operateTwoNum(a: num1, b: num2, operation: addClosure)
operateTwoNum(a: 20, b: 2) { a, b in
    return a / b
}
