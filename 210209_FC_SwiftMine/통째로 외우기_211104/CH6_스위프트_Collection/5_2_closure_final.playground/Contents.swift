import UIKit

func printChapterTitle(title: String, isDone: Int) {
    let doneStates = (not: "🔴", ing: "🟠", done: "🟢")
    let line = "\t-------------------------"
    
    var resultString: String = ""
    switch isDone {
    case 0:
        resultString = "\(doneStates.not + " " + title) \(line)"
    case 1:
        resultString = "\(doneStates.ing + " " + title) \(line)"
    case 2:
        resultString = "\(doneStates.done + " " + title) \(line)"
    default:
        break
    }
    print(resultString)
}
/*: ## N번째*/
// MARK: - [] Example 1: Cho Simple Closure
    // 1. 선언 및 실행 choSimpleClosure
// MARK: - [] Example 2: 코드블록을 구현한 Closure
    // choSimpleClosure - print("Hello, 클로져, 코로나 하이!")
// MARK: - [] Example 3: 인풋(String) 파라미터를 받는 Closure

// MARK: - [] Example 4: 값을 리턴하는 Closure (String -> String)
    // 변수할당 -> print(변수)

// MARK: - [] Example 5: Closure를 파라미터로 받는 함수 구현
    // () -> Void
    // 1 - 함수 호출
    // ({2 - 함수호출})


/*: ## 1번째*/
printChapterTitle(title: "1 - Example 1: Cho Simple Closure", isDone: 2)
// MARK: - [🟢] Example 1: Cho Simple Closure
    // 1. 선언 및 실행 choSimpleClosure
let choSimpleClosure: () -> Void = {
    print("1. choSimpleClosure가 호출 되었음")
}
choSimpleClosure()
// MARK: - [🟢] Example 2: 코드블록을 구현한 Closure
    // choSimpleClosure - print("Hello, 클로져, 코로나 하이!")
// MARK: - [🟢] Example 3: 인풋(String) 파라미터를 받는 Closure
func someSimpleFunction(choSimpleClosure: ()-> Void) {
    print("\n2. somesimpeFunction 호출")
    choSimpleClosure()
}
someSimpleFunction(choSimpleClosure: choSimpleClosure)
someSimpleFunction {
    print("🟢 헬로 코로나 from closure\n")
}

// MARK: - [🟢] Example 4: 값을 리턴하는 Closure (String -> String)
    // 변수할당 -> print(변수)
func someSimpleFunction(message: String, choSimpleClosure: () -> Void) {
    print("\n1 - 메시지는... \(message)")
    choSimpleClosure()
    print()
}

// MARK: - [🟢] Example 5: Closure를 파라미터로 받는 함수 구현
    // () -> Void
someSimpleFunction(message: "5 - 1. 메시지 전달", choSimpleClosure: {print("초심플...")})
    // 1 - 함수 호출
someSimpleFunction(message: "5 - 2 메시지 전달") {
    print("후행 클로저 실행")
}
