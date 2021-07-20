//
//  SettingViewController.swift
//  simpleTimerFor_AirFryer
//
//  Created by inooph on 2021/07/19.
//

import UIKit
import Firebase
/*
 todo
 [] 버전정보 강제 업데이트
 [] 타이머 전체 비우기
 [] firebase에서 내려받기
 
 */

class SettingTableViewController: UITableViewController {
    let foodViewModel = FoodViewModel()
    var addTmpFood: [Food] = []
    
    var foods: [Food] = []
    
    @IBOutlet weak var downSample: UISwitch! // 서버 데이터 다운
    @IBOutlet weak var delFoodsAll: UISwitch! // 타이머 전체삭제
    @IBOutlet weak var versionDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func downToggle(_ sender: Any) {
        // [] toggle버튼 ON -> 기본 json file 다운로드
        //  -> 다운로드 완료후 동작
        if downSample.isOn == true {
            downSample.isEnabled = false // 다운이 완료되면 초기화
            print("\n---> [설정창 스위치 - On] 서버데이터 받기 toggle")
            
//            self.db.setValue(<#T##value: Any?##Any?#>)
        }
        // [] toggle버튼 OFF -> 기본 json file 다운로드
        else {
            print("\n---> [설정창 스위치 - off] 서버데이터 받기 toggle")
        }
        
//        if downSample.isOn == true, FoodViewModel.countN_download < 1 {
//            addTmpFood.append(<#T##newElement: Food##Food#>)
//            foodViewModel.updateFood(addTmpFood)
//            FoodViewModel.countN_download = 1
//        }
    }
    
    @IBAction func delAllFoodArr(_ sender: Any) {
        
        if delFoodsAll.isOn {
            print("\n---> [설정창 스위치 - On] 모든 데이터를 삭제합니다.")
        } else {
            print("\n---> [설정창 스위치 - Off] 모든 데이터를 삭제합니다.")
        }
    }
}


extension FoodViewModel {
    static var countN_download = 0
}
