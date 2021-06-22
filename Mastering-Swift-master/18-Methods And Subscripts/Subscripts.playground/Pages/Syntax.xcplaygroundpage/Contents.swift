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
 # Subscripts
 ![subscript](subscript.png)
 */
/*
 서브스크립트 : [스퀘어브라켓 : 덱스, 키, 범위]
 */

let list = ["A", "B", "C"]
list[0]

/*:
 ![subscript-syntax](subscript-syntax.png)
 */
/*
 서브스크립트 구현
 
 [불가능]
 - 입출력 파라미터나 파라미터 기본값 지정 X
 - 서브스크립트로 값 받아야하므로 파라미터 생략 X
 - 리턴형 생략 불가능 (리턴값, 저장값이기 때문)
 
 생략 : 서브스크립트에서 값 저장 안할 때
 최소 get block은 있어야 함
 
 */

class List {
    var data = [1, 2, 3]
    
    subscript(i index: Int) -> Int {
        get {
            return data[index]
        }
        
        set {
            data[index] = newValue
        }
    }
}

var l = List()
l[i: 0]
l[i: 1] = 123
l.data

/*
 argument lable : 두개이상의 파라미터 선언, 파라미터 가독성 높일 때 제한적 사용
 */

// 구조체에서 서브스크립트 구현
struct Matrix {
    var data = [[1, 2, 3],
                [4, 5, 6],
                [7, 8, 9]]
    
    subscript(row: Int, col: Int) -> Int {
        return data[row][col]
    } // 읽기전용 서브스크립트, get {}생략 됨
}

let m = Matrix()
m[0,0]
// m[0,10]

// ---- index 유효값 검사, if & optional
struct Matrix2 {
    var data = [[1, 2, 3],
                [4, 5],
                [7, 8, 9, 10]]
    
    subscript(row: Int, col: Int) -> Int? {
        if row < data.count && col < data[row].count { // 행의개수, 열의개수 미만 3이면 0~2까지
            return data[row][col]
        } else { return nil }
    } // 읽기전용 서브스크립트, get {}생략 됨
}

let test = Matrix2()
test[0,4]
test[5,5]
test[2,3]
