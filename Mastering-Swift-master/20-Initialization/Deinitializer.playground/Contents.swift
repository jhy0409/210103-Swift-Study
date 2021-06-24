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
 # Deinitializer
 ![deinit](deinit.png)
 */
/*
 소멸자 : 인스턴스 메모리 제거되기 전 부가 정리작업 구현위해 사용
 
 - 사용   : 클래스 전용
 - 파라미터, 리턴 X
 - 개수   : 1개로 제한
 - 호출   : 직접호출 X, 인스턴스가 메모리 제거되기 전 자동호출
 - 별도코드 미구현 시 자동 제공
 */
class Size {
   var width = 0.0
   var height = 0.0
}

class Position {
   var x = 0.0
   var y = 0.0
}

class Rect {
   var origin = Position() // 인스턴스
   var size = Size() // 인스턴스
    
    deinit { // 인스턴스 : 소멸자 실행 완료 전까지 메모리 유지
        print("deinit \(self)")
    }
}

/*
 ARC : 스위프트 메모리 관리모델
 - 클래스가 사용한 모든 메모리 자동 제거
 
 [ deinit 소멸자 사용용도]
 - 파일, 네트워크 연결같은 자동제거되지 않는 리소스 제거
 - 인스턴스 해제 확인하는 등 디버깅 용도로 사용
 */
var r: Rect? = Rect()
r = nil // 메모리에서 제거됨
// 인스턴스 제거시점 -> 속성에 나머지 인스턴스 함께 제거됨 = Position(), Size()
