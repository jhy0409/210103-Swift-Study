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
 # Assignment Operator
 ````
 a = b
 ````
 */
// 할당 연산자
let a = 12
var b = 34
b = a

// 할당 연산자는 값을 리턴하지 않아서 사용 불가능
// if a = 0 { } XXX, 컴파일러에서 오류발생함, object-c는 실행되기 때문에 위치변경필요
// if a == 0 { }

// lvalue 할당연산자 기준으로 왼쪽, 메모리 공간 나타냄
// = 기준으로 양쪽에 올 수 있음
// rvalue 저장값 나타내는 표현식, 보통 리터럴이나 임시값, 메모리 공간없음(할당 연산자로 저장공간 x)
// = 할당 연산자 기준 오른쪽에만 위치가능
//: [Next](@next)
