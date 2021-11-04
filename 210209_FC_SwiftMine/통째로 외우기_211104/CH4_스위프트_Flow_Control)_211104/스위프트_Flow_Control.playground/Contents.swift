import UIKit

var greeting = "Hello, playground"


func printChapterTitle(str: String, isDone: Int) {
    let done = ("🔴", "🟠", "🟢")
    let resultString: String
    let line = "\t----------------------------"
    switch isDone {
    case 0:
        resultString = "\n\(done.0) \(str+line)"
        print(resultString)
        
    case 1:
        resultString = "\n\(done.1) \(str+line)"
        print(resultString)
        
    case 2:
        resultString = "\n\(done.2) \(str+line)"
        print(resultString)
    default:
        break
    }
}

/*: ## While */
// MARK: - [ㅇ] 0~9까지 출력
printChapterTitle(str: "While", isDone: 2)

var i = 0
while i < 10 {
    print(i)
    i += 1
}
print()


// MARK: - [ㅇ] ~9까지 출력, 5에서 중단
i = 0
while i < 10 {
    print(i)
    
    if i == 5 { break }
    i += 1
}

/*: ## Repeat While */
printChapterTitle(str: "Repeat While", isDone: 2)
i = 10

repeat {
    print(i)
    i += 1
} while i < 10

/*: ## For Loop*/

printChapterTitle(str: "For Loop", isDone: 2)
let closedRange = 0...10 // 0~10
let halfClosedRange = 0..<10 // 0~9

// MARK: - [ㅇ] 0~10까지의 합
var sum = 0
for i in closedRange {
    print(i)
    sum += i
}

print("total sum : \(sum)")

var sinValue: CGFloat = 0
for i in closedRange {
    sinValue = sin(CGFloat.pi / 4 * CGFloat(i))
}

let name = "Jason"

for i in closedRange {
    print("--> i - \(i) \tname: \(name)")
}
print()

// MARK: - [ㅇ] 닫힌 범위 0~10에서 짝수만 출력
for i in closedRange {
    if i % 2 == 0 {
        print(" i : \(i)")
    }
}
print()

// MARK: - [ㅇ] 닫힌 범위 0~10에서 짝수만 출력 - where절 사용
for i in closedRange where i % 2 == 0 {
    print("2nd i : \(i)")
}
print()

// MARK: - [ㅇ] 3빼고 출력
for i in closedRange {
    if i == 3 {
        continue
    }
    print("3rd - i : \(i)")
}

// MARK: - [ㅇ] 구구단 출력
for i in closedRange where i > 1 && i < 10{
    for j in closedRange where j != 0 && j < 10 {
        print("구구단 : \(i) * \(j) = \(i * j)")
    }
    print()
}

/*: ## Switch */

printChapterTitle(str: "Switch", isDone: 2)
