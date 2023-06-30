import UIKit

var greeting: Double = 1643244249
var testGreeting = Date(timeIntervalSince1970: greeting)

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd a HH:mm"
dateFormatter.locale = Locale(identifier: "ko_kr")
dateFormatter.timeZone = TimeZone(abbreviation: "KST")
let dateString = dateFormatter.string(from: testGreeting)

