import UIKit

// MARK: - Closure / Swift 공식 문서 https://docs.swift.org/swift-book/LanguageGuide/Closures.html
// 여기부터 읽기 : Here’s a version of that captures by including it in the closure’s capture list, and then refers to implicitly:

/*: ## N회차 */
// MARK: - [] 1-1. multiplyClosure 인자 2개 받아서 곱한 값을 반환하는 클로저
// MARK: - [] 1-2. let result = multiplyClosure(4, 2)
// MARK: - [] 2-1. a, b를 받고 +인자로 operation(closure) -> 오퍼레이션 연산값 리턴 클코러
// MARK: - [] 3. addClosure
// MARK: - [] 4. division, 후행클로저
// MARK: - [] 5. voidClosure print("~~~")
// MARK: - [] 6. Capturing Values
    //count = 0, 상수 할당, count 1씩증가 > count?


/*: ## 2회차 */
// MARK: - [🟢] 1-1. multiplyClosure 인자 2개 받아서 곱한 값을 반환하는 클로저
let multiplyClosure2: (Int, Int) -> Int = { a, b in
    return a * b
}

// MARK: - [🟢] 1-2. let result = multiplyClosure(4, 2)
let result2 = multiplyClosure2(4, 2)

// MARK: - [🟢] 2-1. a, b를 받고 +인자로 operation(closure) -> 오퍼레이션 연산값 리턴 클로저
func operationTwoNum2(a: Int, b: Int, operation: (Int, Int)-> Int) -> Int {
    let result = operation(a, b)
    return result
}
operationTwoNum2(a: 4, b: 2, operation: multiplyClosure2)
// MARK: - [🟢] 3. addClosure
let addClosure2: (Int, Int) -> Int = { a, b in
    return a + b
}
operationTwoNum2(a: 4, b: 2, operation: addClosure2)

// MARK: - [🟢] 4. division, 후행클로저
operationTwoNum2(a: 4, b: 2) { a, b in
    return a/b
}
// MARK: - [🟢] 5. voidClosure print("~~~")
let voidClosure2: () -> Void = {
    print("this is void closure 2 ")
}

voidClosure2()
// MARK: - [🟠] 6. Capturing Values
    //count = 0, 상수 할당, count 1씩증가 > count?
var count2 = 0
let increment2 = {
    count2 += 1
}

increment2()
increment2()
increment2()
increment2()

count2

/*: ## 1회차 */
// MARK: - [🔴] 1-1. multiplyClosure 인자 2개 받아서 곱한 값을 반환하는 클로저
let multiplyClosure: (Int, Int) -> Int = { a, b in
    return a * b
}

// MARK: - [🔴] 1-2. let result = multiplyClosure(4, 2)
let result = multiplyClosure(4, 2)

// MARK: - [🔴] 2-1. a, b를 받고 +인자로 operation(closure) -> 오퍼레이션 연산값 리턴 클코러
func operateTwoNum(a: Int, b: Int, operation: (Int, Int) -> Int) -> Int {
    let result = operation(a, b)
    return result
}
operateTwoNum(a: 4, b: 2, operation: multiplyClosure)

// MARK: - [🔴] 3. addClosure
let addClosure: (Int, Int) -> Int = { a, b in
    return a + b
}
operateTwoNum(a: 4, b: 2, operation: addClosure)

// MARK: - [🔴] 4. division, 후행클로저
operateTwoNum(a: 4, b: 2) { a, b in
    return a / b
}

// MARK: - [] 5. voidClosure print("~~~")
let voidClosure: () -> Void = {
    print("this is void closure")
}

voidClosure()
// MARK: - [🔴] 6. Capturing Values
    //count = 0, 상수 할당, count 1씩증가 > count?
    
var count = 0
let increment = {
    count += 1
}

increment()
increment()
increment()
increment()

count
