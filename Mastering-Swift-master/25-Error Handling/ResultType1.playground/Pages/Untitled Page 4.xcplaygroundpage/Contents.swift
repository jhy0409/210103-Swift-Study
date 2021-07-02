//
//  Copyright (c) 2019 KxCoding <kky0317@gmail.com>
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
 # Result Type
 */
/*
 - Result 형식
 - 에러 처리 패턴
 
 스위프트 버전별 오류처리
 [ 1.x ]
    - objective-c와 동일방식으로 오류 처리
 
 [ 2.x ]
    - throwing method or function으로 선언
        - enum name: ErrorType { case ... } // 에러형식 프로토콜 채용형식으로 선언
        - func name() throws { ... }
        - do { try methodName() } catch { ... }
 */
enum NumberError: Error {
   case negativeNumber
   case evenNumber
}

enum AnotherNumberError: Error {
   case tooLarge
}

func process(oddNumber: Int) throws -> Int { // throwing func, 홀수만 처리하는 함수
   guard oddNumber >= 0 else { // 음수일 때
      throw NumberError.negativeNumber
   }
   guard !oddNumber.isMultiple(of: 2) else { // 홀수이다(-> !2의배수)
      throw NumberError.evenNumber
   }
    guard oddNumber < 1000 else {
        throw AnotherNumberError.tooLarge
    }
   return oddNumber * 2
}

//do {
//   let result = try process(oddNumber: 10001)
//   print(result)
//} catch let myErr as NumberError {
//    //print(error.localizedDescription)
//    // 실제 에러형식 아닌 에러프로토콜 형식으로 전달됨
//
//    switch myErr {
//    case .negativeNumber:
//        print("negative Number")
//    case .evenNumber:
//        print("even Number")
//    }
//} catch {
//    print(error.localizedDescription)
//    /*
//    - 에러처리에서 논리적 오류 발생가능성 높아짐
//      (컴파일러가 새로운형식의 에러 추가된것 인식하지 못해서)
//
//    - 마지막 catch문 주석처리시 :
//        - 넘버 외 다른형식일 때 런타임에러
//        - 코드 안정성 낮아짐, 컴파일시점 문제파악 할 수 없기때문
//     */
//}

/*
 Result :
    - 제네릭 열거형
 - Success case에 저장할 수 있는 케이스는 제한 없음
 
 - Failure case는 에러형식만 저장할 수 있음
   여기서 에러형식 명확히 선언하므로 형식 모호함 없어짐
   제네릭으로 선언 : 형식이 명확하다는 것
 
   작업성공하면 success case에 작업이 저장됨
   작업실패 시 failure case에 에러가 저장
   쓰로잉 클로저로 초기화하는 생성자 제공
 */


// 기존코드 수정하지않고 result형식으로 처리가능
//result 변수에 열거형인 Result 인스턴스 저장됨
//스위치문으로 처리가능 -> success, failure case 가지고 있음
let result = Result { try process(oddNumber: 1)}

switch result { // Delayed Error Handling
case .success(let data):
    print("success result : \(data)")
case .failure(let error):
    print(error.localizedDescription) // 전달된 에러 연관값을 통한 사용
}

// 에러 직접 던지는 것 아닌 연관값으로 리턴
func processResult(oddNumber: Int) -> Result<Int, NumberError> { // throwing func, 홀수만 처리하는 함수
   guard oddNumber >= 0 else { // 음수일 때
    return Result.failure(.negativeNumber)
   }
   guard !oddNumber.isMultiple(of: 2) else { // 홀수이다(-> !2의배수)
    return .failure(.evenNumber)
   }
//    guard oddNumber < 1000 else { // 실패시 NumberError로만 리턴하므로 주석
//        return .failure(Failure)
//    }
    return .success(oddNumber * 2)
} // 성공, 실패 열거형으로 리턴, 에러 : 실제 결과 사용시점에 처리

let result2 = processResult(oddNumber: 1)
// Delayed Error Handling : 에러처리 시점 = 함수 호출 -> 작업결과 확인시점
switch result2 {
case .success(let data):
    print("success result : \(data)")
case .failure(let error):
    print(error.localizedDescription) // 전달된 에러 연관값을 통한 사용
}

// 성공한 경우만 처리하고 싶을 때 get메소드 활용
// 작업 성공한 경우에만 if블록 실행
if let result = try? result2.get() {
    print(result2)
}
/*
 throwing func : 어떤형식 에러 던지는지 파악 어려움
 result형식 사용
 
 [ 장점 ]
     - 에러형식 명시적으로 선언됨
     - 컴파일 타임에 에러형식 정확히 인식ㅇ -> 형식안정성 보장
     - 타입캐스팅 없이 에러 처리ㅇ
     - 형식추론으로 에러코드 더 단순하게 작성가능
     - 작업결과 성공, 실패로 명확히 구분하여 처리 가능
     - 완전 대체하는건 아니고 에러처리 방식이 더 다양해진 것
 */
