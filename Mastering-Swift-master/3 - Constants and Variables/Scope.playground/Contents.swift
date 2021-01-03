//
//  Copyright (c) KxCoding <kky0317@gmail.com>
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

/*:
 # Scope
 */

// #1, 글로벌 스코프
let g1 = 123
//l1

func doSomething() {
   // #3, 로컬 스코프------------------------------------
    let l1 = 1233
    let g1 = 456
    g1
    g2
    
   if true {
   // #4, 로컬 스코프, 3!=4, 3==5-------------------------
    l1
    let l3 = 1235
    //l2 선언 전이라 사용 불가능
    g1
   }
   
   // #5----------------------------------------------
    // l3 = if true 범위를 벗어나서 사용 불가능
    let l2 = 1234
    
}


// #2, 글로벌 스코프--------------------------------------
let g2 = 234
g1
g2

struct Scope {
   // #6
   
    
   func doSomething() {
      // #7
    g1
    g2
   }
}

doSomething()
