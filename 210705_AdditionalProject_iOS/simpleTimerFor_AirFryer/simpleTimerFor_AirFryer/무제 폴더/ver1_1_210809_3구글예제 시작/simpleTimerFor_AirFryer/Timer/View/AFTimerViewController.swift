//
//  ViewController.swift
//  simpleTimerFor_AirFryer
//
//  Created by inooph on 2021/07/15.
//

import UIKit
//import UserNotifications

class AFTimerViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    let foodViewModel = FoodViewModel()
    var startTime: Date?
    
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.didDismiss_EditTimerViewController(_:)), name: didDismiss_EditTimerViewController, object: nil)
        foodViewModel.loadFoods()
        collectionView.reloadData()
    }
    
    // [ㅇ] 타이머 수정 모달창이 닫힌 후 컬렉션뷰 업데이트
    let didDismiss_EditTimerViewController: Notification.Name = Notification.Name("EditTimerViewController")
    
    @objc func didDismiss_EditTimerViewController(_ noti: Notification) {
        OperationQueue.main.addOperation {
            self.collectionView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.collectionView.reloadData()
        let editController = EditTimerViewController()
        editController.isDismissed = { [weak self] in
            self?.collectionView.reloadData()
        }
    }
}

extension AFTimerViewController: UICollectionViewDataSource {
    // [ㅇ] item 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodViewModel.foods.count
    }
    
    // [ㅇ] cell 표시
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AFTimerCell", for: indexPath) as? AFTimerCell else { return UICollectionViewCell() }
        let food: Food = foodViewModel.foods[indexPath.item]
        cell.tmpFoodFromCell = food
        cell.updateUI(food: food)
        cell.viewController = self
        
        // [ㅇ] 삭제 버튼 누를 때 동작
        cell.closeBtnHandler = {
            self.foodViewModel.deleteFood(food)
            self.collectionView.reloadData()
        }
        
        // [ㅇ] 타이머 스위치 누를 때 동작
        cell.timerTapHandler = {
            self.startTime = Date()
            guard let startTime = self.startTime else  {
                cell.setTimer(startTime: Date(), food: food)
                return
            }
            cell.setTimer(startTime: startTime, food: food) // 라벨을 바꿈
            self.setTimer(startTime: startTime, food: food)
        }
        self.foodViewModel.updateFood(food)
        
        
        
        
        
        if cell.timerSwitch.isOn == false {
            timer.invalidate()
        }
        
        
        return cell
    }
}

// [ㅇ] 콜렉션뷰 레이아웃
extension AFTimerViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSpacing: CGFloat = 10
        let margin: CGFloat = 20
        let width = (collectionView.bounds.width - itemSpacing - (margin * 2)) / 2
        let height = width + 150
        return CGSize(width: width, height: height)
    }
    
    
    
    func setTimer(startTime: Date, food: Food) {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                let elapsedTimeSeconds = Int(Date().timeIntervalSince(startTime))
                
                var expireLimit = food.totalSec //hourToSec + minToSec // 초로 환산
                if food.foodName == "test" { expireLimit = 4 } // test일 때 10초
                
                var tmpStr = expireLimit - elapsedTimeSeconds // 종료시간 - 시작시간
                
                let (h, m, s) = self.returnHMS(&tmpStr)
                
//                showAlert(h, m, s)
                if h <= 0 && m <= 0 && s <= 0 {
                    timer.invalidate()
                    self.notiOutside()
                }
        }
        
//        func showAlert(_ h: Int, _ m: Int, _ s: Int){
//            if h == 0 && m == 0 && s == 0 {
//                let alertController = UIAlertController(title: "알림", message: "설정한 시간이 다 되었습니다.", preferredStyle: .alert)
//
//                let defaultAction = UIAlertAction(title: "닫기", style: .default, handler: nil)
//                alertController.addAction(defaultAction)
//                present(alertController, animated: true, completion: nil)
//                resetSwitch()
//            } else { return }
//        }
        
//        func resetSwitch() {
//            timerSwitch.isOn = false
//            timerDescriptionLabel.text = timerSwitch.isOn ? "타이머 끄기" : "타이머 켜기"
//            timerStartLabel.text = tmpFoodStr
//            timer.invalidate()
//            print("===> timer is OFF : reset Switch [ timer.invalidate() ]")
//        }
    }
    
    func returnHMS(_ inputTotal: inout Int) -> (h: Int, m: Int, s: Int) {
        let h = inputTotal / ( 60 * 60 )
        inputTotal %= 60 * 60
        
        let m = inputTotal / 60
        inputTotal %= 60
        let s = inputTotal
        return (h, m, s)
    }
    
    func notiOutside() {
        print("\n\n\n\n\n\n\n---------> notiOutside 호출 됨 - 함수 시작")
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = "Reminder"
        content.body = "This is a local notification"
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.001, repeats: false)
        
        let request = UNNotificationRequest(identifier: "reminder", content: content, trigger: trigger)
        center.add(request) { (error) in
            if error != nil {
                print("\n\n\n ---> Error : \(error?.localizedDescription)")
            }
//                DispatchQueue.main.async {
//                    resetSwitch()
//                }
        }
        
        print("\n\n\n\n\n\n\n---------> notiOutside 호출 됨 - 함수 종료")
    }
}
