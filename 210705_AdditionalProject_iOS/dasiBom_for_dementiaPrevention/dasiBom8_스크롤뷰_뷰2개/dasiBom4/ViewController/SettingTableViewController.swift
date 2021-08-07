//
//  SettingTableViewController.swift
//  dasiBom4
//
//  Created by inooph on 2021/08/06.
//

import UIKit
import Firebase
//[삭제 기능 구현]
//- [ㅇ] 설문조사, 게임 이력
//- [ㅇ] 사용자 계정, db ref
//- [ㅇ] 예외처리 : 로그인된 사용자 없을 때 버튼 비활성화

var dbForGame: DatabaseReference?
var dbForTest: DatabaseReference?
var db: DatabaseReference?
var uID: String?

class SettingTableViewController: UITableViewController {
    @IBOutlet weak var delBtn_testResult: UIButton!
    @IBOutlet weak var delBtn_gameResult: UIButton!
    @IBOutlet weak var delBtn_account: UIButton!
    var currentUser: User?
    lazy var btnArr: [UIButton] = [delBtn_testResult, delBtn_gameResult, delBtn_account]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Auth.auth().addStateDidChangeListener { auth, user in
            if user != nil {
                self.currentUser = user // 유저가 있으면 전역변수로
                self.btnEnableSwitch(self.btnArr, self.currentUser)
                self.setFirebaseReference(self.currentUser)
                print("\n\n------> addStateDidChangeListener [user] :  \(self.currentUser!.uid)")
            } else {
                self.currentUser = nil
            }
        }
        checkUserNil()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Auth.auth().addStateDidChangeListener { auth, user in
            if user != nil {
                self.currentUser = user // 유저가 있으면 전역변수로
                self.btnEnableSwitch(self.btnArr, self.currentUser)
                self.setFirebaseReference(self.currentUser)
                print("\n\n------> addStateDidChangeListener [user] :  \(self.currentUser!.uid)")
            } else {
                self.currentUser = nil
            }
        }
        checkUserNil()
    }
    
    func checkUserNil() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            if self.currentUser == nil {
                self.showAlert("알림", "로그인 후 해당 기능을 이용할 수 있습니다.")
            }
        }
    }
    
    @IBAction func delBtnTapped_testResult(_ sender: Any) {
        dbForTest?.removeValue()
    }
    
    @IBAction func delBtnTapped_gameResult(_ sender: Any) {
        dbForGame?.removeValue()
    }
    
    @IBAction func delBtnTapped_account(_ sender: Any) {
        print("\n\n\n---> delBtnTapped_account tapped")
        db?.removeValue()
        loadDeleteFirebase()
        HomeViewController.currentUser = nil
        btnEnableSwitch(btnArr, HomeViewController.currentUser)
        uID = nil
    }
    
    private func loadDeleteFirebase() {
        let user = Auth.auth().currentUser
        user?.delete(completion: { (error) in
            guard error == nil else
            {   if let errorCode : AuthErrorCode = AuthErrorCode(rawValue: error!._code)
                { print("delete -> error -> \(errorCode.rawValue)") }
                return
            }
            return
        })
    }
    
    func setFirebaseReference(_ currUser: User?) {
        guard let tmpuID = currUser?.uid else { return }
        dbForGame = Database.database().reference().child("users").child("\(tmpuID)").child("game")
        dbForTest = Database.database().reference().child("users").child("\(tmpuID)").child("selfTest")
        db = Database.database().reference().child("users").child("\(tmpuID)")
        uID = tmpuID
    }
    
    // MARK: - 유저여부에 따른 버튼 비활성화
    func btnEnableSwitch(_ btnArr: [UIButton], _ user: User?) {
        if user == nil {
            for i in btnArr {
                i.isEnabled = false
            }
        } else {
            for i in btnArr {
                i.isEnabled = true
            }
        }
    }
    
    func showAlert(_ title: String, _ msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { action in
            self.btnEnableSwitch(self.btnArr, self.currentUser)
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
