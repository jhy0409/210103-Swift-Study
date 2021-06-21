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
 # Stored Properties
 ![syntax](syntax1.png)
 */
// 저장 속성
/*
 (저장)속성 : 형식 내부에 변수와 상수를 선언, 인스턴스에 속한 속성
 - 클래스, 구조체에서 선언 가능
 
 - var : 변수 저장속성
 - let : 상수 저장속성
 */

class Person {
    var name: String = "class - John Doe"
    //let name: String = "class - John Doe"
    var age: Int = 10
}

struct Person2 {
    let name: String = "struct - John Doe"
    var age: Int = 12
}


/*:
 # Explicit Member Expression
 ![syntax](syntax2.png)
 */
let p1_class = Person()
var p_struct = Person2()
// let p_struct = Person2() // 구조체를 상수로 저장 -> 모든 속성이 let
p_struct.name
p_struct.age // 점문법(Dot Syntax), 명시적 멤버 표현식(Explicit Member Expression)

p_struct.age = 30
// p.name = "New Name" // 에러, let

p1_class.name
p1_class.age

p1_class.name = "class"
p1_class.age = 99

p1_class.name
p1_class.age

/*:
 # Lazy Stored Properties
 ![lazy](lazy.png)
 ![lazy-syntax](lazy-syntax.png)
 */
// 지연 저장속성
/*
 지연 초기화 : 속성 처음 접근시점에 초기화
 
 제한사항
 - 인스턴스 초기화 이후에 개별적으로 초기화되므로 변수 저장속성으로 선언
 - 생성자로 하지 않기 때문에 선언시점에 기본값 저장해야함
 */

struct Image {
    init() {
        print("new Image")
    }
}

struct BlogPost {
    let title: String = "Title"
    let content: String = "Content"
    lazy var attachment: Image = Image() // 표현식 리턴값이 속성과 동일할 시 함수나 연산자로 계산하는 코드도 가능
    
    let date: Date = Date()
    lazy var formattedDate: String = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .medium
        return f.string(from: date)
    }() // 클로저로 초기화 시점에서 다른값 접근 시 지연저장 속성으로 지정해야함
}

/*
 오버헤드 발생 : 파일 네트워크에서 이미지 가져온 다음 메모리 공간 복사
 속성에 접근하지 않으면 불필요한 메모리 사용
 */
var post = BlogPost()
post.attachment // let(오류) : 초기화 해야하는데 구조체 자체가 상수여서
post.formattedDate
