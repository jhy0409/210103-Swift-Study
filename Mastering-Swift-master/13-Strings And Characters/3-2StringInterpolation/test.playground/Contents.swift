import UIKit

struct Size {
    var width: Double
    var height: Double
}

let s = Size(width: 1.2, height: 3.4)

extension String.StringInterpolation {
    mutating func appendInterpolation(_ value: Size) {
        appendInterpolation("\(value.width) XXX \(value.height)")
    }
}

print("\(s)")
