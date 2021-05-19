import UIKit

// --- 3-3. 주석, Comment
// var str = "Hello, playground" // comment, 주석처리
// 단축키 cmd + /, 다중주석 /* */

//let value = arc4random_uniform(100)
//print("---> \(value)")


// --- 3-4. Tuple

let coordinates = (4,6)

let x = coordinates.0
let y = coordinates.1

let coordinatesNamed = (x: 2, y:3)

let x2 = coordinatesNamed.x
let y2 = coordinatesNamed.y


// 관계있는 데이터 표현할 때 사용
let (x3, y3) = coordinatesNamed
x3
y3


// --- 3-5. Boolean

let yes = true
let no = false

let isFourGreaterThanFive = 4 > 5

if isFourGreaterThanFive {
    print("---> 참")
} else {
    print("---> 거짓")
}


//if 조건.. {
//    // 조건 참인경우 수행코드
//} else {
//    // 그렇지 않은 경우의 코드
//}

let a = 5
let b = 10

if a > b {
    print("---> a가 크다")
} else {
    print("---> b가 크다")
}


let name1 = "Min"
let name2 = "Ason"

let isTwoNameSame = name1 == name2

if isTwoNameSame {
    print("---> 같다")
} else {
    print("---> 다름")
}

// --- 3-6 논리 연산자
let isJason = name2 == "Ason"
let isMale = true

let isJasonAndMale = isJason && isMale
let JasonOrMale = isJason || isMale



let greetM: String
if isJason {
    greetM = "Hello Ason"
} else {
    greetM = "Hello Other"
}

print("Msg: \(greetM)")


let greetM2: String = isJason ? "Hello Ason" : "Hello Other"
print("Msg: \(greetM)")


// --- 3-7 Scope

var hours = 50
let payPerHour = 10000
var salary = 0

if hours > 40 {
    let extraHours = hours - 40
    salary += extraHours * payPerHour * 2
    hours -= extraHours
}

salary += hours * payPerHour
