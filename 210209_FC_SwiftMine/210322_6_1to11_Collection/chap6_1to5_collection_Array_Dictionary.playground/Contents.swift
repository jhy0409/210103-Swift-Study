import UIKit

// ------------ 챕터 6-3 ------------

// ------ 선언방법 2가지
//let evenNumbers: [Int] = [2, 4, 6, 8]
//let evenNumbers2: Array<Int> = [2, 4, 6, 8]

//var evenNumbers: [Int] = []
var evenNumbers: [Int] = [2, 4, 6, 8]
evenNumbers.append(10)
evenNumbers += [12, 14, 16]
evenNumbers.append(contentsOf: [18, 20])

//evenNumbers = []
let isEmpty = evenNumbers.isEmpty // 많이 씀 ★
evenNumbers.count // 많이 씀 ★

// 타입 : 있을수도 ㅇ, 없을수도 있기때문에 옵셔널.
print(evenNumbers.first)

//evenNumbers = []
let firstItem = evenNumbers.first
let lastItem = evenNumbers.last

if let firstElement = evenNumbers.first {
    print("--> first item is: \(firstElement)")
} else {
    print("nil")
}

// ------ 최대 최소값 구하기
evenNumbers.min()
evenNumbers.max()

// ------ 범위 벗어날 때 앱에서 Crash 발생.
//var twentithItem = evenNumbers[19]
var firstItem2 = evenNumbers[0]  // 인덱스넣어 아이템 접근, 많이 씀 ★
var secondItem = evenNumbers[1]
var tenthItem = evenNumbers[9]

// ------ 되는지 궁금해서 한 번 해봄.
let indexNum = evenNumbers.count - 1
var lastItem2 = evenNumbers[indexNum]


// ------------ 챕터 6-4 ------------
// range 사용 가능
let firstThree = evenNumbers[0...2]

// 배열 내 값 포함여부
evenNumbers.contains(3)
evenNumbers.contains(4)

// 값 추가, 해당위치
evenNumbers.insert(0, at: 0)
evenNumbers


// 빈 배열 만들기
//evenNumbers.removeAll()
//evenNumbers = []
evenNumbers.remove(at: 0)
evenNumbers

// 해당 배열위치 값 내용 수정
evenNumbers[0] = -2
evenNumbers

// 범위 내 값 변경
evenNumbers[0...2] = [-2, 0, 2]
evenNumbers


// n1, n2번째 자리 바꾸기
//evenNumbers.swapAt(0, indexNum)

// for loop, ------------------------- 많이 씀 ★
print()
for num in evenNumbers {
    print(num)
}


// 인덱스 가져와서 출력
print()
for (index, num) in evenNumbers.enumerated() {
    print("idx: \(index), value: \(num)")
}

//저장된 배열 내용 그대로 두고 해당내용만 반환
evenNumbers

let firstThreeRemoved = evenNumbers.dropFirst(3)
firstThreeRemoved

let lastRemoved = evenNumbers.dropLast()
lastRemoved

// 처음 3개
let firstThree2 = evenNumbers.prefix(3)
firstThree2

// 마지막 3개
let lastThree = evenNumbers.suffix(3)
lastThree

evenNumbers

// ------------ 챕터 6-5 ------------
// Dictionary, 값 저장하는 통 개념
// 키, 값으로 이뤄짐
// 키 - 개별값, 각각 구분이 되어야함 중복X

// Dictionary, Array 차이점
// Array -> 순서기반
// Dictionary -> 키, 의미 있는 값으로 접근
