//
//  ViewController.swift
//  test2
//
//  Created by inooph on 2021/02/13.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sAlert(_ sender: Any) {
        let alert = UIAlertController(title: "Hello2", message: "내용입니다.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OOK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

