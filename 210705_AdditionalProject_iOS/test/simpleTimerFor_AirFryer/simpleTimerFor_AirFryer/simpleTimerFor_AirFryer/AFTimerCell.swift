//
//  AFTimerCell.swift
//  simpleTimerFor_AirFryer
//
//  Created by inooph on 2021/07/15.
//

import UIKit

class AFTimerCell: UICollectionViewCell {
    @IBOutlet weak var ondoLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var turnNumLabel: UILabel!
    @IBOutlet weak var foodTypeLabel: UILabel!
    
    @IBOutlet weak var timerDescriptionLabel: UILabel!
    @IBOutlet weak var timerSwitch: UISwitch!
    var cornerRadius: CGFloat = 5.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
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
        reset()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Improve scrolling performance with an explicit shadowPath
        layer.shadowPath = UIBezierPath(
            roundedRect: bounds,
            cornerRadius: cornerRadius
        ).cgPath
    }
    
    
    
    
    func updateUI(food: Food) {
        ondoLabel.text = "\(food.ondo)℃" // 온도
        let hour = food.hour, min = food.min
        timerLabel.text = "\(hour)시간 \(min)분" // 시간
        turnNumLabel.text = "\(food.turningFood)번" // 뒤집는 횟수
        foodTypeLabel.text = food.foodType // 음식 분류, 채소, 고기 등
        
        timerDescriptionLabel.text = timerSwitch.isOn ? "타이머 끄기" : "타이머 켜기"
        // 타이머 켜기끄기
    }
    
    func reset() {
        
    }
}
