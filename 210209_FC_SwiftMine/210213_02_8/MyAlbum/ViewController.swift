//
//  ViewController.swift
//  gallery
//
//  Created by inooph on 2021/02/13.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    @IBOutlet weak var priceLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refresh()
    }

    @IBAction func showAlert(_ sender: Any) {
        let message = "가격은 ￦\(currentValue)입니다"
        
        let alert = UIAlertController(title: "Hello", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: { action in
            self.refresh()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func refresh() {
        let randomPrice = arc4random_uniform(10000) + 1
        currentValue = Int(randomPrice)
        // 0 ~ 9999 랜덤 수 +1
        priceLable.text = "￦ \(currentValue)"
    } //중복코드를 함수화하여 클린코드로, 메서드나 함수는 한가지 동작만 하게 작성
}

