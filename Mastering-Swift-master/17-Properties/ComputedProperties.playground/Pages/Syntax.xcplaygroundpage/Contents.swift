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
 # Computed Properties
 ![computed](computed.png)
 */
/*
 계산 속성 : 다른속성 기반으로 속성값 결정됨, 메모리공간 X
 - 다른 속성에 저장된 값 읽어서 필요계산 실행 후 리턴 또는
 - 속성에 전달된 값 다른 속성에 저장
 
 -> 속성 접근할 때마다 다른 값 리턴될 수 있음
 -> 선언을 var로
 
 * 저장속성 : 클래스, 구조체
 
 * 계산속성 : 클래스, 구조체, 열거형 추가 가능
 - 자료형 명시적 선언필요, 선언시점에 기본값 및 형식추론 불가능
 - getter 선언된 자료형과 동일한 값 또는 다른속성 반환, (값 얻을 때 사용)
 - setter 매개값으로 속성 지정할 때 사용, 파라미터, (값 저장할 때 사용)
 -> 괄호, 파라미터 생략 가능 new value 기본 파라미터 사용
 
 */

class Person {
    var name: String
    var yearOfBirth: Int
    
    init(name: String, year: Int) {
        self.name = name
        self.yearOfBirth = year
    }
    var age: Int {
        get {
            let calendar =  Calendar.current
            let now = Date()
            let year = calendar.component(.year, from: now) // 올해
            return year - yearOfBirth // 올해 - 태어난 년도
        }
        set { // 출생년도 계산
            let calendar = Calendar.current
            let now = Date()
            let year = calendar.component(.year, from: now)
            yearOfBirth = year - newValue // 올해 - 설정된 나이(50)
            // set의 파라미터 생략시 기본이름 사용(newValue)
        }
    }
}

let p = Person(name: "prsn1 - John Doe", year: 2002)
p.age // 값 읽을 때 get블록 실행
p.yearOfBirth

p.age = 15 // set블록 실행
p.yearOfBirth

// - 읽기전용 계산속성 ------------------
class Person2 {
    var name: String
    var yearOfBirth: Int
    
    init(name: String, year: Int) {
        self.name = name
        self.yearOfBirth = year
    }
    
    var age: Int { // 할당 연산자가 없음, 읽기전용 =가 있으면 클로저 저장코드
        let calendar =  Calendar.current
        let now = Date()
        let year = calendar.component(.year, from: now) // 올해
        return year - yearOfBirth // 올해 - 태어난 년도
    }
}
let p2 = Person2(name: "prsn2 - spring summer", year: 2002)
p2.name
p2.age // 값 읽을 때 get블록 실행
p2.yearOfBirth

/*:
 ## Read-only Computed Properties
 ![readonly-1](readonly-1.png)
 ![readonly-2](readonly-2.png)
 */












