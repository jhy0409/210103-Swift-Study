//
//  ViewResultController.swift
//  dasiBom4
//
//  Created by inooph on 2021/08/04.
//

import UIKit
import Firebase

class ViewResultController: UIViewController {
    var user = Auth.auth().currentUser
    var uID: String?
    var dbForGame: DatabaseReference?
    var dbForTest: DatabaseReference?
    
    var getUserGameInfoArr: [userGameResult] = []
    var getUserTestInfoArr: [userTestResult] = []
    
//    var expertise = [Dictionary<String, Any>]()
    @IBOutlet weak var toptableVIew: SelfSizedTableView!
    @IBOutlet weak var bottomTableView: SelfSizedTableView!
    
    /*
     Todo
     [] 결과조회 탭 - 그전 검사결과 받아오기
        - [] 예외처리 : 검사이력 없을 시 perform Segue(검사탭으로 이동)
     */
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if user == nil {
            print("미로그인 상태입니다.")
        }
        if getUserGameInfoArr.count > 0, getUserTestInfoArr.count > 0 {
            print("\n----> getUserGameInfoArr Count : \(getUserGameInfoArr.count) / \(getUserGameInfoArr[0].totalTime)")
            print("\n----> getUserTestInfoArr Count : \(getUserTestInfoArr.count) / \(getUserTestInfoArr[0].riskType)")
            self.toptableVIew.reloadData()
            self.bottomTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toptableVIew.tableFooterView = UIView(frame: .zero)
        toptableVIew.register(UINib(nibName: "ViewResultTableViewCell", bundle: nil), forCellReuseIdentifier: "ViewResultTableViewCell")
        bottomTableView.tableFooterView = UIView(frame: .zero)
        bottomTableView.register(UINib(nibName: "ViewResultTableViewCell", bundle: nil), forCellReuseIdentifier: "ViewResultTableViewCell")
        
        loadDataFromFirebase()
    }
    
    func loadDataFromFirebase() {
        uID = user?.uid
        if uID != nil {
            print("\n\n------------> ViewResultController uID : \(uID)")
            dbForGame = Database.database().reference().child("users").child("\(uID!)").child("game")
            dbForTest = Database.database().reference().child("users").child("\(uID!)").child("selfTest")
            
            dbForGame?.observeSingleEvent(of: .value) { (snapshot) in
                guard let gameHistory = snapshot.value as? [String: Any] else { print("\n\n\n -----> error dbForGame"); return }
                let data = try! JSONSerialization.data(withJSONObject: Array(gameHistory.values), options: [])
                let decoder = JSONDecoder()
                let gameTmp = try! decoder.decode([userGameResult].self, from: data)
                self.getUserGameInfoArr = gameTmp.sorted(by: { (term1, term2) in
                    return term1.timestamp < term2.timestamp
                })
            }
            
            dbForTest?.observeSingleEvent(of: .value) { (snapshot) in
                guard let testHistory = snapshot.value as? [String: Any] else { print("\n\n\n -----> error dbForTest"); return }
                let data = try! JSONSerialization.data(withJSONObject: Array(testHistory.values), options: [])
                let decoder = JSONDecoder()
                let testTmp = try! decoder.decode([userTestResult].self, from: data)
                self.getUserTestInfoArr = testTmp.sorted(by: { (term1, term2) in
                    return term1.timestamp < term2.timestamp
                })
            }
            self.toptableVIew.reloadData()
            self.bottomTableView.reloadData()
        }
        toptableVIew.estimatedRowHeight = 60.0
        toptableVIew.dataSource = self
        toptableVIew.delegate = self
        
        bottomTableView.estimatedRowHeight = 60.0
        bottomTableView.dataSource = self
        bottomTableView.delegate = self
    }
}

extension ViewResultController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowCount: Int
        if tableView == toptableVIew {
            rowCount =  getUserGameInfoArr.count
            return rowCount
        }
        else {
            rowCount =  getUserTestInfoArr.count
            return rowCount
        }
    }
    
    // MARK: - 셀에 데이터 세팅 (getUserGameInfoArr, getUserTestInfoArr)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ViewResultTableViewCell") as! ViewResultTableViewCell
        var codersName: String
        if tableView == toptableVIew {
            codersName = getUserGameInfoArr[indexPath.row].getAllString()
            cell.setCoderName(codersName)
        }
        
        if tableView == bottomTableView {
            codersName = getUserTestInfoArr[indexPath.row].getAllString()
            cell.setCoderName(codersName)
        }
        return cell
    }
    
    //MARK: - For Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: tableView.frame.size.width, height: 50.0))
        
        view.backgroundColor = .systemBlue
        let titleLabel = UILabel(frame: CGRect(x: 15.0, y: 0, width: view.frame.size.width, height: 50.0))
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        
        
        if tableView == toptableVIew {
            titleLabel.text = "게임이력"
        }
        
        if tableView == bottomTableView {
            titleLabel.text = "자가진단 내역"
        }
        view.addSubview(titleLabel)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
}

extension ViewResultController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - SelfSizedTableView class
class SelfSizedTableView: UITableView {
  var maxHeight: CGFloat = UIScreen.main.bounds.size.height
  
  override func reloadData() {
    super.reloadData()
    self.invalidateIntrinsicContentSize()
    self.layoutIfNeeded()
  }
  
  override var intrinsicContentSize: CGSize {
    let height = min(contentSize.height, maxHeight)
    return CGSize(width: contentSize.width, height: height)
  }
}
