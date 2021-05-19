import UIKit

// ---- Switch

let num = 8

switch num {
case 0:
    print("--> 0입니다.")
case 0..<10:
    print("--> 0~10 사이입니다.")
case 10:
    print("--> 10입니다.")
default:
    print("--> 나머지입니다.")
}

let pet = "bird"

switch pet {
case "dog", "cat", "bird":
    print("---> 집동물이네요?")
default:
    print("---> 잘 모르겠습니다.")
}

let num2 = 21
switch num {
case _ where num2 % 2 == 0 :
    print("---> 짝수")
default:
    print("---> 홀수")
}
