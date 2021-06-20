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
import Foundation

/*:
 # Set
 ## Set Type
 ![set-type](set-type.png)
 */
/*
 집합 구현한 것 , 사용빈도 : 배열, 딕셔너리 > 셋
 정렬순서보다 검색속도 중요한 경우 배열대신 사용
 
 1. 정렬되지 않은 배열 형태로 사용
 2. 동일요소 형식 저장
 3. 동일 값 하나만 저장
 4. 검색빠른 이유 : 해싱 (요소 유효성, 빠른 검색위해 사용)
 
 set 은 배열리터럴 사용, 형식추론 사용 불가능
 */
let set: Set<Int> = [1, 2, 2, 3, 3, 3]
// let set: Set = [1, 2, 2, 3, 3, 3] // 자료형 생략 -> 요소의 자료형 생략가능
set.count


