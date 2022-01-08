import UIKit

//var greeting = "Hello, playground"
var str: String = "app/webroot/uploads/61d6db121e4e31black.mp4"
var arr: [String] = str.components(separatedBy: ["/"])

let forPrint = arr.last == nil ? "" : arr.last!
print(forPrint)
