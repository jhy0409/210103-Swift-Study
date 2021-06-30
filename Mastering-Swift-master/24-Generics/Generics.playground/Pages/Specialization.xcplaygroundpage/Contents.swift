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
 # Specialization
 */
/*
 특수화를 통한 특정형식 위한 함수 구현
 
 제네릭 : 형식 관계없이 동일한 코드 실행함
 문자열 전달 경우에도 동등연산자로 비교
 
 대소문자 무시 -> case insensitive 스트링만 제공
 */

func swapValue<T: Equatable>(lhs: inout T, rhs: inout T) {
   print("generic version")
   
   if lhs == rhs {
      return
   }
   
   let tmp = lhs
   lhs = rhs
   rhs = tmp
}

func swapValue(lhs: inout String, rhs: inout String) {
    print("specialized version")
    
    if lhs.caseInsensitiveCompare(rhs) == . orderedSame {
        let tmp = lhs
        lhs = rhs
        rhs = tmp
    }
}

var a = 1
var b = 2
swapValue(lhs: &a, rhs: &b) // 실제 호출함수는 전달되는 값을통해 정해짐

var c = "Swift"
var d = "Programming"
swapValue(lhs: &c, rhs: &d)
/*
 제네릭함수 오버라이딩한 함수로 인식됨
 제네릭 함수보다 우선순위가 높음
 모든함수가 문자열 받을 수 있지만 우선순위 높은 두번째 함수가 호출됨
 */
