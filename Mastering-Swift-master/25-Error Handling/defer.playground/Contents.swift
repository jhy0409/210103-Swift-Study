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
 # defer Statements
 ![defer](defer.png)
 */
/*
 코드의 실행을 스코프가 종료되는 시점으로 연기
    - 용도 : 코드에서 사용했던 자원 정리할 때 활용
 */

func processFile(path: String) {
    print("1. 파일 읽고 처리중.")
    let file = FileHandle(forReadingAtPath: path)
    
    // process
    defer { // 해당블록 실행이 함수 종료시점까지 연기됨, (런타임오류로 인한 프로그램 비정상 종료경우 제외)
        print("2. 파일을 닫습니다.")
        file?.closeFile()
    }
    
    if path.hasSuffix(".jpg") { // 파일 닫지않은 상태에서 함수 종료
        // 파일 손상또는 파일접근하는 다른코드에서 에러 발생
        print("3. 함수실행 종료 : jpg가 포함된 파일경로 접근되었음")
        return
    }
    
    defer {
        print("5")
    }
    print("4")
}

// defer 주로 스코프 시작부분에 선언, 선언한다고 다 실행되는게 아님
// defer문 호출되어야 종료시점 코드가 예약 됨

//processFile(path: "file.swift")
processFile(path: "file.jpg")

print()
func testDefer() {
    defer {
        print(1)
    }
    defer {
        print(2)
    }
    defer {
        print(3)
    }
}

testDefer()
/*
 defer문 : 호출 순서대로 코드 예약함
 가장 마지막에 예약한 블록이 먼저 실행됨
 
 순서모르고 사용하면 논리적 오류 생길 수 있으므로
 특별한 이유없으면 하나의 디퍼문만 사용하는것이 좋음
 */
