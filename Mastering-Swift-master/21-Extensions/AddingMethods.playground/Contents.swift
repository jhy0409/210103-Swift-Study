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
 # Adding Methods
 */
/*
 익스텐션으로 메소드를 추가하는 코드

 - Double 형식에 화씨/섭씨 온도 변환 메소드 추가
 - Date 형식에 문자열 포멧팅 메소드 추가
 - String 형식에 랜덤 문자열 생성 메소드 추가
 */

extension Double {
    // 인스턴스 메소드
    func toFayrenheit() -> Double { // 섭씨 -> 화씨 변환
        return self * 9 / 5 + 32
    }
    
    func toCelsius() -> Double { // 화씨 -> 섭씨
        return (self - 32) * 5 / 9
    }
    
    // 타입 메소드
    static func converToFahrenheit(from celsius: Double) -> Double {
        return celsius.toFayrenheit() // 섭F -> 화C
    }
    
    static func converToCelsius(from fahrenheic: Double) -> Double {
        return fahrenheic.toCelsius()
    }
}

let c = 30.0
c.toFayrenheit()
Double.converToFahrenheit(from: 30.0)

// 날짜를 문자열로 formatting
extension Date {
    func toString(format: String = "yyyyMMdd") -> String {
        let privateFormatter = DateFormatter()
        privateFormatter.dateFormat = format
        return privateFormatter.string(from: self)
    }
}
let today = Date()
today.toString()
today.toString(format: "MM/dd/yyyy")

extension String { // 지정된 길이로 생성된 랜덤문자열 생성하는 메소드
    static func random(length: Int, charactersIn chars: String = "abcdefghijklmnopqrstuvwxyzGHIJKLMNOPQRSTUVWXYZ0123456789") -> String {
        var randomString = String() // == ""
        randomString.reserveCapacity(length) // 메모리 확보
        // print("rndStr length = \(randomString.count)")
        
        for _ in 0 ..< length {
            guard let char = chars.randomElement() else {
                continue
            }
            randomString.append(char)
        }
        return randomString
    }
}

String.random(length: 5)
