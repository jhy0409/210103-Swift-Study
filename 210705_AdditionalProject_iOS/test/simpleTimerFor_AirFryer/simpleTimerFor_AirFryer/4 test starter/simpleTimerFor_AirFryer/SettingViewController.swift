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
 
 - [] 버전정보 강제 업데이트
 - [ㅇ] 타이머 전체 비우기
 
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
    
    // [ㅇ] firebase에서 내려받기
    @IBAction func downToggle(_ sender: Any) {
        // [ㅇ] toggle버튼 ON -> 기본 json file 다운로드
        if downSample.isOn == true {
            downSample.isEnabled = false // 다운시작 - 비활성화
            print("\n---> [설정창 스위치 - On] 서버데이터 받기 toggle")
            let tmpRange = 0...18
            getData(of: tmpRange)
            
        // [] 다운완료 알림창
            downSample.isEnabled = true
            downSample.isOn = false // 다운완료 - 스위치 끄기
        }
    }
    
    @IBAction func delAllFoodArr(_ sender: Any) {
        
        if delFoodsAll.isOn {
            
            // [] foods Arr 갯수가 0이면 return
            // [] 갯수 알림창
            print("\n---> [설정창 스위치 - On] 모든 데이터를 삭제합니다.")
            //            foodViewModel.loadFoods()
            foodViewModel.deleteAllFoods()
            print("\(foodViewModel.foods.count)")
        } else {
            print("\n---> [설정창 스위치 - Off] 모든 데이터를 삭제합니다.")
            print("\(foodViewModel.foods.count)")
        }
    }
    
    func getData(of closedRange: ClosedRange<Int>) {
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
        for i in closedRange {
            ref.child("sample").child(String(i)).observeSingleEvent(of: .value, with: { snapshot in
                let value = snapshot.value as? NSDictionary
                
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
            })
            self.foodViewModel.loadFoods()
        }
    }
}


