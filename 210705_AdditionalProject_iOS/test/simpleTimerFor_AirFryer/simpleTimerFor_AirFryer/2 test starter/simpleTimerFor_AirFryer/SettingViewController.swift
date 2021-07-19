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
    let db = Database.database().reference().child("data")
    
    @IBOutlet weak var downSample: UISwitch!
    @IBOutlet weak var versionDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downSample.isOn = false
        // Do any additional setup after loading the view.
    }
    
    @IBAction func downToggle(_ sender: Any) {
        // [] toggle버튼 ON -> 기본 json file 다운로드
        //  -> 다운로드 완료후 동작
        // [] toggle버튼 OFF -> 기본 json file 다운로드
        
        if downSample.isOn == true, FoodViewModel.countN_download < 1 {
//            addTmpFood.append(<#T##newElement: Food##Food#>)
//            foodViewModel.updateFood(addTmpFood)
            FoodViewModel.countN_download = 1
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FoodViewModel {
    static var countN_download = 0
}
