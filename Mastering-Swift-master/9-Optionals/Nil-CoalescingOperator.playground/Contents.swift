import UIKit

/*:
 # Nil-Coalescing Operator
 */
var msg = ""
var input: String? = "Swift"

if let inputName = input {
    msg = "Hello, " + inputName
} else {
    msg = "Hello, Stranger"
}
print(msg)

var str = "Hello, " + (input != nil ? input! : "Stranger")
print(str)
/*:
 ## Syntax
 ````
 a ?? b
 OptionalExpression ?? Expression
 ````
*/
//좌 : 옵셔널, 우: 옵셔널 표현식(값 없을 때 사용할 기본값)
//단락평가 수해으 값없을 때만 우측평가(사이드이펙트 발생코드 없어야 함)
input = nil
str = "Hello, " + (input ?? "Stranger")
print(str)
























