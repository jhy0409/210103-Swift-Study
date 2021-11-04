//
//  ViewController.swift
//  MyAlbum
//
//  Created by inooph on 2021/11/04.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 1000000
    var decimal = ""
    @IBOutlet weak var priceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        priceLabel.text = "₩ \(decimalText(inputNum: currentValue))"
    }
    
    // MARK: - [ㅇ] 버튼 클릭 시 수행 메소드
    @IBAction func showAlert(_ sender: UIButton) {
        currentValue = Int.random(in: 1000...10000000)
//        currentValue = Int(arc4random_uniform(2)) + 1
        
        decimal = decimalText(inputNum: currentValue)
        let message = "가격은 \(decimal)입니다." // 누르면서 갱신
        
        let alert = UIAlertController(title: "Hello", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default) { UIAlertAction in
            self.refresh()
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - [ㅇ] 경고창 - 확인 후 값 갱신 메소드
    func refresh() {
//        currentValue = Int.random(in: 1000...10000000) // 확인 누른 뒤 갱신
        decimal = decimalText(inputNum: currentValue)
        priceLabel.text = "₩ \(decimal)"
    }
    
    // MARK: - [ㅇ] 3자리씩 끊어서
    func decimalText(inputNum: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let resultString = numberFormatter.string(from: NSNumber(value: inputNum)) ?? ""
        
        return resultString
    }
}

