//
//  SettingViewController.swift
//  simpleTimerFor_AirFryer
//
//  Created by inooph on 2021/07/19.
//

import UIKit
import Firebase
/*
 할일 목록
 
 - [] firebase에서 내려받기
 - [] 버전정보 강제 업데이트
 - [] 타이머 전체 비우기
 
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
        foodViewModel.loadFoods()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func downToggle(_ sender: Any) {
        // [] toggle버튼 ON -> 기본 json file 다운로드
        //  -> 다운로드 완료후 동작
        if downSample.isOn == true {
            downSample.isEnabled = false // 다운이 완료되면 초기화
            print("\n---> [설정창 스위치 - On] 서버데이터 받기 toggle")
            getData(of: 3)
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
            foodViewModel.foods = []
            print("\(foodViewModel.foods.count)")
        } else {
            print("\n---> [설정창 스위치 - Off] 모든 데이터를 삭제합니다.")
            print("\(foodViewModel.foods.count)")
        }
    }
    
    func getData(of userIndex: Int) {
        var v1_foodId = 0
        var v2_foodName = String()
        var v3_foodType = String()
        var v4_foodHour = 0
        var v5_timerOn = false
        var v6_foodMin = 0
        var v7_foodOndo = 0
        var v8_foodTurnNum = 0
        
        var count = 0
        
        let ref: DatabaseReference! = Database.database().reference()
        ref.child("sample").child(String(userIndex)).observeSingleEvent(of: .value, with: { snapshot in
            let value = snapshot.value as? NSDictionary
            //            vS = value?["key1"] as? String ?? "No string"
            //            vI = value?["key2"] as? Int ?? -1
            //            vB = value?["key3"] as? Bool ?? false
            
            v1_foodId = value?["foodId"] as? Int ?? 0
            v2_foodName = value?["foodName"] as? String ?? "NONE"
            v3_foodType = value?["foodType"] as? String ?? "NONE"
            v4_foodHour = value?["hour"] as? Int ?? 0
            v5_timerOn = value?["isTimerOn"] as? Bool ?? false
            v6_foodMin = value?["min"] as? Int ?? 0
            v7_foodOndo = value?["ondo"] as? Int ?? 0
            v8_foodTurnNum = value?["turningFood"] as? Int ?? 0
            
            count += 1
            let food: Food = self.foodViewModel.manager.createFood(ondo: v7_foodOndo, hour: v4_foodHour, min: v6_foodMin, turn: v8_foodTurnNum, foodType: v3_foodType, isTimerOn: v5_timerOn, foodName: v2_foodName)
            
            self.foodViewModel.addFood(food)
            print("\n ------> [ 함수실행 ] add getData : \(count)")
            self.foodViewModel.loadFoods()
        })
    }
}


extension FoodViewModel {
    static var countN_download = 0
}
