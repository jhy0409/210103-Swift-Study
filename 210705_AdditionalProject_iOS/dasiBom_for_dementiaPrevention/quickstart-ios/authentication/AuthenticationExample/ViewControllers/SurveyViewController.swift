//
//  SurveyViewController.swift
//  AuthenticationExample
//
//  Created by inooph on 2021/07/29.
//  Copyright © 2021 Firebase. All rights reserved.
//

import UIKit
import Firebase

class SurveyViewController: UIViewController {
    let tableView: UITableView = UITableView()
    let items: [String] = ["1. 자신의 기억력에 문제가 있다고 생각하십니까?",
                           "2. 자신의 기억력이 10년 전보다 나빠졌다고 생각하십니까?",
                           "3. 자신의 기억력이 같은 또래의 다른 사람들에 비해 나쁘다고 생각하십니까?",
                           "4. 기억력 저하로 인해 일상생활에 불편을 느끼십니까?",
                           "5. 최근에 일어난 일을 기억하는 것이 어렵습니까?",
                           "6. 며칠 전에 나눈 대화 내용을 기억하기 어렵습니까?",
                           "7. 며칠 전에 한 약속을 기억하기 어렵습니까?",
                           "8. 친한 사람의 이름을 기억하기 어렵습니까?",
                           "9. 물건 둔 곳을 기억하기 어렵습니까?",
                           "10. 이전에 비해 물건을 자주 잃어버립니까?",
                           "11. 집 근처에서 길을 잃은 적이 있습니까?",
                           "12. 가게에서 2-3가지 물건을 사려고 할 때 물건이름을 기억하기 어렵습니까?",
                           "13. 가스불이나 전기불 끄는 것을 기억하기 어렵습니까?",
                           "14. 자주 사용하는 전화번호(자신 혹은 자녀의 집)를 기억하기 어렵습니까?"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        
        self.view.addSubview(self.tableView)
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: self.tableView,
                                                   attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top,
                                                   multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.tableView,
                                                   attribute: .bottom, relatedBy: .equal, toItem: self.view,
                                                   attribute: .bottom, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.tableView,
                                                   attribute: .leading, relatedBy: .equal, toItem: self.view,
                                                   attribute: .leading, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.tableView,
                                                   attribute: .trailing, relatedBy: .equal, toItem: self.view,
                                                   attribute: .trailing, multiplier: 1.0, constant: 0))
    }
    
    
    
    
    private func configureNavigationBar() {
        navigationItem.title = "치매 자가진단"
        guard let navigationBar = navigationController?.navigationBar else { return }
        navigationBar.prefersLargeTitles = true
        navigationBar.titleTextAttributes = [.foregroundColor: UIColor.systemOrange]
        navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.systemOrange]
    }
    
    override func loadView() {
        super.loadView()
        view = UIView()
        view.backgroundColor = .systemGray6
    }
}


extension SurveyViewController: UITableViewDelegate {
    
}

extension SurveyViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
}
