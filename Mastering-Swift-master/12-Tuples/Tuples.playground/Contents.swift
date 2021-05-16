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
 # Tuples
 
 ## Tuple Expression
 ![tuple-expr](tuple-expr.png)
 */
// let i = (12, 34)
// int(스칼라 타입)    : 하나의 값만 저장함
// 튜플(컴파운드 타입)   : 두개의 값 이상 저장 가능함

let data = ("<html>", 200, "OK", 12.34)
// (가능)  멤버 값 수정
// (불가능) 멤버의 값 추가 및 삭제


/*:
 ## Explicit Member Expression
 ![eme](eme.png)
 */
// Unnamed Tuple ----------------- 멤버의 이름이 x

// 튜플 이름or튜플 리턴함수.인덱스
data.0
data.1
data.2
data.3

// 값 형식, 값 복사 함
var mutableTuble = data
mutableTuble.1 = 404
mutableTuble.1
