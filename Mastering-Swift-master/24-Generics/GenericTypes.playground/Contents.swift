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
 # Generic Types
 ![generic-type](generic-type.png)
 */
/*
 제네릭 타입을 선언하고 형식 내부에서 사용하는 다양한 형식을 타입 파라미터로 대체하는 방법을 공부합니다.
 
 - 제네릭 타입
 - 형식 표기 방식
 - 익스텐션으로 제네릭 타입 확장
 - 확장 대상 제한
 
 컬렉션 - 모두 구조체(-> Generic Type)로 구현되어 있음
 컬렉션 동일형식 값만 저장ㅇ
 
 [ 선언문법 ]
 - 기존형식에 타입 파라미터 추가
 - 형식제약문법 동일
 - 타입파라미터로 대체 가능 (속성 자료형, 파라미터, 리턴형)
 */

struct Color<T> {
    var red: T
    var green: T
    var blue: T
}

var c = Color(red: 128, green: 80, blue: 200)
let d: Color<Int> // 값 추론할 수 없으므로 타입 파라미터 형식 직접 지정
// = Color(red: 128.0, green: 80.0, blue: 200.0)

//let arr: [Int]
let arr: Array<Int>
let dict: Dictionary<String, Double>

// 형식에서 선언한 타입파마리터 이름 수정 불가능
extension Color where T == Int { // Int에만 지정
    //extension Color where T: FixedWidthInteger { // 형식제한
    
    // 제네릭 타입 확장식 타입파라미터 형식이름(Color) 뒤 추가X
    func getComponents() -> [T] {
        return [red, green, blue]
    }
    // 형식제한 : 확장대상 제한
}

let intColor = Color(red: 1, green: 2, blue: 3)
intColor.getComponents()

let dbColor = Color(red: 1.0, green: 2.0, blue: 3.0)
/*
 c에 저장할 수 없는 이유
    - 컴파일러 = 타입 파라미터에 맞는 코드 자동생성,
    - int, double일 때 각각 만들어지고 별도형식으로 처리되기 때문
 */
//dbColor.getComponents()
