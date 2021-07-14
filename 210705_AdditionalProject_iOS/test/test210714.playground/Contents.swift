import UIKit

let i = 3
let j = 3
var b: Bool {
    guard j != nil else {
        return false
    }
    
    return i == j
}

b
