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
/*
 짧고 독립적인 코드조각
 
 - objective c : block
 - java : lamda
 
 람다 포함되는 세가지
 
 Named Closures
 1. Function
 2. Nested Function
 
 Unnamed Closures
 3. Anonymous Function (익명, 이름 없는 함수)
 
 */
/*:
 # Closures
 ![closure-expr](closure-expr.png)
 ![closure](closure.png)
 */
// 파라미터, 리턴형 생략된 클로저
let c = { print("Hello, Swift") }
c()

// 파라미터, 리턴 ㅇ 클로저, argument lable 미사용
let c2 = { (str: String) -> String in
    return "Hello2, \(str)"
}

let result = c2("Closure")
print(result)


// 함수 <-> 클로저 호환가능

// 클로저를 파라미터로 전달
// 상수에 저장된 클로저
typealias SimpleStringClosure = (String) -> String

func perform(closure: SimpleStringClosure) {
    print(closure("iOS"))
}
perform(closure: c2)

// 인라인 클로저 : 클로저 자체를 인자(argument)전달
perform(closure: {(str: String) -> String in
    return "Hi, \(str)"
})

//: [Next](@next)
