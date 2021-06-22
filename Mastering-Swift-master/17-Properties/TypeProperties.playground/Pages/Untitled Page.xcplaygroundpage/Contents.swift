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
 # Type Properties
 ## Stored Type Properties
 ![type1](type1.png)
 ![type2](type2.png)
 */
/*
 형식속성(Type Property) :
    - 특징 : 타입의 속성, 모든 인스턴스가 공유하는 하나의 공간만 생성
    - 기본값 : 기본값생략 불가능, (->생성자로 생성되지 않아서)
    - 추가 : 클래스, 구조체, 열거형 모두 가능
    - 접근 : 형식이름.속성이름
 
 1. 저장형식 속성 : 속성 최초 접근시 초기화 (형식속성 = 지연속성)
 형식과 연관된 메소드를 선언, 접근
 */

class Math {
    static let pi = 3.14
}

let m = Math()
Math.pi // 저장 형식속성(pi속성) -> 접근시점에서 초기화 됨


/*:
 ## Computed Type Properties
 ![type3](type3.png)
 ![type4](type4.png)
 */
/*
 static 선언      : 서브클래스에서 오버라이딩 허용
 class 키워드 선언  : 오버라이딩 허용
 */

enum Weekday: Int {
    case sun = 1, mon, tue, wed, thur, fri, sat
    
    static var today: Weekday {
        let cal = Calendar.current
        let today = Date() // 오늘날짜
        let weekday = cal.component(.weekday, from: today) // 요일 나타내는 정수 리턴
        return Weekday(rawValue: weekday)!
    }
}

Weekday.today

