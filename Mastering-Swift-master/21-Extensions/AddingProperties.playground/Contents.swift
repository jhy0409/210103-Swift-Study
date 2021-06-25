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
 # Adding Properties
 */
/*
 extension - 속성 추가 : 계산속성으로 제한
 
 [추가 불가능]
 - 저장속성
 - 프로퍼티 옵저버(속성감시자)
 - 형식에 존재하는 속성 오버라이딩
 */

extension Date {
    var year: Int {
        let cal = Calendar.current
        return cal.component(.year, from: self) // self : 속성내부 날짜 인스턴스 접근
    }
    
    var month: Int { // 과제
        let cal = Calendar.current
        return cal.component(.month, from: self)
    }
    
    var weekday: String {
        let cal = Calendar.current
        let wdN = cal.component(.weekday, from: self)
        print(wdN)
        let yoil = getWeekday(wdN: wdN)
        return yoil
    }
    
    func getWeekday(wdN: Int) -> String {
        let yoilKR = [ "","일", "월", "화", "수", "목", "금", "토"]
        var returnYoil: String = ""
        switch wdN {
        case 1:
            print(wdN)
            returnYoil = yoilKR[1]
        case 2:
            print(wdN)
            returnYoil = yoilKR[2]
        case 3:
            print(wdN)
            returnYoil = yoilKR[3]
            
        case 4:
            print(wdN)
            returnYoil = yoilKR[4]
        case 5:
            print(wdN)
            returnYoil = yoilKR[5]
        case 6:
            returnYoil = yoilKR[6]
        case 7:
            returnYoil = yoilKR[7]
        default:
            break
        }
        return returnYoil
    }
}

let today = Date()

today.year
today.month
today.weekday

/*
 let date = NSDate() // 현재 시간 가져오기
 let formatter = DateFormatter()
 formatter.locale = Locale(identifier: "ko") // 로케일 변경
 formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEEE"
 print("현재시간: " + formatter.string(from: date as Date))
 */

extension Double {
    var radianValue: Double {
        return (Double.pi * self) / 180.0
        // self : double형식에 저장된 실수 접근
    }
    
    var degreeValue: Double { // radian -> degree
        return self * 180.0 / Double.pi
    }
}

let dv = 45.0
dv.radianValue
dv.radianValue.degreeValue
// 같은 double형이므로 연달아 호출 가능
