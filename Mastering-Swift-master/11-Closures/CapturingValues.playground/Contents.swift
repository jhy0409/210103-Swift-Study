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
 # Capturing Values
 */
/*
 짧고 독립적인 코드조각
 
 - objective c : block
 - java : lamda
 
 람다 포함되는 세가지
 
 Named Closures
 1. Function        : 값 캡처 x
 2. Nested Function : 값 캡처 ㅇ
 
 Unnamed Closures
 3. Anonymous Function (익명, 이름 없는 함수)
 
 */


// 클로저 내부에서 외부 값 접근시 값을 캡처함(값 가져와 쓴다)
// objective-c : 값 복사, swift : 참조 복사
var num = 0
let c = {
    num += 1
    print("check point #1: \(num)")
}
c()


print("check point #2: \(num)")

