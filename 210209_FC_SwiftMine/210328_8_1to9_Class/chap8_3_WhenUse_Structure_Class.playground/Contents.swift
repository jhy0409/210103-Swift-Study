import UIKit

// Struct*

// 1. 데이터 자체의 비교시 사용
struct Point {
    let x: Int
    let y: Int
}

let point1 = Point(x: 3, y: 5)
let point2 = Point(x: 3, y: 5)



// 2. Copy된 객체가 독립적 상태를 가져야하는 경우
struct Mac {
    var owner: String
}

var myMac = Mac(owner: "Jason")
var yourMac = myMac
yourMac.owner = "Jay"

myMac.owner
yourMac.owner



// 3. 코드에서 오브젝트의 데이터를 여러 스레드를 걸쳐 사용할 경우
// value type = 유니크 인스턴스 (한객체 여러스레드의 동시접근 => 잠재적위험)


// Class**

// 1. 두 오브젝트의 인스턴스 자체가 같음을 확인해야 할 때(객체가 같은지 여부)
// 2. 하나의 객체 필요, 여러대상에 의해 접근, 변경필요한 경우

// *주사용, * -> ** 변환, 필요시 **사용
