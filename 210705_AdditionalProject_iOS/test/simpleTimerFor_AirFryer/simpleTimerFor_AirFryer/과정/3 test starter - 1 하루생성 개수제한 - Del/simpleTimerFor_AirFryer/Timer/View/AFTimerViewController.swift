//
//  ViewController.swift
//  simpleTimerFor_AirFryer
//
//  Created by inooph on 2021/07/15.
//

import UIKit

class AFTimerViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    let foodViewModel = FoodViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad() // Do any additional setup after loading the view.
        foodViewModel.loadFoods()
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
