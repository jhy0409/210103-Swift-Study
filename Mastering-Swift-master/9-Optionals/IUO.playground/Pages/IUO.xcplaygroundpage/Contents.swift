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
 # Implicitly Unwrapped Optionals
 ![iuo](iuo.png)
 */
// 암시적, 자동적으로 추출되는 옵셔널
let num: Int! = 12
let a = num
// 형식추론 사용시 자동추출 x

let b: Int = num
// non-optional 처리돼야 할 때 자동 언래핑 (특정조건에서)
// let num: Int? = 12 -> 오류 / !강제추출 하거나 옵셔널바인딩 사용

let b2: Int = num!
//이렇게랑 옵셔널 바인딩 사용가능

let num2: Int! = nil
//let b3: Int = num2!
//iuo 옵셔널, 자동 및 강제추출, 값있는지는 확인x
// 아웃렛연결, api에서 iuo리턴 -> 옵셔널처리 옵셔널 바인딩이나 체이닝으로 처리
