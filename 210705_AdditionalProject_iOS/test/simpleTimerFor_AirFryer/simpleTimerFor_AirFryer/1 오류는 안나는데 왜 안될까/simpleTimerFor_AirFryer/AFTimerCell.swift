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
    
    var startTime: Date?
    var timer = Timer()
    var tempFood: Food?
    
    weak var viewController: UIViewController?
    var tmpFoodStr: String?
    var showAlert2: (() -> Void)?
    var tmpBool: Bool?
    
    override func awakeFromNib() {
        super.awakeFromNib()
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
        tmpFoodStr = "\(h) : \(m)" // 타이머 실행전 기본값
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
    
    @IBAction func switchTapped(_ sender: Any) {
        if timerSwitch.isOn {
            // [] 타이머 On
            timerDescriptionLabel.text = timerSwitch.isOn ? "타이머 끄기" : "타이머 켜기"
            print("===> timer is on")
            timerTapHandler?()
        } else {
            // [] 타이머 off
            timerDescriptionLabel.text = timerSwitch.isOn ? "타이머 끄기" : "타이머 켜기"
            print("===> timer is OFF")
            timerTapHandler?()
        }
    }
    
    @IBAction func closeBtnTapped(_ sender: Any) {
        closeBtnHandler?()
    }
    
    func setTimer(startTime: Date, food: Food) {
        if timerSwitch.isOn == false {
            timer.invalidate()
            guard let food = tempFood else { return }
            let h = food.hour, m = food.min
            timerStartLabel.text = "\(h) : \(m)"
            return
        }
        
        if self.tmpBool == true {
//                    showAlert2(expireLimit)
//                    guard let sec = self!.tempFood?.totalSec else { return }
            showAlert2?()
            resetSwitch()
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
                let elapsedTimeSeconds = Int(Date().timeIntervalSince(startTime))
                
                let hourToSec = (food.hour) * 60 * 60
                let minToSec = food.min * 60
                let expireLimit = hourToSec + minToSec // 초로 환산
                
                guard (elapsedTimeSeconds <= expireLimit) else { // 시간 초과한 경우
                    timer.invalidate()
                    return
                }
                
                var tmpStr = expireLimit - elapsedTimeSeconds // 종료시간 - 시작시간
                
                let (h, m, s) = returnHMS(&tmpStr)
                let remainSeconds = "\(h)시 \(m)분 \(s)초"
                self?.timerStartLabel.text = String(describing: remainSeconds.self)
                
//                showAlert(h, m, s)
                self?.tmpBool = h == 0 && m == 0 && s == 0
                guard let tB = self?.tmpBool else { return }
                print("tmpBool 1: \(tB)")
            }
        }
        

        

        
//        func showAlert(_ h: Int, _ m: Int, _ s: Int){
//            if h == 0 && m == 0 && s == 0 {
//                let alertController = UIAlertController(title: "알림", message: "설정한 시간이 다 되었습니다.", preferredStyle: .alert)
//
//                let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
//                alertController.addAction(defaultAction)
//                viewController?.present(alertController, animated: true, completion: nil)
//                resetSwitch()
//            } else { return }
//        }
        
//        func showAlert2(_ input: Int){
//                print("showAlert2 called")
//                let content = UNMutableNotificationContent()
//                content.title = "This is title : Zedd"
//                content.subtitle = "This is Subtitle : UserNotifications tutorial"
//                content.body = "This is Body : 블로그 글 쓰기"
//                content.summaryArgument = "Alan Walker"
//                content.summaryArgumentCount = 40
//                
//                let TimeIntervalTrigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(input), repeats: false)
//                
//                let request = UNNotificationRequest(identifier: "수행", content: content, trigger: TimeIntervalTrigger)
//                UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
//            
//        }
        func returnHMS(_ input: inout Int) -> (h: Int, m: Int, s: Int) {
            let h: Int = input / ( 60 * 60 )
            input %= 60 * 60
            
            let m: Int = input / 60
            input %= 60
            let s: Int = input
            
            return (h, m, s)
        }
    }
}

extension AFTimerCell {
    func resetSwitch() {
        timerSwitch.isOn = false
        timerDescriptionLabel.text = timerSwitch.isOn ? "타이머 끄기" : "타이머 켜기"
        timerStartLabel.text = tmpFoodStr
        tmpBool = false
        print("===> timer is OFF")
    }
    

}


