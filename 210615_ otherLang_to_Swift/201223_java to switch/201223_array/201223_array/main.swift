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

// --- 1-1. guard문 사용
func inputNum3() -> [Int] {
    print("\(nthStr[0])번째 수 입력")
    guard let inputN1 = Int(readLine()!) else { return numbers }
    print("\(nthStr[1])번째 수 입력")
    guard let inputN2 = Int(readLine()!) else { return numbers }
    print("\(nthStr[2])번째 수 입력")
    guard let inputN3 = Int(readLine()!) else { return numbers }
    
    numbers.append(inputN1)
    numbers.append(inputN2)
    numbers.append(inputN3)
    
    return numbers
}

//numbers = inputNum3()
//for i in numbers {
//    temp += i
//}
//
//print("\n\(strLine)\n1-1. Arr1 배열과 반복문 사용 : 입력받은 수를 더하여 출력")
//print("---> 세 수의 합은 \(temp)\n\(strLine)")



// --- 1-2. guard문 미사용
temp = 0
numbers = [Int](repeating: 0, count: 3) // 초기화

func inputNum3_2() -> () {
    
    for i in 0...2 {
        print("\(nthStr[i])번째 수 입력")
        numbers[i] = Int(readLine()!)!
        
        temp += numbers[i]
    }
    print(temp)
}

inputNum3_2()
print("\n\(strLine)\n1-2. Arr1 배열과 반복문 사용 : 입력받은 수를 더하여 출력")
print("---> 세 수의 합은 \(temp)")
print("---> 배열의 크기는 \(numbers.count)\n\(strLine)")

print("\n저장 배열 값 역순출력 (범위연산자.reversed()이용")
let range = 0...2
for i in range.reversed() {
    print("\(i)번째 : \(numbers[i])")
}



