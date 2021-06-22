//
//  Mastering Swift
//  Copyright (c) KxCoding <help@kxcoding.com>
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
 # Dynamic Member Lookup
 */
/*
 점문법으로 서브스크립트에 접근하는 단축문법을 구현
 파이썬 호환위해 도입된 문법
 */
@dynamicMemberLookup
struct Person {
    var name: String
    var address: String
    
    // [고정] argument lable : dynamicMember, 파라미터 유형: String
    // 리턴형은 자유롭게 가능
    subscript(dynamicMember member: String) -> String {
        switch member {
        case "nameKey":
            return name
        case "addressKey":
            return address
        default:
            return "n/a"
        }
    }
}

let p = Person(name: "James", address: "seoul")
p.name
p.address

p[dynamicMember: "nameKey"]
p[dynamicMember: "addressKey"]

p.nameKey // 점문법으로 서브스크립트 접근 단축문법 제공
p.addressKey
p.missingKey

//대상 접근시점 : 런타임
//자동완성 제공 불가 :컴파일 시점 접근가능한 subscript판단 X
//- 장점 : 유연성, - 단점 : 가독성, 유지보수
 
