//
//  ViewController.swift
//  test
//
//  Created by jinhee ye on 2021/12/23.
//

import UIKit

class ViewController: UIViewController {
    var abc = ["aaa","b","c", "d"]
    var arrayStoreAbc: [String] = []
    var textT: String {
        var ts = ""
        
        for i in abc {
            ts.append(contentsOf: i + ", ")
        }
        
        return ts
    }
    @IBOutlet weak var label: UILabel!
    let newFavorite = (PANAPPS: "https://pan-appstore.com/", abc: "abc")
    let defaultTest = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        isUpdateAvailable()
        
        print(newFavorite.0.description)
        print(newFavorite.0)
        
        label.text = textT
        arrayStoreAbc = abc
        
        let value = defaultTest.value(forKey: "remove")
        print("🔴 didLoad : value is \(value)")
    }
    
    @IBAction func btnTapped(_ sender: Any) {
        defaultTest.set(abc.last, forKey: "remove")
        
        let value = defaultTest.value(forKey: "remove")
        print("value is \(value)")
        if !abc.isEmpty { abc.removeLast() }
        label.text = abc.isEmpty == true ? "array is empty" : textT
    }
    
    @IBAction func tappedResetbtn(_ sender: Any) {
        if abc.isEmpty {
            abc = arrayStoreAbc
            label.text = textT
        }
    }
    
    
    /*
     func isUpdateAvailable() -> Bool {
     if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
     print(version)
     }
     //        let bundleID = "com.pando.enterprise.Browser"
     //        let bundleID = "com.jhy.simpleTimerFor-AirFryer"
     let bundleID = "com.mpando.browser"
     let extra = "1585761087"
     if let url = URL(string: "http://itunes.apple.com/lookup?bundleId=\(bundleID)") {
     print(url)
     guard let data = try? Data(contentsOf: url),
     let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
     else { return false }
     
     print(json)
     }
     
     //
     //                let results = json["results"] as? [[String: Any]],
     //            results.count > 0,
     //            let appStoreVersion = results[0]["version"] as? String
     //        else { print("fail"); return false }
     
     
     
     //        if !(version == appStoreVersion) { return true
     //        } else { return false }
     //            return false
     return true
     }
     */
}

