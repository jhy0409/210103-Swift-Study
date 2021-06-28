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
 # Value Types & Reference Types
 */
/*
 값 형식과 참조 형식이 메모리에 저장되는 방식
 
 1. Value Type : 값 형식
     ㄱ. Structure
     ㄴ. Enumeration
     ㄷ. Tuple
 
 2. Reference Type
     ㄱ. Class
     ㄴ. Closure
 */
struct SizeValue {
   var width = 0.0
   var height = 0.0
}

var value = SizeValue()


var value2 = value // 복사본이 저장됨, 서로 다른 메모리에 저장된 개별 인스턴스
value2.width = 1.0
value2.height = 2.0

value
value2
// 값형식 : Stack에 저장, 값 전달할 때마다 새로운 복사본이 생성됨
// Copy on write : 값 변경시에만 실제 복사되도록 최적화


class SizeObject {
   var width = 0.0
   var height = 0.0
}

var object = SizeObject()
/*
 - stack, heap 새로운 메모리 공간 생성
 
 - 저장
    -> heap : 인스턴스, stack : heap 메모리 주소
 
 - object변수 : [인스턴스] - 연결 - [스택에 생성된 메모리]
 - 항상 스택을 거쳐 접근 (값형식과 달리 인스턴스 바로 접근할 수 없음)
 */
var object2 = object
/*
 Heap :
    - 새로운 메모리 복사나 인스턴스 생성되지는 않음
    - 값 전달시 스택에 있는 heap메모리 주소가 복사됨
 */
object2.width = 1.0
object2.height = 2.0

object
object2

let v = SizeValue() // let에 저장시 모든 형식이 상수, 변경불가능

let o = SizeObject()
o.width = 1.0
o.height = 2.0
/*
 메모리 주소를 바꿀 수 없게 제한 -> 상수가 참조하는 "인스턴스" 바꿀수 없으나
 heap 영역에서 인스턴스 속성값은 자유롭게 변경가능
 
 비교, 항등연산자(==, !=)
    - 값형식 비교시    : 스택 저장된 값 비교
 
    - 참조형식 비교시
        ㄱ. 힙에 저장된 값 비교(=형식 관련없이 실제값 비교)
        ㄴ. 주소를 따로 저장하므로 주소 비교하는 방법도 필요
        ㄷ. 스택에 저장된 주소 비교시 항등연산자 사용
 */
