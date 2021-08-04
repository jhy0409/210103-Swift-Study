//
//  ViewResultController.swift
//  dasiBom4
//
//  Created by inooph on 2021/08/04.
//

import UIKit
import Firebase

class ViewResultController: UIViewController {
    var expertise = [Dictionary<String, Any>]()
    var expertise2 = [Dictionary<String, Any>]()
    @IBOutlet weak var tableVIew: UITableView!
    
    var dbForGame: DatabaseReference?
    var dbForTest: DatabaseReference?
    
    
    
    var user = Auth.auth().currentUser
    var uID: String?
    
    // userGameResult userTestResult
    var getUserGameInfoArr: [userGameResult] = []
    var getUserTestInfoArr: [userTestResult] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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
            print("\n\n\n\n\(data)")
            let decoder = JSONDecoder()
            let testTmp = try! decoder.decode([userTestResult].self, from: data)
            self.getUserTestInfoArr = testTmp.sorted(by: { (term1, term2) in
                return term1.timestamp < term2.timestamp
            })
        }
//        expertise.append(["game": getUserGameInfoArr])
//        expertise.append(["selfTest": getUserTestInfoArr])
        
        expertise.append(["title": "game", "value": getUserGameInfoArr]) //getUserGameInfoArr
        expertise.append(["title": "selfTest", "value": getUserTestInfoArr]) // getUserTestInfoArr
        print("\n\n\n\n \(getUserGameInfoArr.count)")
        print("\n\n\n\n \(getUserTestInfoArr.count)")
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableVIew.tableFooterView = UIView(frame: .zero)
        tableVIew.register(UINib(nibName: "ViewResultTableViewCell", bundle: nil), forCellReuseIdentifier: "ViewResultTableViewCell")
        
        uID = user?.uid
        if uID != nil {
            dbForGame = Database.database().reference().child("users").child("\(uID!)").child("game")
            dbForTest = Database.database().reference().child("users").child("\(uID!)").child("selfTest")
        }
        
        tableVIew.estimatedRowHeight = 60.0
//        createDataSource()
        tableVIew.dataSource = self
        tableVIew.delegate = self
    }
    
    
//    func createDataSource() {
//        expertise.append(["title": "iOS", "value": ["Tom", "John", "Moddy"]])
//        expertise.append(["title": "Android", "value": ["Reema", "Raze", "Jack", "Joddy"]])
//        expertise.append(["title": "Etc", "value": ["Majed", "Ali", "Ryan"]])
//        expertise.append(["title": "Python", "value": ["Jake", "Riyadh", "Mark"]])
//        expertise.append(["title": "PHP", "value": ["Jerry", "Alex", "Cyril", "Rohn", "Rob", "John", "Rahul"]])
//    }
}



extension ViewResultController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return expertise.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let codersName = expertise[section]["value"] as? [String] else { return 0 }
        return codersName.count
    }
    
    
    // MARK: - 셀에 데이터 세팅
    // getUserGameInfoArr getUserTestInfoArr
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ViewResultTableViewCell") as! ViewResultTableViewCell
        
//        guard let codersName = expertise[indexPath.section]["value"] as? [String] else { return cell }
//        cell.setCoderName(codersName[indexPath.row])
        
        
//        if let title = expertise[section]["title"] as? String {
        for key in expertise {
            
            print("\n\n\n\n\(key.keys)")
            print("\(key.values)")
        }
        
        guard let codersName = expertise[indexPath.section]["value"] as? [String] else { return cell }
        cell.setCoderName(codersName[indexPath.row])
        
        return cell
    }
    
    
    //MARK: - For Header
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: tableView.frame.size.width, height: 50.0))
        
        view.backgroundColor = .systemBlue
        let titleLabel = UILabel(frame: CGRect(x: 15.0, y: 0, width: view.frame.size.width, height: 50.0))
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        if let title = expertise[section]["title"] as? String {
            titleLabel.text = title
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
