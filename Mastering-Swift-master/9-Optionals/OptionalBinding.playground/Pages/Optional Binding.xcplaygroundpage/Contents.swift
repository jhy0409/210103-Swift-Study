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
import Foundation

/*:
 # Optional Binding
 */
var num: Int? = nil
//print(num!)

//if num != nil {
//    print(num)
//}


/*:
 ## Syntax
 ![optional-binding-syntax](optional-binding-syntax.png)
 */

// if, while, guard문에서 사용.
// 상수 (이름): (자료형) = (초기값 : 옵셔널 표현식) { 실행문 }
// ()~() => 바인딩
// 코드 실행조건 : 옵셔널 표현식 평가 >> 값이 리턴이 되면 언래핑 후 상수에 저장 됨 >> 바인딩 성공
// 값 있을때만 실행되기 때문에 옵셔널에 의한 크래시 대부분 피할 수 있음

if num != nil {
    print(num!) //강제 추출
} else {
    print("empty")
}
if let num = num { // 임시상수* = 위에서 선언한 변수**
    print(num)     // -> *
    //옵셔널 바인딩에서는 같은 이름 사용해도 문제 발생 x
} else {
    print("empty")
}

var str: String? = "str"
guard let str = str else {
    fatalError()
}
str //바인딩한 상수는 엘스블록 다음에서 사용한다.

num = 123
if var num = num {
    num = 456
    print(num)
}

// 하나의 문장 여러바인딩 동시 사용
let a: Int? = 12
let b: String? = "str"

if let num = a, let str = b, str.count > 5 {
    
}










































