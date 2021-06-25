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
 # Adding Initializers
 */
extension Date {
    init?(year: Int, month: Int, day: Int) {
        let cal = Calendar.current // date component 구성
        var comp = DateComponents()
        comp.year = year
        comp.month = month
        comp.day = day
        
        guard let date = cal.date(from: comp) else { // 캘린더 인스턴스로 날짜 생성
            return nil
        }
        self = date
    }
}

Date(year: 2014, month: 4, day: 16)

// extension -> 원래있던 클래스에 생성자 구현 -> 반드시 간편생성자로 구현
extension UIColor {
    static var cntN = 0
    convenience init? (red: Int, green: Int, blue: Int) {
        var statusStr = ""
        if red > 255 || green > 255 || blue > 255 { // 입력값 유효성 검사
            statusStr = "[안내] 0~255사이의 값만 입력\n현재 입력된 값 ="
            Self.cntN += 1
            print( "\n시도회차 : \(Self.cntN) \n\(statusStr) r: \(red) / g: \(green) / b: \(blue)")
            return nil
        }
        let r = CGFloat(red) / 255
        let g = CGFloat(green) / 255
        let b = CGFloat(blue) / 255
        
        self.init(red: r, green: g, blue: b, alpha: 1.0)
        showRgbCGFloat_2f(r, g, b) // [정상실행] 색상값 출력
    }
    
    func showRgbCGFloat_2f(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> (sR: String, sG: String, sB: String) {
        let statusStr = "[정상실행] 색상값 ="
        let strR = String(format: "%.2f", r)
        let strG = String(format: "%.2f", g)
        let strB = String(format: "%.2f", b)
        Self.cntN += 1
        print("시도회차 : \(Self.cntN) \n\(statusStr) r(\(strR)) / g(\(strG)) / b(\(strB))")
        return (strR, strG, strB)
    }
}

UIColor(red: 0, green: 0, blue: 255)
UIColor(red: 0, green: 100, blue: 100)
UIColor(red: 0, green: 0, blue: 500)

// default, memberwise initializer
struct Size {
    var width = 0.0
    var height = 0.0
}

extension Size { // 별도로 확장하면 충돌이나 별도 생성자 추가없이 기본제공 생성자 사용가능
    init(value: Double) {
        width = value
        height = value
    }
}
Size()
Size(width: 12, height: 34)



