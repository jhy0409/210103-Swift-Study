//
//  main.swift
//  201209_if_3_
//  Created by inooph on 2021/06/15.
//
//20년 12월 9일 자바수업 if문
//(원본링크)
//https://github.com/jhy0409/jhy0409/tree/main/3%20JavaClass/201209_if/src

import Foundation

//public class IF3 {
//    public static void main(String[] args) {
//        Scanner s = new Scanner(System.in);
//        System.out.print("숫자를 입력: ");
//        int num = s.nextInt();
//
//        if (num%2!=0) {
//            //if (num%2!=0) == if (num%2==1)
//            System.out.println("홀수입니다.");
//        }
//        if (num%2==0) {
//            System.out.println("짝수입니다.");
//        }
//        s.close();
//    }
//}

///*
print("숫자를 입력")
var inputData = Int(readLine()!)!
sHi(inputData)

func sHi(_ num: Int) -> (){
    if(num % 2 == 0) {
        print("num(\(num))은 짝수입니다.")
    }
    
    if(num % 2 != 0) {
        print("num(\(num))은 홀수입니다.")
    }
    //    guard var iData = Int(readLine()!) else { return }
}

