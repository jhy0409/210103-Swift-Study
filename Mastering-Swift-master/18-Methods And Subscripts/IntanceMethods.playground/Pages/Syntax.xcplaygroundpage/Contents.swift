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
 # Instance Method
 ![Method](method.png)
 ![Call Method](call-method.png)
 */
/*
 인스턴스 메소드 : 클래스, 구조체, 열거형에서 구현
 인스턴스와 연관된 동작 구현
 */

class Sample {
    var data = 0
    static var sharedData = 123
    
    func doSomeThing() {
        print("\(#function)")
        print("data : \(data)")
        Sample.sharedData // 인스턴스 메소드에서 타입멤버의 접근
    }
    
    func call() {
        print("\n\(#function)")
        doSomeThing()
    }
}

let a = Sample()
a.data
a.doSomeThing()
a.call()

class Size1 {
    var width = 0.0
    var height = 0.0
    
    func enlarge() {
        width += 1.0
        height += 1.0
    }
}

let s_class = Size1()
s_class.width
s_class.height

s_class.enlarge()
s_class.width
s_class.height

struct Size2 {
    var width = 0.0
    var height = 0.0
    
    mutating func enlarge() { // mutating : 구조체에서 속성변경 위함
        width += 1.0
        height += 1.0
    }
}

var s_struct = Size2() // 값형식 : 인스턴스의 가변성 -> 멤버의 가변성에 영향 줌
s_struct.width
s_struct.height

s_struct.enlarge()
s_struct.width
s_struct.height
