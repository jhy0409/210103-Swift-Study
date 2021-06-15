import UIKit

/*
 20년 12월 9일 자바수업 if문
 
 (원본링크)
 https://github.com/jhy0409/jhy0409/tree/main/3%20JavaClass/201209_if/src
 
 public class IF1 {
     public static void main(String[] args) {
         int num = 99;
         
         if (num < 100) {
             System.out.println("num가 100보다 작다.");
         }
     }
 }
 */

var num : Int = 99
if num < 100 {
    print("if 1.\nnum(\(num))은 100보다 작다.\n")
}


//public class IF2 {
//    public static void main(String[] args) {
//        int num = 200;
//        if (num < 100) {
//            System.out.println("num가 100보다 작다");
//            System.out.println("2줄이상 코딩 가능");
//        }
//        else {
//            System.out.println("num가 100보다 크다");
//        }
//    }
//}

num = 200
if num < 100 {
    print("if 2.\nnum(\(num))은 100보다 작다.")
    print("2줄이상 코딩 가능\n")
} else {
    print("if 2.\nnum(\(num))은 100보다 크다.\n")
}
