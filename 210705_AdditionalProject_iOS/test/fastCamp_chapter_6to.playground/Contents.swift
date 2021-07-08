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
