import UIKit

// Queue - Main, Global, Custom

// - Main
DispatchQueue.main.async {
    // UI update
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
}

// - Global
DispatchQueue.global(qos: .userInteractive).async {
    // 당장 해야하는 것
}

DispatchQueue.global(qos: .userInitiated).async {
    // 거의 바로 해줘야 할 것, 사용자가 결과를 기다림
}

DispatchQueue.global(qos: .default).async {
    // DispatchQueue.global()과 동일
}

DispatchQueue.global(qos: .utility).async {
    // 시간이 좀 걸리고, 사용자가 당장 기다리지 않는 것, 네트워킹, 큰 파일 불러올 때
}

DispatchQueue.global(qos: .background).async {
    // 사용자한테 당장 인식될 필요가 없는 것들, 뉴스데이터 미리 받기, 위치 업데이트, 영상 다운 등
}


// - Custom Queue
let councurrntQueue = DispatchQueue(label: "concurrent", qos: .background, attributes: .concurrent)
let serialQueue = DispatchQueue(label: "serial", qos: .background)


// 복합적인 상황 : 작업간 의존, (받고 ui업데이트)
func downloadImageFromServer() -> UIImage {
    // Heavy task
    
    return UIImage()
}

func updateUI(image: UIImage){
    
}

DispatchQueue.global(qos: .background).async {
    // download
    let image = downloadImageFromServer()
    
    DispatchQueue.main.async {
        // update ui
        updateUI(image: image)
    }
    
} //  sync로 변경하였음

// Sync, Async

DispatchQueue.global(qos: .background).async {
    for i in 0...5 {
        print("1. 첫번째 수행요청 : 🟪 \(i+1)")
    }
}

DispatchQueue.global(qos: .userInteractive).async {
    for i in 0...5 {
        print("2. 두번째 수행요청 : 🟨 \(i+1) 중요도 상")
    }
}
