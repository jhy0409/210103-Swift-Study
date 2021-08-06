//
//  SettingTableViewController.swift
//  dasiBom4
//
//  Created by inooph on 2021/08/06.
//

import UIKit
import Firebase
/*
 todo
 
 [삭제 기능 구현]
 - [] 설문조사 이력
 - [] 게임이력
 - [] 사용자 계정
 
 - [ㅇ] 예외처리 : 로그인된 사용자 없을 때 버튼 비활성화
 */

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
                print("\n\n------> addStateDidChangeListener [user] :  \(self.currentUser!.uid)")
            } else {
                self.currentUser = nil
            }
        }
        
        if currentUser == nil {
            showAlert("알림", "로그인 후 해당 기능을 이용할 수 있습니다.")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Auth.auth().addStateDidChangeListener { auth, user in
            if user != nil {
                self.currentUser = user // 유저가 있으면 전역변수로
                self.btnEnableSwitch(self.btnArr, self.currentUser)
                print("\n\n------> addStateDidChangeListener [user] :  \(self.currentUser!.uid)")
            } else {
                self.currentUser = nil
            }
        }
        
        if currentUser == nil {
            showAlert("알림", "로그인 후 해당 기능을 이용할 수 있습니다.")
        }
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
