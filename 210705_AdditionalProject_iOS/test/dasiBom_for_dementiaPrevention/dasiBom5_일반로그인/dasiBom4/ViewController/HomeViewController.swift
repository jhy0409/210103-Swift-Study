//
//  ViewController.swift
//  dasiBom4
//
//  Created by inooph on 2021/07/30.
//

import UIKit
import Firebase
import GoogleSignIn

class HomeViewController: UIViewController {
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var pwTxtFIeld: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var logOutBtn: UIButton!
    
    var user = Auth.auth().currentUser
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logOutBtn.isHidden = true
        
        if let user = user {
            self.updateUI(user)
        } else { self.updateUI(nil) }
    }
    
    @IBAction func loginBtnTouched(_ sender: Any) {
        let user = Auth.auth().currentUser
        self.signIn()
    }
    
    @IBAction func logOutBtnTapped(_ sender: Any) {
        signOut()
    }
    
    func signIn() {
        Auth.auth().signIn(withEmail: emailTxtField.text!, password: pwTxtFIeld.text!) { (user, error) in
            if user != nil  {
                print("login success")
                guard let tmpUser = Auth.auth().currentUser else { return }
                self.updateUI(tmpUser)
            } else {
                print("login fail")
            }
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut()
        let user = Auth.auth().currentUser
        updateUI(user)
    }
    
    func updateUI(_ user: User?) {
        if let user = user {// 로그인 상태
            emailTxtField.isHidden = true
            pwTxtFIeld.isHidden = true
            emailTxtField.text = ""
            pwTxtFIeld.text = ""
            loginBtn.isHidden = true
            logOutBtn.isHidden = false
            
        } else { //미로그인 상태
            emailTxtField.isHidden = false
            pwTxtFIeld.isHidden = false
            logOutBtn.isHidden = true
            loginBtn.isHidden = false
        }
    }
    
}




