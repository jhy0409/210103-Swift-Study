import UIKit

var carName: String?
carName = nil
carName = "탱크"

func printChapterTitle(str: String, isDone: Int) {
    let checkState = ("🔴", "🟠", "🟢")
    let line = "\t-----------------------------"
    
    switch isDone {
    case 0:
        print("\n\(checkState.0) \(str+line)")
        
    case 1:
        print("\n\(checkState.1) \(str+line)")
        
    case 2:
        print("\n\(checkState.2) \(str+line)")
    default:
        break
    }
}

/*: ### 아주 간단한 과제 */
// 1. 여러분이 최애하는 영화배우의 이름을 담는 변수를 작성해주세요 (타입 String?)
// 2. let num = Int("10") -> 타입은 뭘까요?? // Int?

var favoritActor: String?
let num = Int("10")

/*: ## 고급 기능 4가지*/
/*: ### 1. Forced unwrapping*/
// Forced unwrapping > 억지로 박스를 까보기
carName = nil
//print(carName!)
// Error Message :  선택적 값의 래핑을 해제하는 동안 예기치 않게 nil이 발견되었습니다. Unexpectedly found nil while unwrapping an Optional value
printChapterTitle(str: "1. Forced unwrapping", isDone: 2)

if let unWrappedCarName = carName {
    print(unWrappedCarName)
} else {
    print("차 이름이 존재하지 않습니다")
}
/*: ### 2. Optional binding (if let)*/
// Optional binding (if let) > 부드럽게 박스를 까보자 1
printChapterTitle(str: "2. Optional binding (if let)", isDone: 2)

// MARK: - [ㅇ] String -> int parse 함수 만들기

// if-let 사용
func printParsedInt(_ from: String) {
    if let parsedInt = Int(from) {
        print(parsedInt)
    } else {
        print("used if-let\t\t: 인트 전환 불가능")
    }
}
printParsedInt("100")
printParsedInt("될리가 없지")
print()

/*: ### 3. Optional binding (guard)*/
// Optional binding (guard) > 부드럽게 박스를 까보자 2
// guard문 사용
printChapterTitle(str: "3. Optional binding (guard)", isDone: 2)
func printParsedInt(from: String) {
    guard let parsedInt = Int(from) else {
        print("used guard-else\t: 인트 전환 불가능")
        return
    }
    print(parsedInt)
}
printParsedInt(from: "100")
printParsedInt(from: "될리가 없지")

/*: ### 4. Nil coalescing*/
// Nil coalescing > 박스를 까봤더니, 값이 없으면 디폴트 값을 줘보자
printChapterTitle(str: "4. Nil coalescing", isDone: 2)
let myCarName: String = carName ?? "empty"

print(myCarName)
