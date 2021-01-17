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
 # break
 */
let num = 1

switch num {
case 1...10:
    print("begin block")
    
    if num % 2 != 0 {
        break //switch문 종료, 제어를 이어지는 코드로 전달
    }
    
    print("end block")
default:
    break
}

print("done")
print()

for index in 1...10 {
    print(index)
    
    if index > 1{
        break
    }
};print()

for i in 1...10 {
    print("OUTER LOOP", i)
    
    for j in 1...10 {
        print("  inner loop", j)
        
        if j > 1 {
            break //문장 중첩시 가장인접한 문장을 중지함, 안쪽 2번실행, 바깥 10번반복
        }
    }
}
