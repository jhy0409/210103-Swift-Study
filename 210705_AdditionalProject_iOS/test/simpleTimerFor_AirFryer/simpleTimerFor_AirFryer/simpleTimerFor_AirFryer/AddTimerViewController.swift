//
//  AddTimerViewController.swift
//  simpleTimerFor_AirFryer
//
//  Created by inooph on 2021/07/16.
//

import UIKit

class AddTimerViewController: UIViewController {
    @IBOutlet weak var foodNameTxt: UITextField!
    @IBOutlet weak var ondoTxt: UITextField!
    @IBOutlet weak var hourTxt: UITextField!
    @IBOutlet weak var minTxt: UITextField!
    @IBOutlet weak var turnTimeTxt: UITextField!
    
    @IBOutlet weak var gogiLabel: UILabel!
    @IBOutlet weak var snackLabel: UILabel!
    @IBOutlet weak var ganpeyonLabel: UILabel!
    @IBOutlet weak var breadLabel: UILabel!
    @IBOutlet weak var chesoLabel: UILabel!
    @IBOutlet weak var hesanmulLabel: UILabel!
    @IBOutlet weak var etcFoodLabel: UILabel!
    
    @IBOutlet weak var addButton: UIButton!
    
    private var uiTextLabel = [UILabel]()
    private let uiLabelColorArr = [#colorLiteral(red: 1, green: 0, blue: 0, alpha: 0.2), #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 0.2), #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 0.2), #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 0.2), #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 0.2), #colorLiteral(red: 0.2196078449, green: 0.2030190556, blue: 0.8549019694, alpha: 0.2), #colorLiteral(red: 0.5, green: 0.007843137719, blue: 0.4200693323, alpha: 0.2)]
    
    let foodViewModel = FoodViewModel()
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        uiTextLabel = [gogiLabel, snackLabel, ganpeyonLabel, breadLabel, chesoLabel, hesanmulLabel, etcFoodLabel]
        
        reset(uiTextLabel)
        
        addButton.backgroundColor = #colorLiteral(red: 0, green: 0.6565038562, blue: 0.9419061542, alpha: 0.45)
        addButton.layer.cornerRadius = 10
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func reset(_ uxTxtF: [UILabel]) {
        var i: Int = 0
        for item in uxTxtF {
            item.backgroundColor = uiLabelColorArr[i]
            item.layer.cornerRadius = 5
            
            //            item.layer.borderColor =
            //            item.layer.borderWidth = 10
            
            print("\(i + 1)")
            i += 1
            //item.addLeftPadding()
        }
    }
    
    @IBAction func addButtonTap(_ sender: Any) {
        // [x] 기본값 세팅
        let ondo = ondoTxt.text == "" ? "0" : String(ondoTxt.text!) // 온도
        let turn = turnTimeTxt.text == "" ? "0" : String(turnTimeTxt.text!) // 뒤집는 횟수
        var hour = hourTxt.text == "" ? "0" : String(hourTxt.text!) // 시간, 분
        var min = minTxt.text == "" ? "0" : String(minTxt.text!)
        
        if (hour == "0" && min == "0") || ondo == "0" { // 유효값 검사(키보드에서 숫자만 입력됨)
            print("[확인]\n- 시간, 분이 둘 다 0일 수 없습니다.\n- 온도를 설정하십시오."); return }
        
        // [x] 분으로 세팅 ex) 80분 -> 1h 20min, 조건 : 시간이 0이고 분이 60분 이상일 때
        if let minIf = Int(min), minIf > 60, let hourIf = Int(hour), hourIf == 0 {
            let h = minIf / 60 // 60으로 나눈 몫
            let m = minIf % 60 // 60으로 나눈 나머지
            
            hour = String(h); min = String(m)
        }
        guard let foodName = foodNameTxt.text, foodName.isEmpty == false,
              let ondo = ondoTxt.text, ondo.isEmpty == false
        else { print("온도와 음식이름은 필수항목입니다."); return }
        
        let nextId = FoodManager.lastId + 1
        FoodManager.lastId = nextId
        
        print("1. \(nextId) / 2. \(ondo), / 3. \(hour) / 4. \(min) / 5. \(turn) / 6. \(foodName) ")
        //foodId: nextId, ondo: Int(ondo)!, hour: Int(hour)!, min: Int(min)!, turn: Int(turn)!, foodType: foodName, isTimerOn: false)
        
        // ondo: Int, hour: Int, min: Int, turn: Int, foodType: String, isTimerOn: Bool
//        let food = FoodManager.createFood(ondo, hour, min, turn, foodType, false) ㅗㅗㅗ
        
//        foodViewModel.addFood(food)
        print("생성되었음 \(foodViewModel.foods.count)")
        
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
