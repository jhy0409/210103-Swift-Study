import UIKit

// ------------ 챕터 6-7 ------------
var someArray: Array<Int> = [1, 2, 3, 1]
var someSet: Set<Int> = [1, 2, 3, 1, 2]
// 중복값을 넣어도 3개만 나옴

someSet.isEmpty
someSet.count
someSet.contains(4)
someSet.contains(1)

someSet.insert(5)
someSet
someSet.remove(1)
someSet
// 컬렉션 3가지 타입, Array, Dictionary, Set


// ------------ 챕터 6-8 ------------
// 클로저 : 이름이 없는 메소드
//var multiplyClosure: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
//        return a * b
//}


//var multiplyClosure: (Int, Int) -> Int = { $0 * $1 }

var multiplyClosure: (Int, Int) -> Int = { a, b in
    return a * b
}
let result = multiplyClosure(4,2)

func operateTwoNum(a: Int, b: Int, operation: (Int, Int) -> Int) -> Int {
    let result = operation(a, b)
    return result
}

operateTwoNum(a: 4, b: 2, operation: multiplyClosure)

var addClousure: (Int, Int) -> Int = { a, b in
    return a + b
}

operateTwoNum(a: 4, b: 2, operation: addClousure)

operateTwoNum(a: 4, b: 2) { a, b in
    return a / b
}

// codeForEveryoneJoonwon+02@gmail.com

// ------------ 챕터 6-9 ------------
// Closure - Capturing

//let voidClosure: () -> () = {
let voidClosure: () -> Void = {
    print("iOS개발자, 클로저")
}
voidClosure()


var count = 0

let incrementer = {
    count += 1
    print(count)
}

incrementer()
incrementer()
incrementer()
incrementer()

count

// ------------ 챕터 6-10 ------------
// Clousure 보강
// 함수는 Closure의 한가지 타입

/*
 Closure 3가지 타입
 
 1. Global 함수
 2. Nested 함수
 3. Closure Expressions
 
 https://swift.org/documentation/
 
 함수처럼 기능을 수행하는 코드블록
 함수와 다르게 이름이 없다.
 
 * 차이점 -----
 1. 함수 : 이름있음 / func키워드 필요
 2. Closure : 이름 없음 / func 키워드 필요 없음
 
 * 공통점 -----
 1. 인자 받을 수 있음
 2. 값 리턴가능
 3. 변수로 할당 ㅇ
 4. First Class Type : 1~3 ex) like Integer Type
 
 * 실무에서 쓰이는 형태 -----
 1. Completion Block : 작업 끝난 후 수행해야할 때
 2. Higher Order Functions : 함수이면서 인자를 함수로 받을수 있는 것
 */

