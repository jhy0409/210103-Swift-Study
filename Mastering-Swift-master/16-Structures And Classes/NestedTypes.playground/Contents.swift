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
 # Nested Types
 ![nested-type](nested-type.png)
 */
/*
 포함된 형식, 내포된 형식
 형식 내부에 선언된 형식
 */

class One {
    struct Two { // nested type
        enum Three {
            case a
            class Four {
            }
        }
    }
    var a = Two() // 생략 가능
    //var a = One.Two()
}

let two: One.Two = One.Two()
let four: One.Two.Three.Four = One.Two.Three.Four()
let a_three: One.Two.Three = One.Two.Three.a

/*
 NumberFormatter : 숫자를 특정형식의 문자열로
 DateFormatter   : 날짜를 대상으로 사용
 */
