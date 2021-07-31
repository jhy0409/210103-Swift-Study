//
//  ViewController.swift
//  ytalk_210731
//
//  Created by inooph on 2021/07/31.
//

import UIKit
import SnapKit
import Firebase

class ViewController: UIViewController {
    
    var box = UIImageView()
    var remoteConfig: RemoteConfig!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        remoteConfig.setDefaults(fromPlist: "RemoteConfigDefaults")
        
        remoteConfig.fetch { (status, error) -> Void in
          if status == .success {
            print("Config fetched!")
            self.remoteConfig.activate { changed, error in
              // ...
            }
          } else {
            print("Config not fetched")
            print("Error: \(error?.localizedDescription ?? "No error available.")")
          }
          self.displayWelcome()
        }
        
        
        
        
        
        
        // Do any additional setup after loading the view.
        self.view.addSubview(box)
        box.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.width.height.equalTo(65)
        }
        box.image = #imageLiteral(resourceName: "chatAppIcon")
//        self.view.backgroundColor = UIColor(hex: "#000000")
    }
    func displayWelcome() {
        let color = remoteConfig["splash_background"].stringValue
//        let caps = true
        let caps = remoteConfig["splash_message_caps"].boolValue
        let message = remoteConfig["splash_message_caps"].stringValue
        
        if(caps) {
            let alert = UIAlertController(title: "공지사항", message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: { (action) in
                exit(0)
            }))
            self.present(alert, animated: true, completion: nil)
        }
        self.view.backgroundColor = UIColor(hex: color!)
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
