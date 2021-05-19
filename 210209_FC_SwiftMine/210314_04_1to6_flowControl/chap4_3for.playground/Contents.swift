import UIKit
import Foundation

// ----- For Loop

let closedRange = 0...10
let halfClosedRange = 0..<10 // 0~9까지, 10포함 X

var sum = 0

print("----> closedRange")
for i in closedRange {
    print("----> \(i)")
    sum += i
}
print("----> total sum: \(sum)\n")

sum = 0
print("----> halfClosedRange")
for i in halfClosedRange {
    print("----> \(i)")
    sum += i
}
print("----> total sum: \(sum)")


var sinValue: CGFloat = 0
for i in closedRange {
    sinValue = sin(CGFloat.pi/4 * CGFloat(i))
}

let name = "Jason"
for _ in closedRange {
    print("----> name: \(name)")
}
