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

//: [Previous](@previous)
/*:
 # Type Annotation
 ## Syntax
 ![TypeAnnotation](type-annotation.png)
 */
let num: Int = 123
//상수 이름: 종류 = 초기값
//선언 초기화 분리 가능

let value: Double
value = 12.3
//기본 저장 자료형이 있고 다른 자료형으로 저장하고 싶으면 Annotation 사용

let ch: Character = "c"
//초기값으로 형식추론, 컴파일 시간 증가, 컴파일 시간단축위해 사용
//형식추론 : 초기값으로 자료형 결정
//Int, Double, String, Bool
//: [Next](@next)
