//
//  SettingViewController.swift
//  simpleTimerFor_AirFryer
//
//  Created by inooph on 2021/07/19.
//

import UIKit
import Firebase

class SettingTableViewController: UITableViewController {
    var foodViewModel = FoodViewModel()
    var addTmpFood: [Food] = []
    
    var foods: [Food] = []
    let arr: [String] = ["서버에서 샘플받기", "버전", "3", "4", "5"]
    
    @IBOutlet weak var downSample: UISwitch!
    @IBOutlet weak var versionDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        downSample.isOn = false
        // Do any additional setup after loading the view.
    }
    
    @IBAction func downToggle(_ sender: Any) {
        // [] toggle버튼 ON -> 기본 json file 다운로드
        //  -> 다운로드 완료후 동작
        if downSample.isOn == true {
            downSample.isEnabled = false // 다운이 완료되면 초기화
            print("---> toggle On")
            
            //            self.db.setValue(<#T##value: Any?##Any?#>)
        }
        // [] toggle버튼 OFF -> 기본 json file 다운로드
        else {
            print("---> toggle Off")
        }
        
        //        if downSample.isOn == true, FoodViewModel.countN_download < 1 {
        //            addTmpFood.append(<#T##newElement: Food##Food#>)
        //            foodViewModel.updateFood(addTmpFood)
        //            FoodViewModel.countN_download = 1
        //        }
    }
}


extension SettingTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        
        view.backgroundColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.5)
        let title = UILabel()
        
        title.font = UIFont.systemFont(ofSize: 19, weight: .regular)
        title.textColor = .black
        title.text = "TestTestTestTestTest"
        view.addSubview(title)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        title.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        return view
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        else {
            print("\n\n XXX dequeueReusableCell 실패 XXX")
            let cell = UITableViewCell()
            return cell
        }
        cell.textLabel?.text = arr[indexPath.row]
        return cell
    }
}

extension FoodViewModel {
    static var countN_download = 0
}
