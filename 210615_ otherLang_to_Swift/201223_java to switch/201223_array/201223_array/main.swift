//
//  main.swift
//  201223_array
//
//  Created by inooph on 2021/06/17.
//

import Foundation

/*
 Arr1 배열과 반복문 사용 : 입력받은 수를 더하여 출력
 */

let strLine = "------------------------------"
    
var numbers = [Int](repeating: 0, count: 3)
let nthStr = ["첫", "두", "세"]
var temp = 0

//// --- 1-1. guard문 사용
//func inputNum3() -> [Int] {
//    print("\(nthStr[0])번째 수 입력")
//    guard let inputN1 = Int(readLine()!) else { return numbers }
//    print("\(nthStr[1])번째 수 입력")
//    guard let inputN2 = Int(readLine()!) else { return numbers }
//    print("\(nthStr[2])번째 수 입력")
//    guard let inputN3 = Int(readLine()!) else { return numbers }
//
//    numbers.append(inputN1)
//    numbers.append(inputN2)
//    numbers.append(inputN3)
//
//    return numbers
//}
//
//numbers = inputNum3()
//for i in numbers {
//    temp += i
//}
//
//print("\n\(strLine)\n1-1. Arr1 배열과 반복문 사용 : 입력받은 수를 더하여 출력")
//print("---> 세 수의 합은 \(temp)\n\(strLine)")
//
//
//
//// --- 1-2. guard문 미사용
//temp = 0
//numbers = [Int](repeating: 0, count: 3) // 초기화
//
//func inputNum3_2() -> () {
//
//    for i in 0...2 {
//        print("\(nthStr[i])번째 수 입력")
//        numbers[i] = Int(readLine()!)!
//
//        temp += numbers[i]
//    }
//    print(temp)
//}
//
//inputNum3_2()
//print("\n\(strLine)\n1-2. Arr1 배열과 반복문 사용 : 입력받은 수를 더하여 출력")
//print("---> 세 수의 합은 \(temp)")
//print("---> 배열의 크기는 \(numbers.count)\n\(strLine)")
//
//print("\n저장 배열 값 역순출력 (범위연산자.reversed()이용")
//let range = 0...2
//for i in range.reversed() {
//    print("\(i)번째 : \(numbers[i])")
//}


/*
 // 💡 Arr5 먼저 선언된 배열주소에서 거꾸로 읽어들이기
 int[] arr1 = new int[100];
 int arr2[] = new int[100]; //같은 형식임
 
 for (int i = 0; i < arr1.length; i++) {
     arr1[i] = i*2;
     System.out.println(arr1[i]); // 99*2
 }
 System.out.println("\n--------------------");
 for (int j = 0; j < arr2.length; j++) {
     arr2[j] = arr1[99-j];
     System.out.println(arr2[j]);
 }
 */

//var arr5_1 = [Int](repeating: 0, count: 100)
//var arr5_2 = [Int](repeating: 0, count: 100)
//
//let range_arr5 = 0...99
//for i in range_arr5 {
//    arr5_1[i] = i * 2
//    print("\(i+1)번째\t arr5_1[\(i)] = \(arr5_1[i])")
//}
//
//print("\nArr5 먼저 선언된 배열주소에서 거꾸로 읽어들이기 \n역순출력\n\(strLine)")
//for i in range_arr5 {
//    arr5_2[i] = arr5_1[99-i]
//    print("\(i+1)번째\t arr5_2[\(i)] = \(arr5_2[i])")
//}


/*
 💡 1. MunArr1 1차원 배열의 합과 평균
 public class MunArr1 {
     public static void main(String[] args) {
 //        1. 다음 1차원 배열의 합과 평균을 구하세요
 //        조건1) 배열 초기값
 //        int arr[] = {20, 34, 22, 14, 36, 23, 67, 25,  99, 88};
         double hap = 0;
         double ave = 0;
         int arr[] = { 20, 34, 22, 14, 36, 23, 67, 25, 99, 88 };
         for (int i = 0; i < arr.length; i++) {
             hap = hap + arr[i];
             ave = hap/arr.length;
         }
         System.out.printf("배열의 총 합은 %d이다.\n",(int)hap);
         System.out.printf("배열의 평균은 %.1f이다.",ave);
     }
 }
 */

//let munArr1 : [Int] = [20, 34, 22, 14, 36, 23, 67, 25,  99, 88]
//var hap: Int = 0
//var avg: Double = 0
//
//for i in munArr1 {
//    hap += i
//    avg = Double(hap/munArr1.count)
//}
//let avgR = String(format: "%.3f", avg)
//
//print("\n1. MunArr1 1차원 배열의 합과 평균")
//print("총합 : \(hap), 평균 : \(avgR)")


/*
 //    2. 1 ~ 100까지의 수를 1차원 배열에 저장.
 //    조건1) 저장된 배열에서 5의 배수만 출력하세요.
 //    조건2) 배열의 위치가 90번째 일때 출력을 중지함.
         
     int[] arr = new int[100];
     for (int i = 0; i < arr.length; i++) {
         arr[i]=(i+1);
         
         if (arr[i]%5==0) {
             System.out.println(arr[i]);
         }
         
         if (arr[i]==89) {
             System.out.println("배열주소 90번째에서 프로그램 종료");
             break;
         }
     }
 */
