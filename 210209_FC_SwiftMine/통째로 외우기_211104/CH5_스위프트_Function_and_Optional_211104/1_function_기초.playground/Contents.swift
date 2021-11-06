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

/*: ## N회차*/
// MARK: - [] 이름을 출력하는 함수 - printName()
// MARK: - [] param 1개, 숫자를 받아서 10을 곱하여 출력, +기본값 1500원

// MARK: - [] param 2개, 물건값, 갯수 받아서 전체금액 출력하는 함수
/*: ## 1회차*/
// MARK: - [🟢] 이름을 출력하는 함수 - printName()
func printName1() {
    print("my name is....")
}

printName1()

// MARK: - [🟢] param 1개, 숫자를 받아서 10을 곱하여 출력, +기본값 1500원

func printMultipleOfTen1(value: Int) {
    print("\(value) * 10 = \(value * 10)")
}

printMultipleOfTen1(value: 5)

// MARK: - [🟢] param 2개, 물건값, 갯수 받아서 전체금액 출력하는 함수

func printTotalPrice1(price: Int, count: Int) {
    print("1 - 물건 가격\t: \(price * count)")
}

func printTotalPrice1_1(price: Int, count: Int) -> Int {
    print("3 - 물건가격\t: \(price * count)")
    
    return price * count
}

printTotalPrice1(price: 1500, count: 5)
printTotalPrice1(price: 1500, count: 10)
printTotalPrice1(price: 1500, count: 7)
printTotalPrice1(price: 1500, count: 1)

func printTotalPrice1(_ price: Int = 1500, count: Int) {
    print("2 - 물건가격\t: \(price * count)")
}

printTotalPrice1(count: 5)
printTotalPrice1(count: 10)
printTotalPrice1(count: 7)
printTotalPrice1(count: 1)

let calcValue = printTotalPrice1_1(price: 10000, count: 77)
calcValue
/*: ## Function 기초 */
// MARK: - [ㅇ] 이름을 출력하는 함수
printChapterTitle(str: "Function 기초", isDone: 0)
func printName() {
    print("---> My name is Jason")
}

printName()

/*: ### 오버로딩 */
// MARK: - [ㅇ] param 1개, 숫자를 받아서 10을 곱하여 출력
func printMultipleOfTen(value: Int) {
    print("\(value) * 10 = \(value * 10)")
}
printMultipleOfTen(value: 5)

// MARK: - [ㅇ] param 2개, 물건값, 갯수 받아서 전체금액 출력하는 함수
func printTotalPrice(price: Int, count: Int) {
    print("1. 물건과 갯수\t\t- Total Price : \(price * count)")
}
printTotalPrice(price: 1500, count: 5)
printTotalPrice(price: 1500, count: 10)
printTotalPrice(price: 1500, count: 7)
printTotalPrice(price: 1500, count: 1)

print()
func priceTotalPrice(price: Int = 1500, count: Int) {
    print("2. 갯수만 받아옴\t- Total Price: \(price * count)")
}
priceTotalPrice(count: 5)
priceTotalPrice(count: 10)
priceTotalPrice(count: 7)
priceTotalPrice(count: 1)

func totalPrice(price: Int, count: Int) -> Int {
    let totalPrice = price * count
    return totalPrice
}

let calculatedPrice = printTotalPrice1_1(price: 10000, count: 77)
calculatedPrice
