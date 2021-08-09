//
//  ViewController.swift
//  simpleTimerFor_AirFryer
//
//  Created by inooph on 2021/07/15.
//

import UIKit
import UserNotifications

class AFTimerViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    let foodViewModel = FoodViewModel.shared
    var startTime: Date?
    var tmpFoodFor_LocalPush: Food? // 스위치 탭시에 할당 됨
    
    var timer = Timer()
    let userNotiCenter = UNUserNotificationCenter.current()
    var tmpIndexOfFood: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.didDismiss_EditTimerViewController(_:)), name: didDismiss_EditTimerViewController, object: nil)
        foodViewModel.loadFoods()
        collectionView.reloadData()
        
        requestAuthNoti()
//        notiOutside(Double(food.totalSec)) // 스위치 켜질 때 기준으로!
//        notiOutside(3)
    }
    
    
    
    
    
    
    
    // 사용자에게 알림 권한 요청
        func requestAuthNoti() {
            let notiAuthOptions = UNAuthorizationOptions(arrayLiteral: [.alert, .badge, .sound])
            userNotiCenter.requestAuthorization(options: notiAuthOptions) { (success, error) in
                if let error = error {
                    print(#function, error)
                }
            }
        }

        // 알림 전송
        func requestSendNoti(seconds: Double) {
            let notiContent = UNMutableNotificationContent()
            notiContent.title = "알림 title"
            notiContent.body = "알림 body"
            notiContent.userInfo = ["targetScene": "splash"] // 푸시 받을때 오는 데이터

            // 알림이 trigger되는 시간 설정
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: false)

            let request = UNNotificationRequest(
                identifier: UUID().uuidString,
                content: notiContent,
                trigger: trigger
            )

            userNotiCenter.add(request) { (error) in
                print(#function, error)
            }
            print("\n\n----->---> requestSendNoti(seconds: Double) Called")
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
        var food: Food = foodViewModel.foods[indexPath.item]
        cell.tmpFoodFromCell = food
        cell.updateUI(food: food)
        cell.viewController = self
        cell.indexInt = indexPath.item
        
        
        
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
//                AFTimerViewController.notiOutside(Double(food.totalSec-1))
                return
            }
            food.isTimerOn = true
            cell.setTimer(startTime: startTime, food: food) // 라벨을 바꿈
            
            
            
            
            
            self.tmpIndexOfFood = indexPath.item
            self.tmpFoodFor_LocalPush = food
//            self.setTimer(startTime: startTime, food: food)
        }
        self.foodViewModel.updateFood(food)
//        self.notiOutside(Double(food.totalSec)) // 스위치 켜질 때 기준으로!
        
        
        
        
        
//        if cell.timerSwitch.isOn == false {
//            timer.invalidate() // 현재 뷰컨트롤러의 타이머 종료
//        }
//        if cell.timerIsDone == true {
//            timer.invalidate() // 현재 뷰컨트롤러의 타이머 종료
//        }
        if food.isTimerOn == true {
            print("\n\n\n---> 149Line / AFTimerViewController - food.isTimerOn == TRUE ")
//            notiOutside(1) tmpIndexOfFood
        }
        if food.isTimerOn == false {
            print("\n\n\n---> 149Line / AFTimerViewController - food.isTimerOn == false ")
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
    
    
    
//    func setTimer(startTime: Date, food: Food) {
//        print("\n\n---> [뷰컨트롤러] setTimer Func Called")
//        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] timer in
//            let elapsedTimeSeconds = Int(Date().timeIntervalSince(startTime))
//            var expireLimit = food.totalSec //hourToSec + minToSec // 초로 환산
//
//            if food.foodName == "test" { expireLimit = 4 } // test일 때 10초
//
//            var tmpStr = expireLimit - elapsedTimeSeconds // 종료시간 - 시작시간
//
//            let (h, m, s) = self.returnHMS(&tmpStr)
//
//            //                showAlert(h, m, s)
//            if h <= 0 && m <= 0 && s <= 0 {
//                timer.invalidate()
//                //                    self.notiOutside()
//            }
//        }
//    }
//
    func returnHMS(_ inputTotal: inout Int) -> (h: Int, m: Int, s: Int) {
        let h = inputTotal / ( 60 * 60 )
        inputTotal %= 60 * 60
        
        let m = inputTotal / 60
        inputTotal %= 60
        let s = inputTotal
        return (h, m, s)
    }
    
    
    //        if food.isTimerOn == true {
    //            print("\n\n\n- ------> AFTimerCell 100 Line")
    //            AFTimerViewController.notiOutside(Double(food.totalSec))
    //        }
    
    
    
    static func notiOutside(_ second: Double) {
//         func notiOutside(_ second: Double) {
        print("\n\n\n\n\n\n\n---------> [뷰컨트롤러] notiOutside 호출 됨 - 함수 시작")
        
//        tmpFoodFor_LocalPush // 탭 시작 시 값이 할당 됨
        /*
         할일
         - [] 타이머가 켜지면 이 메소드가 호출돼야함
         
         시나리오
         - 뷰모델에서 [Food] 받아온 뒤 isTimerOn값이 있는 거 체크?
         - 뷰셀에서 타이머 끝나면 뷰컨 타입메소드에 전달?
         
         */
        
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = "Reminder"
        content.body = "This is a local notification"
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: second-1, repeats: false)
        
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








extension AFTimerViewController: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
}
