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
 # Method Requirements
 ![method](method.png)
 */
/*
 프로토콜에서 메소드를 선언하고 형식에서 요구사항을 구현

 - mutating 메소드 선언
 - static 키워드와 class 키워드
 
 [프로토콜 메소드 작성]
 - 메소드 헤드만 작성
 - 타입메소드  : static키워드 추가
 - mutating : 프로토콜을 값형식이 채용, 메소드 내부에서 속성값 변경
    -> 꼭 값형식 전용이란게 아니라 메소드에서 속성을 변경할 수 있어야 한다.
       참조형식에서도 문제없이 사용 가능
 */

protocol Resettable {
    static func reset()
}

class Size_C: Resettable {
    var width = 0.0
    var height = 0.0

    func reset() { // 메소드 이름, 파라미터 형식, 리턴형 일치, 메소드 바디는 자유롭게 구현
        width = 0.0
        height = 0.0
    }
    
    class func reset() { // 타입형식, 오버라이딩 가능
    }
}

/*
 struct Size: Resettable {
 var width = 0.0
 var height = 0.0
 
 mutating func reset() { // 메소드 이름, 파라미터 형식, 리턴형 일치, 메소드 바디는 자유롭게 구현
 width = 0.0
 height = 0.0
 }
 // mutating : 값형식 인스턴스에서 속성값 바꾸기 -> 프로토콜에서도 mutating 추가해야함
 }
 */
