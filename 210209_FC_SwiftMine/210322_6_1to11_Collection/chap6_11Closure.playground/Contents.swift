import UIKit

// Closure Expression Syntax (표현식, 문법)
/*
 { (parameters) -> return in
 statements
 }
 */

// ------------ 챕터 6-11 ------------

/*
 {(param) -> return type in
 statement
 ....
 }
 */

// Example 1: Cho Simple Closure

let choSimpleClosure1 = { }
choSimpleClosure1()


// Example 2: 코드블록을 구현한 Closure

let choSimpleClosure2 = {
    print("Hello, 클로저")
}
choSimpleClosure2()


// Example 3: 인풋 파라미터를 받는 Closure
let choSimpleClosure3: (String) -> Void = { name in
    print("Hello, 클로저, 이름은 \(name).")
}
choSimpleClosure3("3. 세번째 클로저")


// Example 4: 값을 리턴하는 Closure
let choSimpleClosure4: (String) -> String = { name in
    let message = "iOS개발.., \(name)는 자유에요"
    return message
}

let result = choSimpleClosure4("4. 네번째 클로저")
print(result+"\n")


// Example 5: Closure를 파라미터로 받는 함수 구현
func someSimpleFuction(choSimpleClosure: () -> Void) {
    print("함수에서 호출 되었음.")
    choSimpleClosure()
}

someSimpleFuction(choSimpleClosure: {
    print("5th Closure")
    
})



func someSimpleFuction2(message: String, choSimpleClosure: () -> Void) {
    print("함수에서 호출 되었음. 메시지는 \(message)")
    choSimpleClosure()
}

someSimpleFuction2(message: "어쩌고 저쩌고 메시지", choSimpleClosure: {
    print("5th Closure\n")
    
})


// Example 6: Trailing Closure

func someSimpleFuction3(message: String, choSimpleClosure: () -> Void) {
    print("함수에서 호출 되었음. 메시지는 \(message)")
    choSimpleClosure()
}

someSimpleFuction3(message: "어쩌고 저쩌고 메시지", choSimpleClosure: {
    print("5th Closure")
})
someSimpleFuction3(message: "어쩌고 저쩌고 메시지") {
    print("5th Closure---------")
}
