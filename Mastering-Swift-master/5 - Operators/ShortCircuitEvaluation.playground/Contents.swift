import UIKit

/*:
 # Short-circuit Evaluation
 */
// 조건식 평가하는 방법
//false && -> false면 다 false
//true || -> true면 다 true
//단락 평가 : 결과를 얻는데 필요한 최소한의 코드만 실행
var a = 1
var b = 1

func updateLeft() -> Bool {
    a += 1
    return false
}
func updateRight() -> Bool {
    b += 1
    return true
}
// 예시) updateLeft, right가 둘다 호출되어야 하는
//상황일 경우 논리적오류 발생가능성ㅇ, 논리식 작성시 빼야함
//if updateLeft() && updateRight(){ }
let resultA = updateLeft()
let resultB = updateRight()
//논리연산자 조건평가전에 결과 미리 도출하고 (상수에 저장된 값 논리표현식에 사용)
//()는 항상 호출됨

if resultA && resultB{ }
a
b
// Side Effect*: 부작용,  코드실행결과로 값또는 상태가 변경되는 것 a변경으로 1번 발생
// 예측가능한 범위내에 있어야함, 의도결과 도출해야함
// 단순출력은 발생 X
a = 1
// 값 변경으로 발생*
