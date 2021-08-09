//
//  AFTimerCell.swift
//  simpleTimerFor_AirFryer
//
//  Created by inooph on 2021/07/15.
//

import UIKit
import UserNotifications

class AFTimerCell: UICollectionViewCell {
    @IBOutlet weak var foodTitleLabel: UILabel!
    @IBOutlet weak var ondoLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var turnNumLabel: UILabel!
    @IBOutlet weak var foodTypeBtn: UIButton!
    
    @IBOutlet weak var timerDescriptionLabel: UILabel!
    @IBOutlet weak var timerStartLabel: UILabel!
    @IBOutlet weak var timerSwitch: UISwitch!
    var cornerRadius: CGFloat = 10
    
    private let uiLabelCGColArr = [CGColor(red: 1, green: 0, blue: 0, alpha: 0.2),
                                   CGColor(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 0.2),
                                   CGColor(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 0.2),
                                   CGColor(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 0.2),
                                   CGColor(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 0.2),
                                   CGColor(red: 0.2196078449, green: 0.2030190556, blue: 0.8549019694, alpha: 0.2),
                                   CGColor(red: 0.5, green: 0.007843137719, blue: 0.4200693323, alpha: 0.2)]
    
    var timerTapHandler: (()-> Void)?
    var closeBtnHandler: (()-> Void)?
    var startTime: Date?
    var timer = Timer()
    
    weak var viewController: UIViewController?
    var tmpFoodStr: String? // 타이머 실행전 기본값
    var tmpFoodFromCell: Food?
    
    //    var timerIsDone: Bool?
    var indexInt: Int? // 바깥쪽에서 indexpath.item 꽂혀들어옴
    let foodViewModel = FoodViewModel.shared
    
    override func awakeFromNib() {
        super.awakeFromNib()
        foodTypeBtn.isEnabled = false
        timerSwitch.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        
        contentView.layer.cornerRadius = cornerRadius // Apply rounded corners to contentView
        contentView.layer.masksToBounds = true
        
        layer.cornerRadius = cornerRadius // Set masks to bounds to false to avoid the shadow
        layer.masksToBounds = false // from being clipped to the corner radius
        
        layer.shadowRadius = 8.0 // Apply a shadow
        layer.shadowOpacity = 0.10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 5)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.shadowPath = UIBezierPath( // Improve scrolling performance with an explicit shadowPath
            roundedRect: bounds,
            cornerRadius: cornerRadius
        ).cgPath
    }
    
    func updateUI(food: Food?) {
        guard let food = food else { return }
        foodTitleLabel.text = "\(food.foodName)"
        ondoLabel.text = "\(food.ondo)℃" // 온도
        let h = String(food.hour), m = String(food.min)
        timerLabel.text = "\(h)시간 \(m)분" // 시간
        timerStartLabel.text = "\(h) : \(m)"
        tmpFoodStr = "\(h) : \(m)" // 타이머 실행전 기본값
        turnNumLabel.text = "\(food.turningFood)번" // 뒤집는 횟수
        
        // [ㅇ] 라벨별 색 변경
        foodTypeBtn.setTitle(food.foodType, for: .normal) // 음식 분류, 채소, 고기 등
        let col = findLabelBgColor(food.foodType)
        foodTypeBtn.layer.backgroundColor = col
        foodTypeBtn.layer.cornerRadius = 5
        
        // [ㅇ] 타이머 켜기끄기
        timerDescriptionLabel.text = timerSwitch.isOn ? "타이머 끄기" : "타이머 켜기"
    }
    
    func findLabelBgColor(_ str: String) -> CGColor {
        switch str {
        case "고기" :
            return uiLabelCGColArr[0]
        case "과자" :
            return uiLabelCGColArr[1]
        case "냉동식품" :
            return uiLabelCGColArr[2]
        case "빵" :
            return uiLabelCGColArr[3]
        case "야채" :
            return uiLabelCGColArr[4]
        case "해산물" :
            return uiLabelCGColArr[5]
        case "기타" :
            return uiLabelCGColArr[6]
        default:
            return uiLabelCGColArr[6]
        }
    }
    
    func setTimer(startTime: Date, food: Food) {
        if timerSwitch.isOn == false {
            let h = food.hour, m = food.min
            timerStartLabel.text = "\(h) : \(m)"
            print("===> timer is OFF : setTimer [ timer.invalidate() ]")
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
                let elapsedTimeSeconds = Int(Date().timeIntervalSince(startTime))
                
                var expireLimit = food.totalSec //hourToSec + minToSec // 초로 환산
                if food.foodName == "test" { expireLimit = 4 } // test일 때 10초
                
                var tmpStr = expireLimit - elapsedTimeSeconds // 종료시간 - 시작시간
                
                let (h, m, s) = returnHMS(&tmpStr)
                let remainSeconds = "\(h)시 \(m)분 \(s)초"
                self?.timerStartLabel.text = String(describing: remainSeconds.self)
                
                if h <= 0 && m <= 0 && s <= 0 {
                    resetSwitch()
                    timer.invalidate()
                    return
                }
            }
        }
        
        func resetSwitch() {
            timerSwitch.isOn = false
            timerDescriptionLabel.text = timerSwitch.isOn ? "타이머 끄기" : "타이머 켜기"
            timerStartLabel.text = tmpFoodStr
            
            guard let index = indexInt else { return }
            foodViewModel.foods[index].isTimerOn = false
            print("===> timer is OFF : reset Switch ")
        }
        
        func returnHMS(_ inputTotal: inout Int) -> (h: Int, m: Int, s: Int) {
            let h = inputTotal / ( 60 * 60 )
            inputTotal %= 60 * 60
            
            let m = inputTotal / 60
            inputTotal %= 60
            let s = inputTotal
            return (h, m, s)
        }
    }
}

extension AFTimerCell {
    @IBAction func switchTapped(_ sender: Any) {
        if timerSwitch.isOn {
            // [ㅇ] 타이머 On
            timerDescriptionLabel.text = timerSwitch.isOn ? "타이머 끄기" : "타이머 켜기"
            print("===> timer is on")
            timerTapHandler?()
            
            if tmpFoodFromCell?.foodName == "test" {
                AFTimerViewController.notiOutside(Double(5))
            } else {
                guard let sec = tmpFoodFromCell?.totalSec else { print("\n\n\n\n\n-> second Fail AFTimerCell return Line 211 "); return }
                AFTimerViewController.notiOutside(Double(sec + 1))
            }
        } else {
            // [ㅇ] 타이머 off
            timerDescriptionLabel.text = timerSwitch.isOn ? "타이머 끄기" : "타이머 켜기"
            print("===> timer is OFF")
            timerTapHandler?()
        }
    }
    
    @IBAction func closeBtnTapped(_ sender: Any) {
        closeBtnHandler?()
    }
    
    @IBAction func editBtnTapped(_ sender: Any) {
        print("\n수정버튼 눌림")
        guard let editVC = viewController?.storyboard?.instantiateViewController(identifier: "EditTimerViewController") as? EditTimerViewController else { return }
        editVC.tmpFood = tmpFoodFromCell
        viewController?.present(editVC, animated: true, completion: nil)
    }
}
