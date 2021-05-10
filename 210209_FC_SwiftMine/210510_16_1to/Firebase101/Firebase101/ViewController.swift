//
//  ViewController.swift
//  Firebase101
//
//  Created by inooph on 2021/05/10.
//

import UIKit
import Firebase
class ViewController: UIViewController {
    
    @IBOutlet weak var dataLable: UILabel!
    let db = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateLable()
    }
    
    func updateLable() {
        db.child("firstData").observeSingleEvent(of: .value) { snapshot in
            print("---> \(snapshot)")
            
            let value = snapshot.value as? String ?? ""
            DispatchQueue.main.async {
                self.dataLable.text = value
            }
        }
    }
}

