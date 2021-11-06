import UIKit

func printChapterTitle(str: String, isDone: Int) {
    let mark = ("🔴", "🟠", "🟢")
    let line = "\t----------------------------"
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

/*: ## N회차*/
// MARK: - [] 한줄 주석
// MARK: - [] 여러줄 주석
// MARK: - [] 튜플
    // 1. let coordinate =
    // 2. let x = coo~., let y = coo~.
    // 3. let (, ) = coo..., x3, y3?
    // 4. coor... = 5, 6
// MARK: - [] 조건문
    // 1. let yes, no
    // 2. 4가 5보다 크다 할당
    // 3. 2번으로 if-else

    // 4. a = 5, b = 10 - a > b if, else ?
    // 5. 문자열 비교 - name1 = "Jine, name2 = jason
    // 6. name2가 제이슨인지 확인, 남자임
        // jasonAndMale, jsonOrMale
    // 7. 제이슨 일 때, 아닐 때 인사메시지
        // 1. if-else
        // 2. 삼항연산자 사용

    // 8. 40시간 이상 근무일 때 급여계산 hour = 50, salary, paPerHour = 10000
// MARK: - [] Boolean
                    
// MARK: - [] 삼항연산자
// MARK: - [] Scope

// MARK: - [] 공식문서 - 함수
    // 1. 문자열 받아서 인사하는 함수(return String)
    // 2. "Hello, again, !
    // 3. 이름 받아서 선인사 기준(bool)로 if-else 분기
    // 4. 문자열 출력과 길이(Int) 리턴 함수,
    // 5. Int배열 받아서 최대, 최소값의 튜플 리턴
    // 6. 함수 기본값 적용

// MARK: - [] 가변인자 - 숫자 받아서 평균 리턴
// MARK: - [] 변수 값 바꾸기 inout
// MARK: - [] var mathFunc, add, multiply 대입
// MARK: - [] mathEditedFunc - closure, int parameter 2ea

// MARK: - [] stepFowward, stepBackward, choosedirection, while
/*: ## 1회차*/
// MARK: - [🟢] 한줄 주석
    //한줄 주석
printChapterTitle(str: "1회 - 한줄 주석", isDone: 2)
// MARK: - [🟢] 여러줄 주석
    /*
     여
     러
     줄
    */
printChapterTitle(str: "1회 - 여러줄 주석", isDone: 2)
// MARK: - [🟢] 튜플
    // 1. let coordinate =
var coordinate1st = (4, 6)
    // 2. let x = coo~., let y = coo~.
let x1 = coordinate1st.0
let y1 = coordinate1st.1
    // 3. let (, ) = coo..., x3, y3?
let (x13, y13) = coordinate1st
x13
y13
    // 4. coor... = 5, 6
coordinate1st = (5, 6)
printChapterTitle(str: "1회 - 튜플", isDone: 2)

// MARK: - [🟢] 조건문
printChapterTitle(str: "1회 - Boolean", isDone: 2)
    // 1. let yes, no
let yes1 = true
let no1 = true
    // 2. 4가 5보다 크다 할당
let fourThanFive1 = 4 > 5
    // 3. 2번으로 if-else
if fourThanFive1 {
    print("1 - 참")
} else {
    print("1 - 거짓")
}

    // 4. a = 5, b = 10 - a > b if, else ?
let a1 = 5, b1 = 10
if a > b {
    print("1 - a가 b보다 크다.")
} else {
    print("1 - b가 a보다 크다.")
}
    // 5. 문자열 비교 - name1 = "Jine, name2 = jason
let name1_1 = "Jin", name1_2 = "Jason", isMale1_3 = true
let isTwoNameSame1 = name1_1 == name1_2
if isTwoNameSame1 {
    print("1 - 이름이 같다.")
} else {
    print("1 - 이름이 다르다.")
}
    // 6. name2가 제이슨인지 확인, 남자임
        // jasonAndMale, jsonOrMale
let isJaosn1 = name1_2 == "Jason"
let jasonAndMale1 = isJaosn1 && isMale1_3
let jasonOrMale1 = isJaosn1 || isMale1_3
    // 7. 제이슨 일 때, 아닐 때 인사메시지
        // 1. if-else
let greetingMessage1: String
//if isJaosn1 {
//    greetingMessage1 = "Hello, Jason"
//} else {
//    greetingMessage1 = "Hello, somebody"
//}
        // 2. 삼항연산자 사용
greetingMessage1 = isJaosn1 == true ? "Hello!! Jason" : "Hello!!!"

    // 8. 40시간 이상 근무일 때 급여계산 hour = 50, salary, payPerHour = 10000
var hour1 = 50
var salary1 = 0
let payPerHour1 = 10000

if hour1 > 40 {
    let extraHour = hour1 - 40
    salary1 += extraHour * payPerHour1 * 2
    hour1 -= extraHour
    salary1
}

salary1 += hour1 * payPerHour1

// MARK: - [🟢] Boolean
                    
// MARK: - [🟢] 삼항연산자
// MARK: - [?] Scope

// MARK: - [🟠] 공식문서 - 함수
    // 1. 문자열 받아서 인사하는 함수(return String)
func greet1(str: String) -> String{
    "Hello, \(str)"
}
print(greet1(str: "안ㄴ..."))

    // 2. "Hello, again, !
func greetAgain1(str: String, alreadyGreet: Bool) -> String {
    "Hello, Again \(str)"
}
    // 3. 이름 받아서 선인사 기준(bool)로 if-else 분기
func greet1(person: String, alreadyGreet: Bool) -> String {
    if alreadyGreet { return greetAgain1(str: person, alreadyGreet: alreadyGreet)}
    else { return greet1(str: person) }
}
    // 4. 문자열 출력과 길이(Int) 리턴 함수,
func printAndCount1(str: String) -> Int {
    print(str)
    return str.count
}

printAndCount1(str: "안녕하세요")
    // 5. Int배열 받아서 최대, 최소값의 튜플 리턴
func minMax1(array: [Int]) -> (min: Int, max: Int) {
    var min = array[0]
    var max = array[1]
    
    for i in array {
        if i < min {
            min = i
        }
        if i > max {
            max = i
        }
    }
    return (min, max)
}

let bounds1 = minMax1(array: [8, -6, 2, 109, 3, 71])
bounds1.min
bounds1.max
    // 6. 함수 기본값 적용
func some1(paramDefault: Int, withoutParam: Int = 20) {
    if withoutParam != 20{
        print("첫번째 : \(paramDefault),\t받은값: \(withoutParam)")
    } else {
        print("첫번째 : \(paramDefault),\t기본값: \(withoutParam)")
    }
}
some1(paramDefault: 3, withoutParam: 6)
some1(paramDefault: 99)

// MARK: - [🟢] 가변인자 - 숫자 받아서 평균 리턴
printChapterTitle(str: "1 - 가변인자 - 숫자 받아서 평균 리턴", isDone: 2)

func sumAll1(_ numbers: Double...) -> Double {
    var result: Double = 0
    for i in numbers {
        result += i
    }
    
    return result / Double(numbers.count)
}

sumAll1(1, 2, 3, 4, 5)
sumAll1(3, 8.25, 18.75)

// MARK: - [🟢] 변수 값 바꾸기 inout
printChapterTitle(str: "1 - 변수 값 바꾸기 inout", isDone: 2)
func changeTwoNum(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}

var some1 = 3
var another1 = 107
changeTwoNum(&some1, &another1)

some1
another1

// MARK: - [🟢] var mathFunc, add, multiply 대입
func add1(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiply1(_ a: Int, _ b: Int) -> Int {
    return a * b
}
var mathFunc1: (Int, Int) -> Int = add
print(mathFunc1(2,3))
mathFunc1 = multiply1
print(mathFunc1(2,3))

// MARK: - [🟢] mathEditedFunc - closure, int parameter 2ea
func mathEditedFunc1(_ closure: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("\n 1 - Result -> \(closure(a, b))")
}
mathEditedFunc1(add1, 3, 5)

// MARK: - [🟠] stepFowward, stepBackward, choosedirection, while

var current1 = -3
func stepForward1(_ input: Int) -> Int {
    return input + 1
}

func stepBackward1(_ input: Int) -> Int {
    return input - 1
}

func chooseDirection1(bool: Bool) -> (Int) -> Int {
    return bool == true ? stepBackward1 : stepForward1
}
print("moveToZero1 🔪")
let moveToZero1 = chooseDirection1(bool: current1 > 0)

while current1 != 0 {
    print(current1)
    current1 = moveToZero1(current1)
}

/*: ## 0회차 반복*/
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

var hours = 50
let payPerHour = 10000
var salary = 0

if hours > 40 {
    let extraHours = hours - 40
    salary += extraHours * payPerHour * 2
    hours -= extraHours
}

salary += hours * payPerHour

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
