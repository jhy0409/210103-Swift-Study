//
//  main.swift
//  201216_switch
//
//  Created by inooph on 2021/06/16.
//

import Foundation

/*
 [ java code ] --> Loop1.java
 for (int j=5; j>0; j--) {
 System.out.println("반복 횟수: "+ j);
 }
 */

//print("1. Loop1 --------------- ")
//var intN = 6
//for index in 1...5 {
//    print("반복횟수 : \(intN - index)")
//}


/*
 [ java code ] --> Loop2.java
 // - 1부터 10까지의 합
 public static void main(String[] args) {
 int hap = 0;
 for (int i=0; i<10; i++) {
 hap = hap + (i+1);
 // hap = hap + (i+1); == hap += (i+1);
 // += 연산자 모두 적용가능
 }
 System.out.println("1~10까지 합: "+hap);
 }
 */

var hap = 0
//for i in 1...10 {
//    hap += i
//}
//print("\n2. Loop2 --------------- ")
//print("1부터 10까지의 합 : \(hap)")

/*
 [ java code ] --> Loop3.java
 // - 1부터 10까지 홀수의 합
 */

hap = 0
//for i in 1...10 {
//    if i % 2 != 0 {
//        hap += i
//    }
//}
//print("\n3. Loop3 --------------- ")
//print("1부터 10까지 홀수의 합 : \(hap)")


/*
 [ java code ] --> Loop4.java
 // - 0부터 N까지의 합
 */

/*
 hap = 0
 print("\n4. Loop4 --------------- ")
 print("0부터 N까지의 합을 구합니다. \n N을 입력하시오")
 func inputAndSum () -> () {
 guard let inputNumber = Int(readLine()!) else { return }
 var i = 0
 while i <= inputNumber {
 hap += i
 i += 1
 if i > inputNumber {
 continue
 }
 print("---> hap : \(hap), i : \(i)")
 }
 print("\n0부터 \(inputNumber)까지의 합 : \(hap)")
 return
 }
 inputAndSum()
 */

/*
 [ java code ] --> Loop5.java
 // - 입력 숫자의 구구단 출력
 */

//func doMultiple() -> () {
//    print("\n5. Loop5 --------------- ")
//    print("입력 숫자의 구구단 출력합니다. ")
//    guard let inputNumber = Int(readLine()!) else { return }
//    for gopagi in 1...9 {
//        print("\(inputNumber) X \(gopagi) = \(inputNumber * gopagi)")
//    }
//}
//doMultiple()


/*
 [ java code ] --> Exam2.java
 // - 100까지 5의 배수 출력
 */

for num in 1...100 {
    if num % 5 == 0 {
        print("for문 사용 \(num)")
    }
}
print()
var exam2Int = 0
while exam2Int <= 100 {
    if exam2Int % 5 == 0 && exam2Int != 0 {
        print("while문 사용 \(exam2Int)")
    }
    exam2Int += 1
}

print()
exam2Int = 0
repeat {
    if exam2Int % 5 == 0 && exam2Int != 0 {
        print("repeat-while문 사용 \(exam2Int)")
    }
    exam2Int += 1
} while exam2Int <= 100


/*
 [ java code ] --> Exam4.java
 // - 입력받는수의 합을 구하는 프로그램
 */

hap = 0
func twoNumSum() -> () {
    print("숫자 1 입력")
    guard let inputNum1 = Int(readLine()!) else { return }
    print("숫자 2 입력")
    guard let inputNum2 = Int(readLine()!) else { return }
    
    if inputNum2 - inputNum1 <= 0 || inputNum2 < 0 || inputNum1 < 0 {
        print("\n유효하지 않은 값입니다. 다음의 경우를 확인하십시오.")
        print("- 두 값의 차이가 0보다 작거나 같음")
        print("- 각 값이 0보다 작은 경우\n")
        return
    }
    
    for i in inputNum1...inputNum2 {
        hap += i
    }
    print("\n4. Exam4 --------------- ")
    print("\(inputNum1)부터 \(inputNum2)까지의 합은 : \(hap)\n")
}
twoNumSum()
