import UIKit

/*: ## N회차*/
// MARK: - [] 선언(정식문법)   - Int, 1, 2, 3, 1
// MARK: - [] 선언(Set)      - Int 1, 2, 3, 1, 2

// MARK: - [] 값이 비었는지, 갯수 확인
// MARK: - [] 값 포함 확인 4, 1
// MARK: - [] 추가 - 5, 확인
// MARK: - [] 삭제 - 1, 확인

/*: ## 1회차*/
// MARK: - [🔴] 선언(정식문법)   - Int, 1, 2, 3, 1
var someArray: Array<Int> = [1, 2, 3, 1]
someArray.append(contentsOf: [1, 1, 1])

// MARK: - [🔴] 선언(Set)      - Int 1, 2, 3, 1, 2
var someSet: Set<Int> = [1, 2, 3, 1, 2]

// MARK: - [🟢] 값이 비었는지, 갯수 확인
someSet.isEmpty
someSet.count

// MARK: - [🟢] 값 포함 확인 4, 1
someSet.contains(4)
someSet.contains(1)

// MARK: - [🟠] 추가 - 5, 확인
someSet.insert(5)
someSet

// MARK: - [🟠] 삭제 - 1, 확인
someSet.remove(1)
someSet
