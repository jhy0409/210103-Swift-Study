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
 # continue
 */
// 무엇을 종료하고 계속하는지 구분, break= switch, 반복문에서 사용
// continue는 반복문에서만 사용

// for in, while동일하게 작동

for index in 1...10 {
    
    if index % 2 == 0 {
        continue
        // 문장은 실행하고 다음 반복회차 실행함, 현재의 반복을 종료 -> 다음 반복을 실행
    }
    print(index)
}


// 반복문 중첩
for i in 1...10 {
    print("OUTER LOOP", i)
    
    for j in 1...10 {
        if j % 2 == 0 {
            continue
            // 바깥 반복문은 영향없이 가장 인접한 문장에 영향을 줌(반복문을 종료)
        }
        print(" inner loop", j)
    }
}











