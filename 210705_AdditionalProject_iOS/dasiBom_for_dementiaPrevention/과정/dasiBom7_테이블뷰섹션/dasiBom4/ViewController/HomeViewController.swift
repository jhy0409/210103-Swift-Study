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
    @IBOutlet weak var signUpBtn: UIButton!
    
    @IBOutlet weak var logOutBtn_topConstant: NSLayoutConstraint!
    @IBOutlet weak var signUpBtn_topConstant: NSLayoutConstraint!
    lazy var oldValue: CGFloat = 20
    
    
    lazy var btnArr: [UIButton] = [loginBtn, logOutBtn, signUpBtn]
    var user = Auth.auth().currentUser
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logOutBtn.isHidden = true
        
        makeBtnBorder(btnArr, nil)
        if let user = user {
            self.updateUI(user)
        } else { self.updateUI(nil) }
    }
    
    
    func makeBtnBorder(_ btnArr: [UIButton], _ user: User?) {
        let range = 0...btnArr.count - 1
        if user == nil {
            for i in range {
                btnArr[i].layer.borderColor = UIColor.systemBlue.cgColor
                btnArr[i].layer.borderWidth = 2
                btnArr[i].layer.cornerRadius = btnArr[i].frame.height / 2
                btnArr[i].setTitleColor(.systemBlue, for: .normal)
            }
        } else {
            for i in range {
                btnArr[i].layer.borderColor = UIColor.white.cgColor
                btnArr[i].layer.borderWidth = 2
                btnArr[i].layer.cornerRadius = btnArr[i].frame.height / 2
                btnArr[i].setTitleColor(.white, for: .normal)
            }
        }
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
            
            view.backgroundColor = .systemBlue
            makeBtnBorder(btnArr, user)
            logOutBtn_topConstant.constant += 15
            signUpBtn_topConstant.constant = logOutBtn_topConstant.constant + 20
        } else { //미로그인 상태
            emailTxtField.isHidden = false
            pwTxtFIeld.isHidden = false
            logOutBtn.isHidden = true
            loginBtn.isHidden = false
            
            view.backgroundColor = .white
            signUpBtn_topConstant.constant = oldValue
            makeBtnBorder(btnArr, nil)
        }
    }
    
}




