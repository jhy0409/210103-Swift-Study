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
 # Closure Capture List
 */
/*
 클로저에서도 강한참조 사이클* 발생
 [ * 발생조건 ]
 - 클로저가 인스턴스 캡처
 - 인스턴스가 클로저를 강한참조 저장
 -> 인스턴스 정상해제 실패
 
 [ 해결방법 ]
 - 약한 참조
 - 비소유 참조
 */
class Car {
    var totalDrivingDistance = 0.0
    var totalUsedGas = 0.0
    
    /*
     lazy var gasMileage: () -> Double = { [ weak self ] in
     guard let strongSelf = self else { return 0.0 }
     return strongSelf.totalDrivingDistance / strongSelf.totalUsedGas
     }
     self : 인스턴스 자체를 나타내는 특별한 속성
     클로저에서 사용시 셀프가 나타내는 인스턴스 캡처됨
     클로저는 실행 종료할때까지 self를 강한참조로 캡처
     
     self의 인스턴스 -> 클로저 실행 완료될 때까지 메모리에서 미제거
     
     약한참조는 옵셔널 형식, 언래핑 사용 또는 옵셔널 체이닝으로 접근
     */
    
    
    // 비소유 참조
    lazy var gasMileage: () -> Double = { [ unowned self ] in
        return self.totalDrivingDistance / self.totalUsedGas
    }
    
    func drive() {
        self.totalDrivingDistance = 1200.0
        self.totalUsedGas = 73.0
    }
    
    deinit {
        print("car deinit")
    }
}

var myCar: Car? = Car()
myCar?.drive() // 클로저 실행되지 않음, 강한참조 사이클 미발생 시점
// myCar = nil

myCar?.gasMileage()
myCar = nil

/*:
 ![1](1.png)
 ![2](2.png)
 
 ## Value Type
 ![closurecapturelist-valuetype](closurecapturelist-valuetype.png)
 */
/*
 클로저 바디와 구분위해 in 키워드 생략 불가능
 
 [ 클로저 캡처 리스트 ]
 - 값만 캡처시 대상이름만 표기
 - 캡처 대상 [] 사이에 입력, 콤마(,)로 구분하여 나열
 - 값형식 캡처시 대상 이름만 저장
 */

var a = 0
var b = 0
let c = { [a] in print(a, b) } // 두 변수 캡처, 클로저에서 값 캡처시 복사아닌 참조 전달됨
// 값 형식 [ 사이에 ] 캡처대상 저장하면
// 참조대신 복사본 캡처함**

a = 1
b = 2
c() // [a] in -> 캡처시점에 저장된 값으로 출력됨** -> 0 2
/*:
 ## Reference Type
 ![closurecapturelist](closurecapturelist.png)
 */
/*
 참조형식 캡처 : 반드시 weak 또는 unowned 추가해야함
 - weak (약한참조) :
    - 옵셔널 형식 -> 셀프 접근시 언래핑 사용 또는 옵셔널 체이닝으로 멤버 접근
    - 클로저실행 완료되지 않은시점에서 캡처대상 해제될 수 있을때 사용
    - 카 인스턴스 해제직후 클로저 호출 -> self : nil
    -> 약한참조 : 캡처대상 해제된 경우도 고려해야함
 
 - unowned (비소유 참조) :
    - 비소유 참조로 캡처한 대상 : 클로저 실행 종료전 해제될 수 있음
    - 해제된 대상 접근시 런타임 오류 발생하므로 주의
    - 캡처대상 생명주기가 클로저와 같거나 더 긴 경우 주로 사용
 */
