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
    var paramArr: [Food] = []
    
//    let foodManager: FoodManager = FoodManager.shared
    override func viewDidLoad() {
        super.viewDidLoad() // Do any additional setup after loading the view.
        foodViewModel.loadFoods()
        paramArr = foodViewModel.manager.getFoodsArr()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        let food = Storage.restoreFood("foods.json")
//        print("---> restore from disk: \(String(describing: food))")
    }
}

extension AFTimerViewController: UICollectionViewDataSource {
    // [] item 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 10
        return foodViewModel.foods.count
    }
    
    // [] cell 표시
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AFTimerCell", for: indexPath) as? AFTimerCell else { return UICollectionViewCell() }
        let food: Food = foodViewModel.foods[indexPath.item]
        cell.updateUI(food: food)
        
        cell.closeBtnHandler = {
            self.foodViewModel.deleteFood(food)
            self.collectionView.reloadData()
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
