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
 # Enumerations
 ![enum](enum.png)
 */
/*
상수 -> Enumeration Case(or Case)
독립적 자료형

 사용이유
 1. 가독성
 2. 안정성
 */

let left = 0
let center = 1
let right = 2


//let left = "left"
//let center = "center"
//let right = "right"

/*
 if alignment = "Center" { // 대소문자 구분으로 실행안됨
 
 }
 */

var alignment = center

/*:
 ## Syntax
 ![syntax](enum-syntax.png)
 */
enum Alignment {
    case left
    case right
    case center
}

Alignment.center // 독립적인 값
var textAlignment = Alignment.center // 열거형으로 저장했기 때문에
textAlignment = .left // .케이스 이름만 써도 에러 안남

//textAlignment = .justify // 저장되지 않은 값 저장 불가능
//textAlignment = .Left // 오타 허용X

if textAlignment == .center {
    
}

switch textAlignment {
case .left:
    print("left")
case .right:
    print("right")
case .center:
    print("center")
}

