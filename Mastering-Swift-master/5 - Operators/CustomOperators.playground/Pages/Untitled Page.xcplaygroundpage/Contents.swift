//
//  Copyright (c) 2018 KxCoding <kky0317@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//
import UIKit

/*:
 # Custom Operators
 ![operator](operator.png)
 
 ### Reserved Tokens
 (, ), {, }, [, ], ., ,, :, ;, =, @, #, &(prefix operator), ->, `, ?, !(postfix operator), \/*, *\/
 
 ### First Character
 /, =, -, +, !, *, %, <, >, &, |, ^, ?, ~
 
 ![custom-operator](custom-operator.png)
 */*/
// 기존에 없던 새로운 연산자 구현 = 사용자정의 연산자
// 없던 새로운 연산자 구현하므로 > 연산자 선언 > 글로벌 스코프에서 선언
// infix : 이항연산자와 같이 중간에 올 때

prefix operator +++
extension Int {
    static prefix func +++(num: inout Int){
        num += 2
    }
}

var a = 1
+++a
a

precedencegroup MyPrecedence {
    higherThan: AdditionPrecedence
}
// + -, 보다 높아짐

infix operator *+*: MyPrecedence

extension Int {
    static func *+*(left: Int, right: Int) -> Int {
        return (left * right) + (left * right)
    }
}

1 *+* 2 + 3





/*:
 # Precedence Groups
 ![precedence-group](precedence-group.png)
 
 [Operator Declarations]:
 https://developer.apple.com/documentation/swift/operator_declarations "Operator Declarations"
 
 [Operator Declarations]
 
 ![precedence-group-syntax](precedence-group-syntax.png)
 
 ![precedence-group-declaration](precedence-group-declaration.png)
 */
// 우선순위 그룹 이름 upperCamel로 짓는게 관례
// lower : 다른모듈에 선언된 그룹지정
// associativity : 연산자 결합규칙 지정, left, right, none(기본값)





