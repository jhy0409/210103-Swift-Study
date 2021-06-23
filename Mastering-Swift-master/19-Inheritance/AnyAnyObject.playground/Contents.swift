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
 # Any, AnyObject
 */
/*
 범용 자료형
 
 장점 : 코드 유연성 높임
 단점 : 코드 가독성 낮아짐, 유지보수 어려움 > 잘 사용안하는게 나음
 
 프레임워크에서 종종 사용됨
 1] Any : 모든형식, 값-참조형식 가능
 2] AnyObject : 모든 클래스 형식, 참조형식만 저장
 */

var data: Any = 1 // 형식 관계없이 모든 값 저장
data = 2.3
data = "str"
data = [1, 2, 3]
data = NSString()

var obj: AnyObject = NSString()
//obj = 1

/*
 Type-Erasing Wrapper || Type Erased Wrapper 자주 사용되진 않음
 뜻 : 형식정보가 지워졌다 -> 속성이나 메소드 제공 불가능 -> 타입캐스팅 필요
 ex) string.count 접근 불가능
 
 Any, AnyObject = 형식에 대한 정보 없음
 인스턴스 사용시 타입캐스팅 필요
 */

if let str = data as? String { // String <-> NSString 호환가능, 캐스팅 성공
    print("if-let사용, 타입캐스팅 str의 길이 = \(str.count)")
} else if let list = data as? [Int] { // 배열일 때
}

/*:
 # Type Casting Pattern
 */
switch data {
case let str as String: // 값 매칭시 상수로 바인딩 됨
    print("str is String type : 문자열길이는 = \(str.count)")
case let list as [Int]:
    print(list.count)
case is Double:
    print("Double Value")
default:
    break
}

// 범행용식으로 저장됐거나 업캐스팅된 인스턴스 매칭시 사용
