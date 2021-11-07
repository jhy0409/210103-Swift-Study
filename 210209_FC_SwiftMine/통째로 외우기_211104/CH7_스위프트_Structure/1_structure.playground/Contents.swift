import UIKit

/*: ## N번째*/
// MARK: - [] 문제: 가장 가까운 편의점 찾기
    // 주어진 편의점 정보
//    let store1 = (x: 3, y: 5, name: "gs")
//    let store2 = (x: 4, y: 6, name: "seven")
//    let store3 = (x: 1, y: 7, name: "cu")
//    let stores = [store1, store2, store3]

    // func distance, current, target > ?
    
// Stores Array 세팅, 현재 내 위치 세팅
// printClosestStore 함수이용해서 현재 가장 가까운 스토어 출력하기

// MARK: - [] Improve Code
// - make Location struct
// - make Store struct

/*: ## N번째 - Class vs Structure 동작 차이 알아보기*/
class PersonClass {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

struct PersonStruct {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let pClass1 = PersonClass(name: "Jason", age: 5)
let pClass2 = pClass1
pClass2.name = "Hey"

pClass1.name
pClass2.name

var pStruct1 = PersonStruct(name: "Jason", age: 5)
var pStruct2 = pStruct1
pStruct2.name = "Hey"

pStruct1.name
pStruct2.name

/*: ## 3번째*/
// MARK: - [] 문제: 가장 가까운 편의점 찾기
    // 주어진 편의점 정보
let store1 = (x: 3, y: 5, name: "gs")
let store2 = (x: 4, y: 6, name: "seven")
let store3 = (x: 1, y: 7, name: "cu")
let stores = [store1, store2, store3]

    // func distance, current, target > ?
func distance(current: (x: Int, y: Int), target: (x: Int, y: Int)) -> Double {
    let distanceX = Double(target.x - current.x)
    let distanceY = Double(target.y - current.y)
    
    let distance = sqrt(distanceX * distanceX + distanceY * distanceY)
    return distance
}

func distance(current: Location, target: Location) -> Double {
    let distanceX = Double(target.x - current.x)
    let distanceY = Double(target.y - current.y)
    
    let distance = sqrt(distanceX * distanceX + distanceY * distanceY)
    return distance
}

// printClosestStore 함수이용해서 현재 가장 가까운 스토어 출력하기
func printClosetStore(currentLocation: (x: Int, y: Int), stores: [(x: Int, y: Int, name: String)]) {
    
    var closetStoreName = ""
    var closetStoreDistance = Double.infinity
    
    for store in stores {
        let distanceToStore = distance(current: currentLocation, target: (x: store.x, y: store.y))
        
        closetStoreDistance = min(closetStoreDistance, distanceToStore)
        
        if(closetStoreDistance == distanceToStore) {
            closetStoreName = store.name
        }
    }
    print("Closet store: \(closetStoreName)")
}

// Stores Array 세팅, 현재 내 위치 세팅
printClosetStore(currentLocation: (x: 2, y: 5), stores: stores)

// MARK: - [] Improve Code
// - make Location struct
struct Location {
    let x: Int
    let y: Int
}

// - make Store struct
struct Store {
    let loc: Location
    let name: String
    let isDeliveryRange = 2.0
    
    func isDeliverable(userLoc: Location) -> Bool {
        let distanceToStore = distance(current: userLoc, target: loc)
        return distanceToStore < isDeliveryRange
    }
}

func printClosetStore(currentLocation: Location, stores: [Store]) {
    var closetStoreName = ""
    var closetStoreDistance = Double.infinity
    var isDeliverable = false
    
    for store in stores {
        let distanceToStore = distance(current: currentLocation, target: store.loc)
        
        closetStoreDistance = min(closetStoreDistance, distanceToStore)
        
        if(closetStoreDistance == distanceToStore) {
            closetStoreName = store.name
            isDeliverable = store.isDeliverable(userLoc: currentLocation)
        }
    }
    print("Closet store: \(closetStoreName), deliverable: \(isDeliverable)")
}

let myLocation = Location(x: 2, y: 5)
let store3_1 = Store(loc: Location(x: 3, y: 5), name: "gs")
let store3_2 = Store(loc: Location(x: 4, y: 6), name: "seven")
let store3_3 = Store(loc: Location(x: 1, y: 7), name: "cu")
let stores3 = [store3_1, store3_2, store3_3]
printClosetStore(currentLocation: myLocation, stores: stores3)

/*: ## 2번째*/
//// MARK: - [🟠] 문제: 가장 가까운 편의점 찾기
//    // 주어진 편의점 정보
//let store1 = (x: 3, y: 5, name: "gs")
//let store2 = (x: 4, y: 6, name: "seven")
//let store3 = (x: 1, y: 7, name: "cu")
//let stores = [store1, store2, store3]
//
//    // func distance, current, target > ?
//func distance(current: (x: Int, y: Int), target: (x: Int, y: Int)) -> Double {
//    let distanceX = Double(target.x - current.x)
//    let distanceY = Double(target.y - current.y)
//
//    let distance = sqrt(distanceX * distanceX + distanceY * distanceY)
//    return distance
//}
//
//func distance(current: Location, target: Location) -> Double {
//    let distanceX = Double(target.x - current.x)
//    let distanceY = Double(target.y - current.y)
//
//    let distance = sqrt(distanceX * distanceX + distanceY * distanceY)
//    return distance
//}
//
//
//func printClosestStore(current: (x: Int, y: Int), stores: [(x: Int, y: Int, name: String)]) {
//
//    var closetStoreName = ""
//    var closetStoreDistance = Double.infinity
//
//    for store in stores {
//        let distanceToStore = distance(current: (x: current.x, y: current.y), target: (x: store.x, y: store.y))
//
//        closetStoreDistance = min(distanceToStore, closetStoreDistance)
//
//        if closetStoreDistance == distanceToStore {
//            closetStoreName = store.name
//        }
//    }
//    print("Closet store: \(closetStoreName)")
//}
//
//
//func printClosestStore(current: Location, stores: [Store]) {
//    var closetStoreName = ""
//    var closetStoreDistance = Double.infinity
//    var isDeliverable = false
//    for store in stores {
//        let distanceToStore = distance(current: current, target: store.loc)
//
//        closetStoreDistance = min(distanceToStore, closetStoreDistance)
//
//        if closetStoreDistance == distanceToStore {
//            closetStoreName = store.name
//            isDeliverable = store.isDeliverable(userLoc: current)
//        }
//    }
//    print("Closet store: \(closetStoreName), deliverable: \(isDeliverable)")
//}
//
//
//
//// Stores Array 세팅, 현재 내 위치 세팅
//printClosestStore(current: (x: 2, y: 5), stores: stores)
//// printClosestStore 함수이용해서 현재 가장 가까운 스토어 출력하기
//
//// MARK: - [🟠] Improve Code
//// - make Location struct
//struct Location {
//    let x: Int
//    let y: Int
//}
//// - make Store struct
//struct Store {
//    let loc: Location
//    let name: String
//    let deliveryRange = 2.0
//
//    func isDeliverable(userLoc: Location) -> Bool {
//        let distanceToStore = distance(current: userLoc, target: loc)
//        return distanceToStore < deliveryRange
//    }
//}
//
//let store2_1 = Store(loc: Location(x: 3, y: 5), name: "gs")
//let store2_2 = Store(loc: Location(x: 4, y: 6), name: "seven")
//let store2_3 = Store(loc: Location(x: 1, y: 7), name: "cu")
//let stores2 = [store2_1, store2_2, store2_3]
//let myLocation = Location(x: 2, y: 5)
//
//printClosestStore(current: myLocation, stores: stores2)

/*: ## 1번째*/
//// MARK: - [🟠] 문제: 가장 가까운 편의점 찾기
//    // 주어진 편의점 정보
////    var store1 = (x: 3, y: 5, name: "gs")
////    var store2 = (x: 4, y: 6, name: "seven")
////    var store3 = (x: 1, y: 7, name: "cu")
////    var stores = [store1, store2,store3]
//
//    // func distance, current, target > ?
//func distance(current: (x: Int, y: Int), target: (x: Int, y: Int)) -> Double {
//    let distanceX = Double(target.x - current.x)
//    let distanceY = Double(target.y - current.y)
//
//    let distance = sqrt(distanceX * distanceX + distanceY * distanceY)
//    return distance
//}
//
//func distance(current: Location, target: Location) -> Double {
//    let distanceX = Double(target.x - current.x)
//    let distanceY = Double(target.y - current.y)
//
//    let distance = sqrt(distanceX * distanceX + distanceY * distanceY)
//    return distance
//}
//
//
//// Stores Array 세팅, 현재 내 위치 세팅
//
//// printClosestStore 함수이용해서 현재 가장 가까운 스토어 출력하기
//func printClosestStore(currentLocation: (x: Int, y: Int), stores: [(x: Int, y: Int, name: String)]) {
//    var closetStoreName = ""
//    var closetStoreDistance = Double.infinity
//
//    for store in stores {
//        let distanceToStore = distance(current: currentLocation, target: (x: store.x, y: store.y))
//        closetStoreDistance = min(distanceToStore, closetStoreDistance)
//
//        if closetStoreDistance == distanceToStore {
//            closetStoreName = store.name
//        }
//    }
//    print("Closet store: \(closetStoreName)")
//}
//
//func printClosestStore(currentLocation: Location, stores: [Store]) {
//    var closetStoreName = ""
//    var closetStoreDistance = Double.infinity
//    var isDelivarable = false
//
//    for store in stores {
//        let distanceToStore = distance(current: currentLocation, target: store.loc)
//        closetStoreDistance = min(distanceToStore, closetStoreDistance)
//
//        if closetStoreDistance == distanceToStore {
//            closetStoreName = store.name
//            isDelivarable = store.isDeliverable(userLoc: currentLocation)
//        }
//    }
//
//    print("Closet store: \(closetStoreName), deliverable: \(isDelivarable)")
//}
//
//// MARK: - [🟠] Improve Code
//// - make Location struct
//struct Location {
//    let x: Int
//    let y: Int
//}
//
//// - make Store struct
//struct Store {
//    let loc: Location
//    let name: String
//    let deliveryRange = 2.0
//
//    func isDeliverable(userLoc: Location) -> Bool {
//        let distanceToStore = distance(current: userLoc, target: loc)
//
//        return distanceToStore < deliveryRange
//    }
//}
//
//let store1 = Store(loc: Location(x: 3, y: 5), name: "gs")
//let store2 = Store(loc: Location(x: 4, y: 5), name: "seven")
//let store3 = Store(loc: Location(x: 1, y: 7), name: "cu")
//let stores = [store1, store2, store3]
//
//let myLocation = Location(x: 2, y: 5)
//
//printClosestStore(currentLocation: myLocation, stores: stores)
