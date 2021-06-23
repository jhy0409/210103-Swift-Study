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
 # Overloading
 */
/*
 오버라이딩 : 상속된 멤버 현재 클래스 적합하게 다시 구현할 때 사용
 오버로딩 : 하나의 형식 다수의멤버 구현할 때 사용
 
 - 스위프트 오버로딩
    - 함수이름, 파라미터, 리턴형 포함해서 식별
 
 - 스위프트 : 오버로딩 지원
 - 오버로딩 사용 : 함수, 메소드, 서브스크립트, 생성자 가능
 
 [오버로딩 규칙]
 1. (동일) 함수이름                         -> 파라미터 수로 식별         -> *2, *3
 2. (동일) 함수이름, 파라미터 수               -> 파라미터 자료형으로 식별     -> *1, *2
 3. (동일) 함수이름, 파라미터 수               -> Argument Lable로 식별   -> *2, *4
 ============================= 여기까지만 주로 사용 =============================
 4. (동일) 함수이름, 파라미터, Argument Lable -> 리턴형으로 식별.           -> *5, *6
 */

func process(value: Int) { // *1
    print("1st Func / process Int: \(value)")
}

func process(value: String) { // *2
    print("2nd Func / process String: \(value)")
}

func process(value: String, anotherValue: String) { // *3
    print("3rd Func / process String: \(value), \(anotherValue)")
}

func process(_ value: String) { // *4
    print("4th Func / process Int: \(value)")
}

func process(value: Double) -> Int { // *5
    print("\n5th Func / process Int: \(value) \t/ return Double -> Int")
    return Int(value)
}

func process(value: Double) -> String? { // *6
    print("6th Func / process str: \(value)\t/ return Double -> String")
    return String("6th Func / process Int: \(value)")
}

process(value: 0) // *1
process(value: "str") // *2
process("str") // *4

// 리턴형으로 함수식별, 리턴값 변수상수 저장 후 자료형 선언 필요
// 상수의 자료형이 호출할 함수를 결정
let result1_1: Int = process(value: 11.11) // *5
// print(result1_1) // print -> 11
let result2: String? = process(value: 56.78) // *6

// 자료형 생략 형식추론 사용
let result1_2 = process(value: 11.22) as Int // *5

struct Rectangle {
    func area() -> Double {
        print("struct Rectangle - 인스턴스 메소드 호출")
        return 0.0
    }
    
    static func area() -> Double {
        print("struct Rectangle - 형식(static)메소드 호출")
        return 0.0
    }
}

let r = Rectangle()
print()
r.area()
Rectangle.area()
// (동일) 파라미터, 리턴형, 함수이름
// 인스턴스, 형식 이름으로 호출, 동일하게 선언해도 문제 없음
