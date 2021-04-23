import UIKit

// ----------- 챕터 5-9 -----------
//옵셔널 형태 타입선언
var carName1 = "tesla"
var carName: String?

//nil 또는 값표기 가능
carName = nil
carName = "탱크"

// 과제
// 1. 영화배우 이름 담는 편수 작성 (타입: String?)
// 2. let num = int("10") -> 타입은?

let actorName: String?
//let actorName: String? = nil
actorName = "가나다"
let num = Int("10")

// ----------- 챕터 5-10 -----------
// 고급기능 4가지

// 1. Forced unwrapping         > (강제) 값 강제 추출
// 2. Optional binding (if)     > (정상) 값 추출1
// 3. Optional binding (guard)  > (정상) 값 추출2
// 4. Nil coalescing            > 값 추출, 값이 없으면 기본값을 준다.


// -- 1. Forced unwrapping         > (강제) 값 강제 추출
print(carName as Any)
print(carName!)

// 오류 : 값이 없는데 꺼낼 수 X
//carName = nil
//print(carName!)

// -- 2. Optional binding (if)     > (정상) 값 추출1
//carName = nil
if let unwrappedCarName = carName {
    print(unwrappedCarName)
} else {
    print("Car Name 없다")
}

// Cyclomatic Complexity : 메소드 내 여러기능 중첩하지 말것(depth 높아봤자 복잡하기만 함)
func printParsedInt(from: String) {
    if let parsedInt = Int(from) {
        print(parsedInt)
    } else {
        print("Int로 컨버팅 불가능")
    }
}

printParsedInt(from: "100")
printParsedInt(from: "Hello")

// ----------- 챕터 5-11 -----------
// -- 3. Optional binding (guard)  > (정상) 값 추출2
func printParsedInt2(from: String) {
    guard let parsedInt = Int(from) else {
        print("Int로 컨버팅 불가능")
        return
    }
    print(parsedInt)
}

printParsedInt2(from: "55")
printParsedInt2(from: "Hello")

// -- 4. Nil coalescing            > 값 추출, 값이 없으면 기본값을 준다.
//carName = nil
let myCarName: String = carName ?? "모델"

// ----------- 챕터 5-12 -----------
// 1. 음식이름 담는변수 작성 (String?)
// 2. 옵셔널 바인딩 이용해서 값 확인
// 3. 닉네임 받아서 출력하는 함수, 조건입력 파라미터는 String?

//let favoriteFood: String? = nil
let favoriteFood: String? = "양고기"
if let foodName = favoriteFood {
    print(("\n\n") + foodName)
} else {
    print("\n\n좋아하는 음식 없음")
}

func printNickName(name: String?) {
    guard let nickName = name else {
        print("없어요")
        return
    }
    print(nickName)
}
printNickName(name: "hello")
printNickName(name: nil)

// -----------------------------------------

// 3-1.
var foodName: String?
foodName = "커피"
//foodName = nil

// 3-2.
if let umsik = foodName {
    print(("\n\n")+umsik)
} else {
    print(("\n\n")+"값 없음")
}


// 3-3.
func prNicN(name: String?){
    guard let Nname = name else {
        print("값 없음")
        return
    }
    print(Nname)
}
prNicN(name: "이름은 하나인데 별명은 서너개")
prNicN(name: nil)
