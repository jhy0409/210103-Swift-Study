import UIKit

func printChapterTitle(str: String, isDone: Int) {
    let mark = ("🔴", "🟠", "🟢")
    let line = "----------------------------"
    switch isDone {
    case 0:
        print("\(mark.0) \(str) \(line)")
        
    case 1:
        print("\(mark.1) \(str) \(line)")
        
    case 2:
        print("\(mark.2) \(str) \(line)")
        
    default:
        break
    }
}

// MARK: - Todo

/*
    - [ㅇ] 한줄 주석
    - [ㅇ] 여러줄 주석
 
    - [] 조건문
    - [ㅇ] 튜플
    - [] Boolean
 
    - [] 삼항연산자
    - [] Scope
 */

// MARK: - [ㅇ] 한줄 주석
//cmd + / 주석

// MARK: - [ㅇ] 여러줄 주석
/*
 여
 러
 줄

 주
 석
 */

// MARK: - [ㅇ] 튜플
printChapterTitle(str: "Tuple", isDone: 2)
let coordinate = (4, 6)

let x = coordinate.0
let y = coordinate.1

var coordinateNamed = (x: 2, y: 3)

let x2 = coordinateNamed.x
let y2 = coordinateNamed.y

let (x3, y3) = coordinateNamed
x3
y3

coordinateNamed = (5,6)

/*:
 ## [공식문서 - 튜플](https://docs.swift.org/swift-book/ReferenceManual/Types.html)
 
 */
var someTuple = (top: 10, bottom: 12)
someTuple = (top: 4, bottom: 42)
someTuple = (9, 99)
// someTuple = (left: 5, right: 5) // 매칭 x


/*:
 ## Boolean
 */
printChapterTitle(str: "Boolean", isDone: 0)
let yes = true
let no = false

let fourThanFive = 4>5

// MARK: - [ㅇ] fourThanFive로 분기 처리하기
if fourThanFive {
    print("\n참 !")
} else {
    print("\n거짓 !")
}

let a = 5
let b = 10

if a > b {
    print("a: \(a), b: \(b) a가 크다")
} else {
    print("a: \(a), b: \(b) b가 크다")
}

let name1 = "Jin"
let name2 = "Jason"

// MARK: - [ㅇ] 문자열이 같은지
let isTwoNameSame = name1 == name2

if isTwoNameSame {
    print("이름이 같다.")
} else {
    print("이름이 다르다.")
}

let isjason = name2 == "Jason"
let isMale = true

let jasonAndMale = isjason && isMale
let jasonOrMale = isjason || isMale

let greetingMessage: String

//if isjason {
//    greetingMessage = "Hello Jason"
//} else {
//    greetingMessage = "Hello Somebody"
//}
//print("\nif-else로 분기 : \(greetingMessage)")

greetingMessage = isjason == true ? "Hello Jason" : "Hello Somebody"
print("\n삼항연산자 분기 : \(greetingMessage)")

/*:
 ## [공식문서 - 함수](https://docs.swift.org/swift-book/LanguageGuide/Functions.html#ID164)
 
 */

func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

func greetAgain(person: String) -> String {
    return "Hello, again, " + person + "!"
}

func greet(person: String, alreadyGreete: Bool) -> String {
    if alreadyGreete {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}

// MARK: - [ㅇ] 값을 리턴하는 함수, 사용 생략 가능
func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}
func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}
printAndCount(string: "hello, world")
// func minMax(array: [Int]) -> (min: Int, max: Int) {

// MARK: - [ㅇ] Int배열 받아서 최대, 최소값의 튜플 리턴
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var tempMin = array[0]
    var tempMax = array[0]
    
    for value in array[0 ..< array.count] {
        if value < tempMin {
            tempMin = value
        } else if value > tempMax {
            tempMax = value
        }
    }
    return (tempMin, tempMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")

func greeting(for person: String) -> String {
    "Hello, " + person + "!"
}
print(greeting(for: "Dave"))

// MARK: - [ㅇ] 함수 기본값 적용
func some(paramDefault: Int, withoutParam: Int = 20) {
    if withoutParam != 20 {
        print("\n두번째 값을 받았습니다\n전달값 1 : \(paramDefault) / 전달값 2 : \(withoutParam)")
    } else {
        print("\n두번째 값을 못 받았습니다\n전달값 1 : \(paramDefault) / 기본값 2 : \(withoutParam)")
    }
}

some(paramDefault: 3, withoutParam: 6)
some(paramDefault: 99)

// MARK: - [ㅇ] 가변인자
func 다더해(_ numbers: Double...) -> Double {
    var total: Double = 0
    for num in numbers {
        total += num
    }
    return total / Double(numbers.count)
}

다더해(1,2,3,4,5)
다더해(3, 8.25, 18.75)
다더해(9, 9, 9, 9, 9, 9, 9, 9)

// MARK: - [ㅇ] inout
func 두개바꾸기(_ a: inout Int, _ b: inout Int) {
    let tempA = a
    a = b
    b = tempA
}

var some = 3
var another = 107
두개바꾸기(&some, &another)

some
another

// MARK: - [ㅇ] 더하기, 곱하기
func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiply(_ a: Int, _ b: Int) -> Int{
    return a * b
}

var mathFunc: (Int, Int) -> Int = add
print(mathFunc(2, 3))
mathFunc = multiply
print(mathFunc(2, 3))

// MARK: - [ㅇ] 함수 인자로 함수 받기
func mathEditedFunc(_ mathFunc: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("\nResult -> \(mathFunc(a, b))")
}

mathEditedFunc(add, 3, 5)

// MARK: - [ㅇ] stepForward vs stepBackward
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}

var currentValue = -3

func chooseDirection(bool: Bool) -> (Int) -> Int {
    return bool == true ? stepBackward : stepForward
}

let moveToZero = chooseDirection(bool: currentValue > 0)

while currentValue != 0 {
    print("📕 \(currentValue)")
    currentValue = moveToZero(currentValue)
}


/*:
 ## [⛔️ 공식문서 - 속성](https://docs.swift.org/swift-book/LanguageGuide/Properties.html#ID608)
 
 */

