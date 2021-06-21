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
 # Associated Values
 ![associated-values](associated-values.png)
 */
//enum VideoInterface: String {
//    case dvi = "1028X768"
//    case hdmi = "2048X1536"
//    case displayPort = "3840X2160"
//}

// 연관값 : 새로운 열거형값 생성할 때 사용

enum VideoInterface {
    case dvi(width: Int, height: Int)
    case hdmi(Int, Int, Double, Bool)
    case displayPort(CGSize)
}

var input = VideoInterface.dvi(width: 2048, height: 1536)

switch input {
case .dvi(2048, 1536):
    print("dvi 2048 X 1536")
case .dvi(2048, _): // 너비만 매칭
print("dvi 2048 X Any")
case .dvi: // 연관값 무시 케이스만 매칭
    print("dvi")
case .hdmi(let width, let height, let version, var audioEnabled):
    print("hdml \(width) x \(height)")
case let .displayPort(size):
    print("dp") // 모든 연관값 동일형태로 바인딩(=let)
}

input = .hdmi(3840, 2160, 2.1, true)
