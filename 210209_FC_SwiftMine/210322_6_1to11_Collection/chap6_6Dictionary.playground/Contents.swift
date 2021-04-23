import UIKit

// ------------ 챕터 6-6 ------------
var scoreDic: [String: Int] = ["Jason": 80, "Jay": 95, "Jake": 90]
//var scoreDic2: Dictionary<String, Int> = ["Jason": 80, "Jay": 95, "Jake": 90]

if let score = scoreDic["Jason"] {
    score
} else {
    // 값이 없다.
}
scoreDic["Jay"]
// 미포함 값 호출
scoreDic["Jerry"]

//scoreDic = [:]
scoreDic.isEmpty
scoreDic.count

// 기존사용자, 값 업데이트 : 키값 넣고 변경값 할당
scoreDic["Jason"] = 99
scoreDic

// 사용자 추가
scoreDic["Jack"] = 100
scoreDic

// 사용자 제거
scoreDic["Jack"] = nil
scoreDic

// for loop
for (name, score) in scoreDic {
    print("\(name), \t\(score)")
}

print("\n키 값만 보기\n----------")
for key in scoreDic.keys {
    print(key)
}
// 딕셔너리의 키 값은 기본적으로 순서가 없다.(고정되지 X)


/* 과제
 1. 이름, 직업, 도시에 대해서 개인 딕셔너리 만들기
 2. 도시를 부산으로 업데이트
 3. 딕셔너리 받아서 이름과 도시 프린트하는 함수 만들기

 */

var person: [String: String] = ["홍길동": "개발자, 서울", "고길동": "개발자, 대전",
                                "나길동": "개발자, 대구"]

person["홍길동"] = "개발자, 부산"
person

for (name, job) in person {
    print("이름: \(name) / 직업, 고향: \(job)")
}

// ---------------------------------------

var MyDic: [String: String] = ["name": "Jason", "job": "iOS Engineer", "city": "Seoul"]

MyDic["city"] = "Busan"
MyDic

func printNameAndCity(dic: [String: String]){
    if let name = dic["name"],let city = dic["city"] {
        print(name, city)
    } else {
        print("---> Cannot find")
    }
}
printNameAndCity(dic: MyDic)
