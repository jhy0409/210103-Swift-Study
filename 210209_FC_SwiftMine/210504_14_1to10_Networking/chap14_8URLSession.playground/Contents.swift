import UIKit

// URL, 웹 리소스의 주소

let urlString = "https://itunes.apple.com/search?media=music&entity=song&term=Gdragon"
let url = URL(string: urlString)

url?.absoluteString
url?.scheme // 뭘로 통신?
url?.host
url?.path
url?.query
url?.baseURL

let baseURL = URL(string: "https://itunes.apple.com")
let relativeURL = URL(string: "search?media=music&entity=song&term=Gdragon", relativeTo: baseURL)


relativeURL?.absoluteString
relativeURL?.scheme
relativeURL?.host
relativeURL?.path
relativeURL?.query
relativeURL?.baseURL

// URL Conponents

var urlComponents = URLComponents(string: "https://itunes.apple.com/search?")
let mediaQuary = URLQueryItem(name: "media", value: "music")
let entityQuery = URLQueryItem(name: "entity", value: "song")
let termQuary = URLQueryItem(name: "term", value: "Gdragon")

urlComponents?.queryItems?.append(mediaQuary)
urlComponents?.queryItems?.append(entityQuery)
urlComponents?.queryItems?.append(termQuary)

urlComponents?.url?.scheme
urlComponents?.string
urlComponents?.queryItems
