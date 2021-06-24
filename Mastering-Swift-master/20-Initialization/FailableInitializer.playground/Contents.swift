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
 # Failable Initializer
 ![failable](failable.png)
 */
/*
 초기화 실패 허용
 
 초기화 실패를 옵셔널로 처리하는 방법
 앞의 예 : Nonfailable Initializers (실패 미허용 생성자)
 
 파일이 있을 때 초기화 하는경우
 - 초기화 실패 허용 -> nil
 - Failable initializer : 생성자의 옵셔널버전
 
 초기화 상태
 - 성공 : 옵셔널 형태의 초기화된 인스턴스
 - 실패 : nil
 */
struct Position {
   let x: Double
   let y: Double
    
    init?(x: Double, y: Double) {
        guard x >= 0.0, y >= 0.0 else { return nil } // 초기화 실패 및 종료
        
        self.x = x
        self.y = y
    }
    
    init!(value: Double) {
        guard value >= 0.0 else { return nil }
        //self.x = value
        //self.y = value
        self.init(x: value, y: value) //  failable or NonF 생성자 호출 가능
        
    }
    /*
     // 생성자 오버로딩, failable <-> NonF~ 구분 없음
     
     // NonF 생성자 오버라이딩
     init(value: Int) {
     //self.x = Double(value)
     //self.y = Double(value)
     // NonF는 컴파일타임에 결과가 나와야 해서 !만 호출가능, 단 크래시 발생하므로 사용 비권장
     self.init(value: <#T##Double#>) // init!(~) { ... }
     }
     */
}


/*
 failable initializer의 상속 super -> sub에서
 - 1) F -> F 또는 2) F -> NF로 구현가능
    - 2)일때 상위구현 호출할 때 강제추출 연산자 사용해야함
 */

var a = Position(x: 12, y: 34)
a?.x
a?.y

a = Position(x: -12, y: 0)

//var b = Position(value: 12)
//b?.x
//b?.y

 var b: Position = Position(value: 12)
// 변수저장 시점에 자동 언래핑, Non-Optional Type
b

//b = Position(value: -12)
// 옵셔널에 저장시 자동 추출되지 않음
// IUO구현이 변경됨, 원래는 앱 크래시 발생했지만 현재는 옵셔널과 동일형식으로 처리

/*
 IUO 특징: 값이 자동으로 추출된다.
 - 변수 바로 저장할 때 옵셔널 형식일 시 자동으로 추출되지 않고 실패시 nil리턴
 
 ! : iuo리턴, 처리방식 이해하고 있어야함
 초기화 실패시 크래시 발생
 */
