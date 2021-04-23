//
//  ViewController.swift
//  test
//
//  Created by inooph on 2021/02/09.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func showAlert(_ sender: Any) {
        let alert = UIAlertController(title: "Hello", message: "My First App!!", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    // Ch 02. 첫 앱 만들기 - 06. Xcode에서 문제가 발생했을때 해결하기
    // 1. 오타발생 : 자동완성 활용으로 오타줄이기 (대소문자 구분)
    // 2. 변수, 함수의 스코프 {} 주의
    // 3. warning : 잠재적 버그 없애기
}

