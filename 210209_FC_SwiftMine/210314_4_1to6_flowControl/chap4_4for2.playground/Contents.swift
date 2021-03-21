import UIKit

let closedRange = 0...10
let halfClosedRange = 0..<10 // 0~9까지, 10포함 X

for i in closedRange {
    if i % 2 == 0 {
        print("---> 짝수 : \(i)")
    }
}

print("\n where")
for i in closedRange where i % 2 == 0 {
    print("---> 짝수 : \(i)")
}

print("\n 3빼고 출력")
for i in closedRange {
    if i == 3 {
        continue
    }
    print("---> \(i)")
}

// --- 구구단
for i in closedRange {
    for j in closedRange {
        if i >= 2 && i <= 9 && j > 0 && j < 10{
            print("gugu -> \(i) * \(j) = \(i * j)")
        }
    }
    print("")
}
