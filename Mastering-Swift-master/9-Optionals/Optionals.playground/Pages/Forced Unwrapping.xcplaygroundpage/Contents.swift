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

//: [Previous](@previous)

import Foundation

/*:
 # Unwrapping
 */
var num: Int? = nil
print(num)

num = 123
print(num)
//옵셔널은 특별한 방법으로 값 저장함, 값이 랩으로 포장되어 있다. 값이 필요하면 언래핑 (값추출)

let n = 123
print(n)


/*:
 ## Forced Unwrapping
 ![forced-unwrapping](forced-unwrapping.png)
 */
// 강제 추출 ! 강제추출 연산자
print(num)
print(num!)

num = nil
//print(num!)
//앱에 포함돼 있으면 크래시 발생, 앱이 죽음

if num != nil{
     print(num!)
}

num = 123
let before = num
let after = num!
//크래시 발생으로 가능하면 사용하지 말 것







