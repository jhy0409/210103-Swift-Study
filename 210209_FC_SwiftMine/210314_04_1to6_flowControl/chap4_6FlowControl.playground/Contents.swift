import UIKit

let coordinate = (x: 10, y: 10)

switch coordinate {
case (0, 0):
    print("---> 원점입니다.")
    
case (let x, 0):
    print("---> x축 입니다. x : \(x)")
    
case (0, _):
    print("---> y축 입니다.")
    
case (let x, let y) where x == y:
    print("---> x와 y가 같음 x, y = \(x), \(y)")
    
case (let x, let y):
    print("---> 좌표 어딘가 x, y = \(x), \(y)")
}
