import UIKit

// argument label
//var greeting = "테스트 일자 210706"
//func test1(label l: String) {
//    print("전달된 값은 : \(l)")
//}
//test1(label: greeting)

/*
 숫자와 제곱회차 받아서 입력숫자 n승하기
 
 // ----- 1. if, else if
 func nJegob(num: Int, nth: Int) {
 var nSwung = num * num
 let msg = "nJegob Func 1: "
 if nth == 0 {
 nSwung = 1
 print(msg + "\(nSwung)")
 } else if nth == 1 {
 nSwung = num
 print(msg + "\(nSwung)")
 } else if nth == 2 {
 print(msg + "\(nSwung)")
 } else if nth >= 3 {
 for _ in 3...nth {
 nSwung *= num
 }
 print(msg + "\(nSwung)")
 }
 else {
 print("invalid")
 return
 }
 }
 
 // ----- 2. switch
 func nJegob2(num: Int, nth: Int) {
 var nSwung = num * num
 switch nth {
 case 0:
 nSwung = 1
 case 1:
 nSwung = num
 case 2:
 nSwung = num * num
 case 3...:
 for _ in 3...nth {
 nSwung *= num
 }
 default:
 print("invalid")
 return
 }
 print("nJegob Func 2: \(nSwung)")
 }
 
 nJegob(num: 10, nth: -3)
 nJegob2(num: 10, nth: -3)
 */

/*
 // fastcamp chapter 5-5 실습
 func printFullName(lastName: String, firstName: String) {
 let fullName = lastName + firstName
 print("이름은 \(fullName) 입니다.")
 }
 
 func printFullName(_ lastName: String, _ firstName: String) {
 let fullName = lastName + firstName
 print("이름은 \(fullName) 입니다.")
 }
 
 func returnFullName(_ lastName: String, _ firstName: String) -> String {
 let fullName = lastName + firstName
 return fullName
 }
 
 printFullName("홍", "길동")
 printFullName(lastName: "가", firstName: "나다")
 let firstName = "변수 " + returnFullName("라", "마바")
 print(firstName)
 */

// chapter 5-6 inout
//var value = 3
//func incrementNum(_ value: inout Int) {
//    value += 1
//    print(value)
//}
//incrementNum(&value)
//value

// chapter 5-7 함수를 파라미터로 넘기기, 변수에 할당
//func add(_ a: Int, _ b: Int) -> Int {
//    return a + b
//}
//func substract(_ a: Int, _ b: Int) -> Int {
//    return a - b
//}
//var function = add
//function(4, 2) // print 6
//function = substract // print 2
//function(4, 2)
//
//func printResult(_ function: (Int, Int) -> Int, _ a: Int, _ b: Int) {
//    let result = function(a, b)
//    print(result)
//}
//printResult(add, 10, 5)
//printResult(substract, 10, 5)

// chapter 5-8 옵셔널, optional
