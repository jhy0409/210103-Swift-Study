import UIKit

/*: ## N 번째*/
// MARK: - [] 1-1. 선언 - 단축문법 : evenNumbers
// MARK: - [] 1-2. 선언 - 정식문법 : evenNumbers2

// MARK: - [] 2-1. 값 추가 10
// MARK: - [] 2-2. 값 추가 +=
// MARK: - [] 2-3. [18, 20]

// MARK: - [] 3-1. isEmpty?
// MARK: - [] 3-2. .count, print(~.first)
// MARK: - [] 3-3. if-let, print(binding const value)

// MARK: - [] 4-1. min(), max()
// MARK: - [] 4-2. 비우기
// MARK: - [] 4-3. let firstItem = ???.??? 로 할당
// MARK: - [] 5-1. subscript 0, 1, 9, 19
// MARK: - [] 6-1. let firstThree = using closed range
// MARK: - [] 6-2. 3, 4 추가
// MARK: - [] 6-3. insert 첫번 째, 0

// MARK: - [] 7-1. 값 삭제 첫번 째, 0
// MARK: - [] 8-1. 값 교체, 첫번 째, -2로
// MARK: - [] 8-2. 값 교체 subScript 1~3번째 -> -2, 0, 2
// MARK: - [] 8-3. 값 교체 swap...

// MARK: - [] 9-1. for-in, print(value)
// MARK: - [] 9-1. print(i, j)?
// MARK: - [] 9-2. let firstThreeRemoved = array.???(n)
// MARK: - [] 9-3. lastRemoved = array.???()
// MARK: - [] 9-4. firstThree, lastThree





/*: ## 1번째*/
// MARK: - [] 1-1. 선언 - 단축문법 : evenNumbers
var evenNumbers: [Int] = [2, 4, 6, 8]
// MARK: - [] 1-2. 선언 - 정식문법 : evenNumbers2
let evenNumbers2: Array<Int> = [2, 4, 6, 8]

// MARK: - [] 2-1. 값 추가 10
evenNumbers.append(10)
// MARK: - [] 2-2. 값 추가 +=
evenNumbers += [12, 14, 16]
// MARK: - [] 2-3. [18, 20]
evenNumbers.append(contentsOf: [18, 20])

// MARK: - [] 3-1. isEmpty?
let isEmpty = evenNumbers.isEmpty
// MARK: - [] 3-2. .count, print(~.first)
evenNumbers.count
print(evenNumbers.first)
// MARK: - [] 3-3. if-let, print(binding const value)
if let firstElement = evenNumbers.first {
    print(firstElement)
}
// MARK: - [] 4-1. min(), max()
evenNumbers.min()
evenNumbers.max()

// MARK: - [] 4-2. 비우기
//evenNumbers = []
// MARK: - [] 4-3. let firstItem = ???.??? 로 할당
//let firstItem = evenNumbers.first

// MARK: - [] 5-1. subscript 0, 1, 9, 19
var firstItem = evenNumbers[0]
var secondItem = evenNumbers[1]
var tenthItem = evenNumbers[9]
//var twentithItem = evenNumbers[19] // 컴파일 에러

// MARK: - [] 6-1. let firstThree = using closed range
let firstThree = evenNumbers[0...2]
evenNumbers

// MARK: - [] 6-2. 3, 4 추가
evenNumbers.contains(3)
evenNumbers.contains(4)

// MARK: - [] 6-3. insert 첫번 째, 0
evenNumbers.insert(0, at: 0)
evenNumbers


// MARK: - [] 7-1. 값 삭제 첫번 째, 0
//evenNumbers.removeAll()
evenNumbers.remove(at: 0)
evenNumbers

// MARK: - [] 8-1. 값 교체, 첫번 째, -2로
evenNumbers[0] = -2
evenNumbers

// MARK: - [] 8-2. 값 교체 subScript 1~3번째 -> -2, 0, 2
evenNumbers[0...2] = [-2, 0, 2]
evenNumbers


// MARK: - [] 8-3. 값 교체 swap...
evenNumbers.swapAt(0, 9)
evenNumbers.count


print()

// MARK: - [] 9-1. for-in, print(value)
var index = 0
for i in evenNumbers {
    print("\(index) - \(i)")
    index+=1
}

// MARK: - [] 9-1. print(i, j)?
for (i, j) in evenNumbers.enumerated() {
    print("index: \(i), value: \(j)")
}
evenNumbers
// MARK: - [] 9-2. let firstThreeRemoved = array.???(n)
let firstThreeRemoved = evenNumbers.dropFirst(3)
firstThreeRemoved

// MARK: - [] 9-3. lastRemoved = array.???()
let laseRemoved = evenNumbers.dropLast()
laseRemoved

// MARK: - [] 9-4. firstThree, lastThree
let firstThree2 = evenNumbers.prefix(3)
firstThree2

let lastThree = evenNumbers.suffix(3)
lastThree

evenNumbers
