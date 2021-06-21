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
 # Identity Operator
 ![identity-op](identity-op.png)
 */
/*
 동일성 비교
 
 1. 값형식 - 메모리 : 스택 > 비교연산자 사용 : 하나의 공간에 저장되기 때문
 2. 참조형식 - 값 : 힙    > 메모리 주소    : 스택에 저장
         ** 비교 방법 2개 필요(값, 주소)
         - 값 비교 : 비교연산자(==, !=)
         - 메모리 주소 비교 : 항등연산자
 */

class A {
    
}
let a = A()
let b = a
let c = A()

a === b // identical 인스턴스가 동일한 주소에 저장돼있음(동일 메모리 주소)
a !== b
a !== c // 서로 다른인스턴스

