//
//  ViewController.swift
//  AvailabilityCondition
//
//  Created by inooph on 2021/07/03.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // # -> 런타임에 확인한다.
        if #available(iOS 11.0, macOS 10.3, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            // 미지원 기능에 대한 안내메시지
            // 이전버전 적합한 별도의 UI
            // Fallback on earlier versions
        }
    }
}

