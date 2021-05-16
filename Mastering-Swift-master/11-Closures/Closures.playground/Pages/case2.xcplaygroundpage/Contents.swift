//: [Previous](@previous)

import Foundation

print("Start")


DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
    print("end")
})

DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
    print("end")
}
