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
 # Raw Values
 ![Raw Values](raw-values.png)
 */
/*
 Raw Values // 원시값
 */
enum Alignment: Int {
    case left
    case right = 100
    case center
}
Alignment.left.rawValue
Alignment.right.rawValue
Alignment.center.rawValue
// Alignment.left.rawValue = 10 // immutable, 선언이후 원시값 저장 불가능

Alignment(rawValue: 0)
Alignment(rawValue: 200)
enum Weekday: String {
    case sun
    case mon = "Monday"
    case tue
    case wedn, thur, fri, sat
}
Weekday.sun.rawValue
Weekday.mon.rawValue

enum ControlChar: Character { // 원시값이 캐릭터(문자)인 경우 반드시 값을 직접 지정해야함
    case tab = "\t"
    case newLine = "\n"
}

