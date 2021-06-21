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
 # Value Types and Reference Types
 ![val-ref](val-ref.png)
 */
/*
 값 형식, 참조형식 차이
 
 1. 값형식
 - 스트럭쳐
 - 열거형
 - 튜플
 - 컬렉션
 
 2. 참조형식
 - 클래스
 - 클로저
 */

struct PositionValue { // 선언과 동시에 기본값 저장
    var x = 0.0
    var y = 0.0
}

class PositionObject {
    var x = 0.0
    var y = 0.0
}

var v = PositionValue()
var o = PositionObject()
v.x
v.y
o.x
o.y

var v2 = v // 같은 값 가진 복사본
var o2 = o
v2.x
v2.y
o2.x
o2.y

v2.x = 12
v2.y = 34

v.x
v.y
v2.x
v2.y

o2.x = 12
o2.y = 34

// 참조형식 : 복사본 생성하지 않고 인스턴스 저장된 메모리 주소 전달
o.x
o.y

o2.x
o2.y
/*
 1. 값형식 사용
 - 적은데이터 저장, 상속이 필요없을 때
 - 값 전달시점마다 복사본 필요
 
 2. 열거형 : 연관된 상수그룹
 3. 튜플  : 코드 내 한번만 사용(나머지 다 구조체로)
 4. 클래스 : 상속, 참조 전달해야하는 경우
 */
