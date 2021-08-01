//
//  SignUpViewController.swift
//  dasiBom4
//
//  Created by inooph on 2021/08/01.
//

import UIKit
import Firebase


class SignUpViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signUpAction(_ sender: Any) {
        doSignUp()
    }
}

extension SignUpViewController {
    
    func showAlert(message:String){
        let alert = UIAlertController(title: "회원가입 실패",message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "확인", style: UIAlertAction.Style.default))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func doSignUp(){
        if emailTextField.text! == ""{
            showAlert(message: "이메일을 입력해주세요")
            return
        }
        
        if passwordTextField.text! == ""{
            showAlert(message: "비밀번호를 입력해주세요")
            return
        }
        
        signUp(email: emailTextField.text!, password: passwordTextField.text!)
        self.dismiss(animated: true, completion: nil)
    }
    
    func signUp(email:String,password:String){
        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
            if error != nil{
                if let ErrorCode = AuthErrorCode(rawValue: (error?._code)!) {
                    switch ErrorCode {
                    case AuthErrorCode.invalidEmail:
                        self.showAlert(message: "유효하지 않은 이메일 입니다")
                    case AuthErrorCode.emailAlreadyInUse:
                        
                        self.showAlert(message: "이미 가입한 회원 입니다")
                    case AuthErrorCode.weakPassword:
                        
                        self.showAlert(message: "비밀번호는 6자리 이상이여야해요")
                    default:
                        print(ErrorCode)
                    }
                }
                
            } else {
                print("회원가입 성공")
                Auth.auth().createUser(withEmail: email, password: password, completion: nil)
                dump(user)
            }
        })
    }
}

