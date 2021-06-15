//
//  main.swift
//  201209_if_3_
//
//  Created by inooph on 2021/06/15.
//
//20년 12월 9일 자바수업 if문
//(원본링크)
//https://github.com/jhy0409/jhy0409/tree/main/3%20JavaClass/201209_if/src

import Foundation

/*
//public class IF3 {
//    public static void main(String[] args) {
//        Scanner s = new Scanner(System.in);
//        System.out.print("숫자를 입력: ");
//        int num = s.nextInt();
//
//        if (num%2!=0) {
//            //if (num%2!=0) == if (num%2==1)
//            System.out.println("홀수입니다.");
//        }
//        if (num%2==0) {
//            System.out.println("짝수입니다.");
//        }
//        s.close();
//    }
//}


print("if 3. 숫자를 입력")
var inputData3 = Int(readLine()!)!
sHi(inputData3)

func sHi(_ num: Int) -> (){
    if(num % 2 == 0) {
        print("num(\(num))은 짝수입니다.")
    }
    
    if(num % 2 != 0) {
        print("num(\(num))은 홀수입니다.")
    }
    //    guard var iData = Int(readLine()!) else { return }
}

 
//public class IF4 {
// public static void main(String[] args) {
//         Scanner s = new Scanner(System.in);
//         System.out.print("숫자를 입력: ");
//         int num = s.nextInt();
//
//         if (100 >= num && num >= 90) {
//             System.out.println("A학점");
//         }
//         else if (89 >= num && 80<= num) {
//             System.out.println("B학점");
//         }
//         else {
//             System.out.println("A, B제외 학점");
//         }
//         s.close();
// }
//}
print("\nif 4. 숫자를 입력")
var inputData4 = Int(readLine()!)!
var str: String = "학점"
let A_HAKJUM = "A"
let B_HAKJUM = "B"

if 100 >= inputData4 && 90 <= inputData4 {
    print(A_HAKJUM+str)
} else if 89 >= inputData4 && 80 <= inputData4 {
    print(B_HAKJUM+str)
} else {
    print("그 외의 "+str)
}
 */

let retrn_str = "값을 입력하세요"
enum GBwiB: UInt32 {
    case gawi, bawi, bo, none
}

enum GameState: UInt32 {
    case win, lose, draw
}
print("\nif 5. 가위(0), 바위(1), 보(2) 입력")

var inputGBB = uint32(readLine()!)!
var randNum = [ 0, 1, 2 ]

var comGBB = GBwiB.init(rawValue: UInt32(randNum.randomElement()!))!
/*
 let positionToFind = 11
 if let somePlanet = Planet(rawValue: positionToFind) {
 switch somePlanet {
 case .earth:
 print("Mostly harmless")
 default:
 print("Not a safe place for humans")
 }
 } else {
 print("There isn't a planet at position \(positionToFind)")
 }
 */
if let userhoice = GBwiB(rawValue: inputGBB) {
    switch userhoice {
    case .gawi:
        switch comGBB {
        case .gawi:
            print("결과: \(GameState.draw)/ 사용자: \(userhoice), 컴퓨터: \(comGBB)") // 같은거, 비김
        
        case .bawi:
            print("결과: \(GameState.lose)/ 사용자: \(userhoice), 컴퓨터: \(comGBB)") // 짐
        
        default:
            print("결과: \(GameState.win)/ 사용자: \(userhoice), 컴퓨터: \(comGBB)") // 이김
        }
        
    case .bawi:
        switch comGBB {
        case .gawi:
            print("결과: \(GameState.win)/ 사용자: \(userhoice), 컴퓨터: \(comGBB)")
        
        case .bawi:
            print("결과: \(GameState.draw)/ 사용자: \(userhoice), 컴퓨터: \(comGBB)")
        
        default:
            print("결과: \(GameState.lose)/ 사용자: \(userhoice), 컴퓨터: \(comGBB)")
        }
    default: // 보
        switch comGBB {
        case .gawi:
            print("결과: \(GameState.lose)/ 사용자: \(userhoice), 컴퓨터: \(comGBB)")
        
        case .bawi:
            print("결과: \(GameState.win)/ 사용자: \(userhoice), 컴퓨터: \(comGBB)")
        
        default:
            print("결과: \(GameState.draw)/ 사용자: \(userhoice), 컴퓨터: \(comGBB)")
        }
    }
} else { print("올바르지 않은 입력입니다. 0~2사이의 값을 입력하세요\n\(inputGBB)")}











//exit_thisFunc:
//if userGBB == GBwiB.none {
//    break exit_thisFunc
//}
//
//switch userGBB {
//case .gawi:
//    <#code#>
//default:
//    <#code#>
//}



//func result_GBB (_ userInput: GBwiB) -> GameState {
//
//}
//result_GBB(inputGBB)



