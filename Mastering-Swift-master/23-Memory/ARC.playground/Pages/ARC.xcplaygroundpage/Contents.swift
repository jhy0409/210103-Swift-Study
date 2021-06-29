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
 # Automatic Reference Counting
 */
/*
 Swift의 메모리 관리 모델인 ARC에 대해 공부합니다.

 - 메모리 관리 모델
 - 소유 정책
 - 참조 카운트
 - 강한 참조
 
 ========================================================
 [ 메모리 제거 ]
 자동제거항목 별도관리 불필요        - 스택에 저장된 메모리
 직접제거 필요(필요하지 않은 시점에서) - Heap 저장 메모리
 
 메모리 관리모델 : 힙에 저장된 데이터를 관리, 클래스 인스턴스 메모리 관리
 
 ========================================================
 [ 메모리 관리모델 ]
 
 1. Objective-C
    - MRC (특별한 경우가 아닌이상 사용빈도가 낮은편)
    - ARC
 
 2. Swift
    - ARC
 
 ========================================================
 [ 소유정책, 참조카운트 ]
 
 1] Ownership Policy(소유정책)*
    인스턴스 하나이상 소유자 있는경우 메모리 유지, 소유자 없으면 메모리에서 제거
 
 2] Reference Count(참조 카운트)*
    제거시점 파악하기위해 저장하는 소유자 수
 
 인스턴스는 참조카운트 수가 1 이상이면 메모리 유지, 카운트가가 0이면 메모리에서 제거
 
 ex)
 var p1 = Person()
    - p1(var)        : owner
    - Instance count : 1
 
 var p2 = p1
 - p1, p2(var)    : owner
 - Instance count : 2
 
 - 인스턴스 소유위해서는 특별한 메시지 전해야함 -> 코드레벨 = 인스턴스 제공하는 retain(리테인메소드) 호출과 같음
 - 인스턴스 불필요시 소유권 포기 -> release메소드 호출 시 2]가 1 감소함
 
 ========================================================
 [ MRC 와 ARC ]
 MRC (Manual Reference Counting)
     - 소유정책 관련코드 전체 직접 구현해야함
     - 안정성 낮고, 디버깅 어려운 편
 
 ARC (Automatic Reference Counting)
     - 소유정책 자동 처리
     - 소유정책, 참조카운트 처리는 MRC와 동일
     - 관련코드 직접 구현하지 않아도 됨, 컴파일러가 메모리 관리코드 자동으로 추가
 
 ========================================================
 [ ARC가 사용하는 세가지 참조 ]
     1. Strong Reference (강한 참조)
        - 기본적으로 인스턴스와 소유자 연결 방법
 
     2. Weak Reference
     
     3. Unowned Reference
 */
class Person {
   var name = "John Doe"
   
   deinit {
      print("person deinit")
   }
}

var person1: Person?
var person2: Person?
var person3: Person?

person1 = Person()
person2 = person1
person3 = person1

// 인스턴스 소유할 때 리테인 메소드 호출, 컴파일러가 코드 분석 후 자동 추가
person1 = nil
person2 = nil // nil저장 = 소유권 포기와 같음, 강한참조 즉시 제거 참조카운트 1씩 감소
// person3이 참조 하고 있으므로 아직 메모리에서 제거되지 않았음

person3 = nil
// 참조카운트 0이 되는 시점에 소멸자 호출
