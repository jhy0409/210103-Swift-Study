//
//  ViewResultController.swift
//  dasiBom4
//
//  Created by inooph on 2021/08/04.
//

import UIKit

class ViewResultController: UIViewController {
    var expertise = [Dictionary<String, Any>]()
    @IBOutlet weak var tableVIew: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableVIew.tableFooterView = UIView(frame: .zero)
        tableVIew.register(UINib(nibName: "ViewResultTableViewCell", bundle: nil), forCellReuseIdentifier: "ViewResultTableViewCell")
        
        tableVIew.estimatedRowHeight = 60.0
        createDataSource()
        tableVIew.dataSource = self
        tableVIew.delegate = self
    }
    
    func createDataSource() {
        expertise.append(["title": "iOS", "value": ["Tom", "John", "Moddy"]])
        expertise.append(["title": "Android", "value": ["Reema", "Raze", "Jack", "Joddy"]])
        expertise.append(["title": "Etc", "value": ["Majed", "Ali", "Ryan"]])
        expertise.append(["title": "Python", "value": ["Jake", "Riyadh", "Mark"]])
        expertise.append(["title": "PHP", "value": ["Jerry", "Alex", "Cyril", "Rohn", "Rob", "John", "Rahul"]])
    }
}



extension ViewResultController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return expertise.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let codersName = expertise[section]["value"] as? [String] else { return 0 }
        return codersName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ViewResultTableViewCell") as! ViewResultTableViewCell
        
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
