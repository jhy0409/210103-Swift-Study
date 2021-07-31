//
//  ViewController.swift
//  ytalk_210731
//
//  Created by inooph on 2021/07/31.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var box = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(box)
        box.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.width.height.equalTo(65)
        }
        box.image = #imageLiteral(resourceName: "chatAppIcon")
        self.view.backgroundColor = UIColor(hex: "#000000")
    }


}

extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 1
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}
