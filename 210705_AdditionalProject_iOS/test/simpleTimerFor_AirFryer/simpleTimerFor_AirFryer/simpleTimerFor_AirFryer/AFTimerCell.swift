//
//  AFTimerCell.swift
//  simpleTimerFor_AirFryer
//
//  Created by inooph on 2021/07/15.
//

import UIKit

class AFTimerCell: UICollectionViewCell {
    @IBOutlet weak var foodTitleLabel: UILabel!
    @IBOutlet weak var ondoLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var turnNumLabel: UILabel!
    @IBOutlet weak var foodTypeBtn: UIButton!
    
    @IBOutlet weak var timerDescriptionLabel: UILabel!
    
    @IBOutlet weak var timerStartLabel: UILabel!
    @IBOutlet weak var timerSwitch: UISwitch!
    var cornerRadius: CGFloat = 5.0
    
    private let uiLabelCGColArr = [CGColor(red: 1, green: 0, blue: 0, alpha: 0.2),
                                   CGColor(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 0.2),
                                   CGColor(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 0.2),
                                   CGColor(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 0.2),
                                   CGColor(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 0.2),
                                   CGColor(red: 0.2196078449, green: 0.2030190556, blue: 0.8549019694, alpha: 0.2),
                                   CGColor(red: 0.5, green: 0.007843137719, blue: 0.4200693323, alpha: 0.2)]
    
    var timerTapHandler: (()-> Void)?
    var closeBtnHandler: (()-> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        reset()
        timerSwitch.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        
        
        // Apply rounded corners to contentView
        contentView.layer.cornerRadius = cornerRadius
        contentView.layer.masksToBounds = true
        
        // Set masks to bounds to false to avoid the shadow
        // from being clipped to the corner radius
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = false
        
        // Apply a shadow
        layer.shadowRadius = 8.0
        layer.shadowOpacity = 0.10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 5)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Improve scrolling performance with an explicit shadowPath
        layer.shadowPath = UIBezierPath(
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
        turnNumLabel.text = "\(food.turningFood)번" // 뒤집는 횟수
        
        // [x] 라벨별 색 변경
        foodTypeBtn.setTitle(food.foodType, for: .normal) // 음식 분류, 채소, 고기 등
        let col = findLabelBgColor(food.foodType)
        foodTypeBtn.layer.backgroundColor = col
        foodTypeBtn.layer.cornerRadius = 5
        
        // [x] 타이머 켜기끄기
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
    
    func reset() {
        
    }
    
    @IBAction func switchTapped(_ sender: Any) {
        if timerSwitch.isOn {
            // [] 타이머 On
            timerDescriptionLabel.text = timerSwitch.isOn ? "타이머 끄기" : "타이머 켜기"
            print("===> timer is on")
        } else {
            // [] 타이머 off
            timerDescriptionLabel.text = timerSwitch.isOn ? "타이머 끄기" : "타이머 켜기"
            print("===> timer is OFF")
        }
        timerTapHandler?()
    }
    @IBAction func closeBtnTapped(_ sender: Any) {
        closeBtnHandler?()
    }
}
