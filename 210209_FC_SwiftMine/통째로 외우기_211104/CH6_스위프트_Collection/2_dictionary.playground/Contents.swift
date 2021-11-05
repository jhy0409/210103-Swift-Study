import UIKit

/*: ##  N회차*/
// MARK: - [] 1. 이름과 점수를 저장하는 딕셔너리 만들기
    // Jason 80, Jay 95, Jake 90
// MARK: - [] 1번에서 값을 찾아서 있을 때 없을 때 분기처리 하기 (Jason)
// MARK: - [] 키 값으로 찾아보기 - Jay, Jerry
// MARK: - [] 빈 딕셔너리 만들기
// MARK: - [] 비었는지 확인, 갯수 확인
// MARK: - [] 기존 사용자 업데이트 - Jason 99
// MARK: - [] 사용자 추가 - Jack 100
// MARK: - [] 사용자 제거 - Jack
// MARK: - [] For Loop (name, score) in...
// MARK: - [] For Loop 키 열거 및 출력
// MARK: - [] 딕셔너리 만들기
    /*
         1 이름, 직업, 도시 에대해서 본인의 딕셔너리 만들기 (myDic)
         2 여기서 도시를 부산으로 업데이트 하기
         3 딕셔너리를 받아서 이름과 도시 프린트하는 함수 만들기 (printNameAndCity), if-let으로 바인딩
     */



/*: ##  1회차*/
// MARK: - [🟢] 1. 이름과 점수를 저장하는 딕셔너리 만들기
    // Jason 80, Jay 95, Jake 90
var scoreDic: [String: Int] = ["Jason": 80, "Jay": 95, "Jake": 90]

// MARK: - [🟢] 1번에서 값을 찾아서 있을 때 없을 때 분기처리 하기 (Jason's score)
if let score = scoreDic["Jason"] {
    print(score)
} else {
    // NONE...
}

// MARK: - [🟢] 키 값으로 찾아보기 - Jay, Jerry
scoreDic["Jay"]
scoreDic["Jerry"]

// MARK: - [🟢] 빈 딕셔너리 만들기
//scoreDic = [:]

// MARK: - [🟢] 비었는지 확인, 갯수 확인
scoreDic.isEmpty
scoreDic.count

// MARK: - [🟢] 기존 사용자 업데이트 - Jason 99
scoreDic
scoreDic["Jason"] = 99
scoreDic

// MARK: - [🟢] 사용자 추가 - Jack 100
scoreDic
scoreDic["Jack"] = 100
scoreDic

// MARK: - [🟢] 사용자 제거 - Jack
scoreDic
scoreDic["Jack"] = nil
scoreDic

// MARK: - [🟢] For Loop (name, score) in...
for (name, score) in scoreDic {
    print("\(name), \(score)")
}

// MARK: - [🟢] For Loop 키 열거 및 출력
for key in scoreDic.keys {
    print(key)
}
// MARK: - [🟠] 딕셔너리 만들기
/*
     1 이름, 직업, 도시 에대해서 본인의 딕셔너리 만들기 (myDic)
     2 여기서 도시를 부산으로 업데이트 하기
     3 딕셔너리를 받아서 이름과 도시 프린트하는 함수 만들기 (printNameAndCity), if-let으로 바인딩
 */

var myDic: [String: String] = ["name": "myName", "job": "hacker", "city": "Seoul"]
myDic["city"] = "Busan"
myDic
print()

func printNameAndCity(dic: [String: String]) {
    if let name = dic["name"], let city = dic["city"] {
        print(name, city)
    }
}
printNameAndCity(dic: myDic)
