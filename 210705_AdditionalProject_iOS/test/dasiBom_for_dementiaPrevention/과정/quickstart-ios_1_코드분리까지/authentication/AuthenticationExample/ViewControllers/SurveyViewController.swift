//
//  SurveyViewController.swift
//  AuthenticationExample
//
//  Created by inooph on 2021/07/29.
//  Copyright © 2021 Firebase. All rights reserved.
//

import UIKit
import Firebase

class SurveyViewController: UIViewController, UITableViewDelegate {
    let tableView: UITableView = UITableView()
    
    
    
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
        tableView.backgroundColor = .systemGray6
        
    }
}



extension SurveyViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Survey.shared.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = Survey.shared.items[indexPath.row]
        cell.backgroundColor = .systemGray6
        
        
        cell.addSubview(<#T##view: UIView##UIView#>)
        
        return cell
    }
}
