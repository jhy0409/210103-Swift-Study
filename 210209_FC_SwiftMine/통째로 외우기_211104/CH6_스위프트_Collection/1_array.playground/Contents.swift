import UIKit

var evenNumbers: [Int] = [2, 4, 6, 8]
let evenNumbers2: Array<Int> = [2, 4, 6, 8]

evenNumbers.append(10)
evenNumbers += [12, 14, 16]
evenNumbers.append(contentsOf: [18, 20])
let isEmpty = evenNumbers.isEmpty

evenNumbers.count
print(evenNumbers.first)

//evenNumbers = []
//let firstItem = evenNumbers.first

if let firstElement = evenNumbers.first {
    print(firstElement)
}

evenNumbers.min()
evenNumbers.max()

var firstItem = evenNumbers[0]
var secondItem = evenNumbers[1]
var tenthItem = evenNumbers[9]
//var twentithItem = evenNumbers[19] // 컴파일 에러

let firstThree = evenNumbers[0...2]
evenNumbers

evenNumbers.contains(3)
evenNumbers.contains(4)

evenNumbers.insert(0, at: 0)
evenNumbers

//evenNumbers.removeAll()
evenNumbers.remove(at: 0)
evenNumbers

evenNumbers[0] = -2
evenNumbers

evenNumbers[0...2] = [-2, 0, 2]
evenNumbers


evenNumbers.swapAt(0, 9)
evenNumbers.count


print()
var index = 0
for i in evenNumbers {
    print("\(index) - \(i)")
    index+=1
}

for (i, j) in evenNumbers.enumerated() {
    print("index: \(i), value: \(j)")
}
evenNumbers
let firstThreeRemoved = evenNumbers.dropFirst(3)
firstThreeRemoved

let laseRemoved = evenNumbers.dropLast()
laseRemoved

let firstThree2 = evenNumbers.prefix(3)
firstThree2

let lastThree = evenNumbers.suffix(3)
lastThree

evenNumbers
