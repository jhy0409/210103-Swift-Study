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


import Foundation

/*:
 # Required Initializer
 ![required](required.png)
 */
/*
 필수 생성자 : 부모클래스 name: String받는 생성자 직접 구현할 때
 */
class Figure {
    var name: String
    
    required init(name: String) { // 서브클래스에서 동일한 생성자 직접 구현해야 함
        self.name = name
    }
    
    func draw() {
        print("draw \(name)")
    }
}

class Rectangle: Figure {
    var width = 0.0
    var height = 0.0 // 기본값 있고 부모클래스 상속 -> 부모클래스 생성자 상속받음, *
    
    init() { // * 안받기 위해 기본생성자 축
        width = 0.0
        height = 0.0
        super.init(name: "unknown")
    }
    
    required init(name: String) { // 슈퍼클래스와 동일한 형태로 구현해야함 -> rect클래스 상속받는 서브클래스에도 동일한 형태의 required생성자 구현하도록 하기위해
        width = 0.0
        height = 0.0
        super.init(name: name)
    }
}


