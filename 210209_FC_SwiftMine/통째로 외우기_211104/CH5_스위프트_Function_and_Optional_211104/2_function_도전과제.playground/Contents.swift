import UIKit

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
/*: ## 오버로드(Overload)*/
// MARK: - [ㅇ] 물건 값, 개수 받아서 출력하는 함수
func printTotal(price: Int, count: Int) {
    print("func 1. Int\t -> Total Price : \(price * count)")
}

func printTotal(price: Double, count: Double) {
    print("func 2. Double\t -> Total Price : \(price * count)")
}

func priceTotal(가격: Int, 개수: Int) {
    print("func 3. Parameter Name change\t -> Total Price : \(가격 * 개수)")
}


/*: ## in-out parameter*/
// MARK: - [ㅇ] 변수 원본 값 +1 증가시키는 함수
var value = 3

func incrementAndPrint(_ value: inout Int) {
    value += 1
    print(value)
}

incrementAndPrint(&value)
value
