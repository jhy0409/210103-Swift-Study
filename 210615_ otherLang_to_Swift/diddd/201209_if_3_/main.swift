//
//  main.swift
//  diddd
//
//  Created by inooph on 2021/06/15.
//
//20년 12월 9일 자바수업 if문
//(원본링크)
//https://github.com/jhy0409/jhy0409/tree/main/3%20JavaClass/201209_if/src

import Foundation
let strLine = "-----------------------------"
//  201209_if_3_

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
 print("결과: \(GameState.win)/ 사용자: \(userhoice), 컴퓨터: \(comGBB)") // 사용자 이김
 
 case .bawi:
 print("결과: \(GameState.draw)/ 사용자: \(userhoice), 컴퓨터: \(comGBB)") // 비김
 
 default:
 print("결과: \(GameState.lose)/ 사용자: \(userhoice), 컴퓨터: \(comGBB)") // 사용자 짐
 }
 default: // 보
 switch comGBB {
 case .gawi:
 print("결과: \(GameState.lose)/ 사용자: \(userhoice), 컴퓨터: \(comGBB)") // 사용자 짐
 
 case .bawi:
 print("결과: \(GameState.win)/ 사용자: \(userhoice), 컴퓨터: \(comGBB)") // 사용자 이김
 
 default:
 print("결과: \(GameState.draw)/ 사용자: \(userhoice), 컴퓨터: \(comGBB)") // 비김
 }
 }
 } else { print("올바르지 않은 입력입니다. 0~2사이의 값을 입력하세요\n\(inputGBB)")}
 
 
 var anyStr = ""
 
 print(bigSmall_twoNum())
 
 func bigSmall_twoNum() -> (String) {
 print("\(strLine)\n\t\t대소 비교 프로그램\n\(strLine)")
 print("단, 0 < 입력숫자\n")
 print("1. num1 입력")
 guard let num1 = UInt32(readLine()!) else { return "" }
 
 print("2. num2 입력")
 guard let num2 = UInt32(readLine()!) else { return "" }
 
 if num1 > num2 {
 anyStr = "num1(\(num1))이 num2(\(num2))보다 크다."
 } else if num1 < num2 {
 anyStr = "num1(\(num1))이 num2(\(num2))보다 작다."
 } else {
 anyStr = "num1(\(num1))이 num2(\(num2))와 같다."
 }
 return anyStr
 }
 */

enum operSign: String {
    case plus = "+"
    case minus = "-"
    case mult = "*"
    case divd = "/"
    case other = ""
}

let errorStr = "유효하지 않은 값입니다."
var resulNum = gyeSangi()
if resulNum != 0 {
    print("연산결과: \(resulNum)\n")
}

func gyeSangi() -> (Int) {
    var calcNumResult: Int
    
    print("\(strLine)\n\t\t간단한 계산기 프로그램\n\(strLine)")
    print("1. num1 입력")
    guard let num1 = Int(readLine()!) else { print(errorStr); return 0 }
    print("2. num2 입력")
    guard let num2 = Int(readLine()!) else { print(errorStr); return 0 }
    
    print("3. 연산자 입력 (+/-/*/÷)")
    guard let operStr = readLine() else { return 0 }
    if operStr != "" {
        let opValue = operSign(rawValue: operStr)
        let tfValue = yuhyo(opValue?.rawValue ?? "", num1, num2)
        
        if tfValue == true {
            switch opValue {
            case .plus:
                calcNumResult = num1 + num2
            case .minus:
                calcNumResult = num1 - num2
            case .mult:
                calcNumResult = num1 * num2
            case .divd:
                calcNumResult = num1 / num2
            default:
                return 0
            }
            return calcNumResult
        } else {
            print("\n\(errorStr) \nnum1(\(num1))\nnum2(\(num2))\n연산자(\(operStr))\n")
            return 0
        }
    }
    
    
    func yuhyo(_ oper: String, _ num1: Int, _ num2: Int) -> Bool {
        if (oper == "/" || oper == "") && (num1 == 0 || num2 <= 0) {
            return false
        } else {
            return true
        }
    }
    return 0
}
