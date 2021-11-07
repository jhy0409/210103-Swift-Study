import UIKit

func printChapterTitle(title: String, isDone: Int) {
    let doneStates = (not: "🔴", oneMore: "🟠", done: "🟢")
    let line = "\t----------------------------"
    var resultString: String = ""
    switch isDone {
    case 0:
        resultString = "\(doneStates.not + " " + title)\(line)"
        
    case 1:
        resultString = "\(doneStates.oneMore + " " + title)\(line)"
        
    case 2:
        resultString = "\(doneStates.done + " " + title)\(line)"
        
    default:
        break
    }
    
    print(resultString)
}
/*: ## N번째*/
// MARK: - [] 1. Sorting - let scores = [80, 90, 75, 99]
    // let sortedScors = .?()
    // .?? { a, b -> Bool in return ... }

// MARK: - [] Filtering
    // let prices = [1500, 30000, 2000, 20000]
    // let expensivePrices = prices. (10000보다 큰 금액만)

// MARK: - [] Map - 재가공
    // let discountedPrices >> 10프로 할인된 금액으로

// MARK: - [] Reduce : 값을 하나로 합칠 때
    // let sum =

    // let items = [1500: 5, 30000: 1, 2000: 3, 20000: 2]
    // let totalPrice =

// MARK: - [] 과제
    // let names = ["Jason", "Jim", "James", "Jake", "Jay"]
    // 1. 이름의 Array를 생성하고, reduce를 이용해서 모든 이름 연결하기
    // 2. 1에서 생성된 이름의 Array에서 글자가 3개 초과인 이름을 filter로 걸러내고, 걸러낸 이름을 reduce를 이용해서 연결하기

    // let students = ["Jason": 15, "Jim": 35, "James": 24, "Jake": 18, "Jay": 41]
    // 3. 학생들 딕셔너리 만들기 (키: 이름, 밸류: 나이), filter를 이용해서 20세 이상인 학생만 걸러내기
    // 4. 3번에서 걸러낸 학생들... map을 이용해서 이름만 Array만들기
/*: ## 1번째*/
printChapterTitle(title: "1번째 - sorting", isDone: 2)
// MARK: - [🟢] 1. Sorting - let scores = [80, 90, 75, 99]
    // let sortedScors = .?()
    // .?? { a, b -> Bool in return ... }
let scores = [80, 90, 75, 99]
var sortedScores = scores.sorted()
sortedScores.sorted { a, b in
    return a > b
}

printChapterTitle(title: "1번째 - Filtering", isDone: 2)
// MARK: - [🟢] Filtering
    // let prices = [1500, 30000, 2000, 20000]
    // let expensivePrices = prices. (10000보다 큰 금액만)

let prices = [1500, 30000, 2000, 20000]
let expensivePrices = prices.filter { price -> Bool in
    return price > 10000
}

printChapterTitle(title: "1번째 - Map", isDone: 2)
// MARK: - [🟢] Map - 재가공
    // let discountedPrices >> 10프로 할인된 금액으로
let discountedPrices = prices.map { price in
    return Int(Double(price) * 0.1)
}

printChapterTitle(title: "1번째 - Reduce", isDone: 2)
// MARK: - [🟢] Reduce : 값을 하나로 합칠 때
    // let sum =

    // let items = [1500: 5, 30000: 1, 2000: 3, 20000: 2]
    // let totalPrice =

let sum = prices.reduce(0) { a, b in
    return a + b
}

let items = [1500: 5, 30000: 1, 2000: 3, 20000: 2]
let totalPrice = items.reduce(0) { a, b in
    return a + b.key * b.value
}


// MARK: - [] 과제
let names = ["Jason", "Jim", "James", "Jake", "Jay"]
printChapterTitle(title: "1번째 - 과제1-1", isDone: 2)
// 1. 이름의 Array를 생성하고, reduce를 이용해서 모든 이름 연결하기
// 2. 1에서 생성된 이름의 Array에서 글자가 3개 초과인 이름을 filter로 걸러내고, 걸러낸 이름을 reduce를 이용해서 연결하기
let allNames = names.reduce("") { a, b in
    return a + " " + b
}

printChapterTitle(title: "1번째 - 과제1-2", isDone: 2)
let allNames2 = names.filter { name in
    return name.count > 3
}.reduce("") { a, b in
    return a + " " + b
}

printChapterTitle(title: "1번째 - 과제2", isDone: 2)
let students = ["Jason": 15, "Jim": 35, "James": 24, "Jake": 18, "Jay": 41]
// 3. 학생들 딕셔너리 만들기 (키: 이름, 밸류: 나이), filter를 이용해서 20세 이상인 학생만 걸러내기
// 4. 3번에서 걸러낸 학생들... map을 이용해서 이름만 Array만들기

let adultStudents = students.filter { student in
    return student.value >= 20
}

let adultStudentNames = adultStudents.map { student in
    return student.key
}
