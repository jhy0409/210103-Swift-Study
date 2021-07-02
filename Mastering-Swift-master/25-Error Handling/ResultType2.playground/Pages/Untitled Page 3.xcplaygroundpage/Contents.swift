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
 # Higher-order Functions
 */
/*
 result 4가지 고차함수 제공
 1. 맵 : 성공값 새로운 형식으로 변환시 사용
 */
enum MyError: Error {
   case error
}

enum ValueError: Error {
   case evenNumber
}

func doSomethingWithResult(data: Int) -> Result<Int, MyError> {
   guard data.isMultiple(of: 2) else { // data가 홀수면 failure리턴, 짝수 : success리턴
      print("failure: \(data)")
      return .failure(MyError.error)
   }
    print("success : \(data)")
   return .success(data)
}

let a = doSomethingWithResult(data: 2)
let a2 = doSomethingWithResult(data: 3)

// 성공값 새로운 형식으로 변환, 실패값 변환하지 않음
// map: result형식의 성공값을 클로저 파라미터로 전달
// 클로저 리턴값 성공값 저장후 -> 새로운 result 인스턴스 리턴
let b = a.map { $0.isMultiple(of: 2) ? "even number" : "odd number" }

// 현재 success값 파라미터로 받은 후 새로운 result인스턴스 리턴
let c = a.flatMap { $0.isMultiple(of: 2) ? .success("even number") : .success("odd number") }
