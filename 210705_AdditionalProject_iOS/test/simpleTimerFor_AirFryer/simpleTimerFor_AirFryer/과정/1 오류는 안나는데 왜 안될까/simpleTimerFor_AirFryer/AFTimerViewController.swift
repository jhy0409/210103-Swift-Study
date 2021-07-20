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
    let foodViewModel = FoodViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad() // Do any additional setup after loading the view.
        foodViewModel.loadFoods()
        
        // MARK: - 여기 options에 원하는 option넣기.
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound], completionHandler: { (didAllow, error) in
            if didAllow {
                print("did Allowed")
            } else {
                print("error : \(error?.localizedDescription ?? String())")
            }
        })
        UNUserNotificationCenter.current().delegate = self
    }
    
    
    
    
    
    var startTime: Date?
    var timer = Timer()
    
    deinit {
        print("----> deinit")
        timer.invalidate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.collectionView.reloadData()
    }
}

extension AFTimerViewController: UICollectionViewDataSource {
    // [x] item 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodViewModel.foods.count
    }
    
    // [x] cell 표시
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AFTimerCell", for: indexPath) as? AFTimerCell else { return UICollectionViewCell() }
        let food: Food = foodViewModel.foods[indexPath.item]
        cell.updateUI(food: food)
        cell.viewController = self
        
        // [x] 삭제 버튼 누를 때 동작
        cell.closeBtnHandler = {
            self.foodViewModel.deleteFood(food)
            self.collectionView.reloadData()
        }
        
        // [x] 타이머 스위치 누를 때 동작
        cell.timerTapHandler = {
            guard let startTime = self.startTime else  {
                cell.tempFood = food
                cell.setTimer(startTime: Date(), food: food)
                return
            }
            cell.setTimer(startTime: startTime, food: food)
        }
        self.foodViewModel.updateFood(food)
        
        // [] cell alert
        cell.showAlert2 = { 
            let tmpSec = food.totalSec
            if cell.tmpBool == true {
                print("showAlert2 called")
                
                let content = UNMutableNotificationContent()
                content.title = "This is title : Zedd"
                content.subtitle = "This is Subtitle : UserNotifications tutorial"
                content.body = "This is Body : 블로그 글 쓰기"
                content.summaryArgument = "Alan Walker"
                content.summaryArgumentCount = 40
                
                let TimeIntervalTrigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(tmpSec), repeats: false)
                
                let request = UNNotificationRequest(identifier: "수행", content: content, trigger: TimeIntervalTrigger)
                UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            }
        }
        
        return cell
    }
}

// [x] 콜렉션뷰 레이아웃
extension AFTimerViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSpacing: CGFloat = 10
        let margin: CGFloat = 20
        let width = (collectionView.bounds.width - itemSpacing - (margin * 2)) / 2
        let height = width + 150
        return CGSize(width: width, height: height)
    }
}


extension AFTimerViewController : UNUserNotificationCenterDelegate {
    //To display notifications when app is running  inforeground
    
    //앱이 foreground에 있을 때. 즉 앱안에 있어도 push알림을 받게 해줍니다.
    //viewDidLoad()에 UNUserNotificationCenter.current().delegate = self를 추가해주는 것을 잊지마세요.
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UNNotification?) {
        let settingsViewController = UIViewController()
        settingsViewController.view.backgroundColor = .gray
        self.present(settingsViewController, animated: true, completion: nil)
    }
}
