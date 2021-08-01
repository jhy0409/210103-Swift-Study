//
//  ViewController.swift
//  dasiBom4
//
//  Created by inooph on 2021/07/30.
//

import UIKit
import Firebase
import GoogleSignIn

class ViewController: UIViewController {
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var pwTxtFIeld: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let user = Auth.auth().currentUser {
            emailTxtField.placeholder = "이미 로그인 된 상태입니다."
            
            pwTxtFIeld.placeholder = "이미 로그인 된 상태입니다."
            
            loginBtn.setTitle("이미 로그인 된 상태입니다.", for: .normal)
        }
        
    }
    
    
    @IBAction func loginBtnTouched(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTxtField.text!, password: pwTxtFIeld.text!) { (user, error) in
            if user != nil  {
                print("login success")
            } else {
                print("login fail")
            }
        }
    }
    
    @IBAction func registerBtnTouced(_ sender: Any) {
    }
    
    
    
}




