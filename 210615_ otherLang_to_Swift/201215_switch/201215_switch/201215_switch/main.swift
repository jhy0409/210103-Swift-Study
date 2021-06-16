//
//  main.swift
//  201215_switch
//
//  Created by inooph on 2021/06/15.
//

import Foundation

// java code 원본링크
// https://github.com/jhy0409/jhy0409/tree/main/3%20JavaClass/201215_Switch/src

let strLine = "-----------------------------"
/*
 let grade: Character = "D"
 switch grade {
 case "A":
 print("A학점")
 case "B":
 print("B학점")
 case "C":
 print("C학점")
 case "D":
 print("D학점")
 default:
 print("F학점")
 }
 
 // Scanner s = new Scanner(System.in);
 // System.out.print("월(1~12)을 입력: ");
 // int month = s.nextInt();
 //
 // switch (month) {
 // case 3: case 4: case 5:
 //     System.out.println("봄");
 //     break;
 //
 // case 6: case 7: case 8:
 //     System.out.println("여름");
 //     break;
 // // ... 생략 ...
 // default:
 //    System.out.println("잘못된 입력!");
 // }
 
 let errorStr = "유효하지 않은 입력"
 
 enum Seasons {
 static let spring = 3...5
 static let summer = 6...8
 static let autumn = 9...12
 static let winter = 1...2
 }
 
 print("\nSwitch2. 1~12사이의 수를 입력하세요 ")
 var inputNum = Int(readLine()!) ?? 99
 var seasonStr = ""
 
 var seasonResult = strToFourSeason(inputNum)
 if seasonResult != errorStr {
 print("현재 계절은 \(seasonResult)입니다.")
 } else {
 print(errorStr)
 }
 
 func strToFourSeason(_ inputNum: Int) -> String {
 switch inputNum {
 case Seasons.spring:
 seasonStr = "봄"
 case Seasons.summer:
 seasonStr = "여름"
 case Seasons.autumn:
 seasonStr = "가을"
 case Seasons.winter:
 seasonStr = "겨울"
 default:
 seasonStr = errorStr
 }
 return seasonStr
 }
 
 print("\nSwitch4. 시간대 별 업무목록 ")
 var time = Int.random(in: 7...24)
 todayList(time)
 
 func todayList(_ time: Int) -> () {
 switch time {
 case 7...9:
 print("AM \(time): 출근 중")
 case 10...11:
 print("AM \(time): 근무")
 case 12...13:
 print("PM \(time): 점심")
 case 14..<19:
 print("PM \(time): 근무")
 default:
 if time>=19{
 print("PM \(time): 유효하지 않은 값")
 } else {
 print("AM \(time): 유효하지 않은 값")
 }
 }
 }
 */

// 실습3 담배자판기 프로그램
// https://www.notion.so/201215-Switch-e76b864d95c64b4e85f4761f7a22b122#52bbe9e329554b4993beacbaa98bc290

struct Dambae {
    let name: String
    let price: Int
    var index = 1
    
    init(name: String, price: Int) {
        self.name = name
        self.price = price
        self.index += 1
    }
}

let DambaeList: [Dambae] = [
    Dambae(name: "에쎄 골든 리프", price: 6000),
    Dambae(name: "에쎄 스페셜 골드", price: 5000),
    Dambae(name: "더원 블루", price: 4500),
    Dambae(name: "더원 오렌지", price: 4500),
    Dambae(name: "더원 화이트", price: 4500)
]

var tmpDB = [Dambae]()

let errDBsrt = 99
func menu() -> Int {
    print("\(strLine)\n\t담배 자판기 프로그램 v1.0\n\(strLine)")
    print("원하는 담배를 메뉴에서 선택하세요.\n")
    
    var tempI = 1
    for dbList in DambaeList {
        if tempI > 2 {
            print("\(tempI). \(dbList.name)\t\t\t\(dbList.price)")
        }
        else if tempI == 2 {
            print("\(tempI). \(dbList.name)\t\t\(dbList.price)")
        }
        else {
            print("\(tempI). \(dbList.name)\t\t\(dbList.price)")
        }
        tempI += 1
    }
    print("\(strLine)\n 숫자로 입력")
    
    guard let selectN = Int(readLine()!) else { return errDBsrt }
    return selectN
}

let selectedDB = menu()
let sontakDB = DambaeList.firstIndex(where: { $0.index == selectedDB })



//print("선택하신 담배는 \(String(describing: sontakDB))")

