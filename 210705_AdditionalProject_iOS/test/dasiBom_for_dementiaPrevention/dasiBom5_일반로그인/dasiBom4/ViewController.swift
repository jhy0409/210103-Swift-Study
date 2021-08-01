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
        let user = Auth.auth().currentUser
        if let user = user {
            updateUI(user)
        } else {
            updateUI(user)
        }
//        self.view.layoutIfNeeded()
    }
    
    
    @IBAction func loginBtnTouched(_ sender: Any) {
        let user = Auth.auth().currentUser
        if user != nil {
            signOut()
            updateUI(user)
        } else {
            signIn()
            updateUI(user)
        }
    }
    
    func signIn() {
        Auth.auth().signIn(withEmail: emailTxtField.text!, password: pwTxtFIeld.text!) { (user, error) in
            if user != nil  {
                print("login success")
            } else {
                print("login fail")
            }
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut()
    }
    
    func updateUI(_ user: User?) {
        if let user = user {// 로그인 상태
            emailTxtField.isHidden = true
            pwTxtFIeld.isHidden = true
            emailTxtField.text = ""
            pwTxtFIeld.text = ""
            loginBtn.setTitle("로그아웃", for: .normal)
        } else { //미로그인 상태
            emailTxtField.isHidden = false
            pwTxtFIeld.isHidden = false
            loginBtn.setTitle("로그인", for: .normal)
        }
    }
    
}




