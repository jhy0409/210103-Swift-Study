//
//  DetailViewController.swift
//  BountyList
//
//  Created by inooph on 2021/04/05.
//

import UIKit

class DetailViewController: UIViewController {
    // MVVM
    
    // Model
    // - BountyInfo
    // > BountyInfo 만들기
    
    // View
    // - imgView, nameLabel, bountylabel
    // > view들은 viewModel을 통해서 구성
    
    // ViewModel
    // - DetailViewModel
    // > 뷰레이어에서 필요한 메서드 만들기
    // > 모델 가지고 있기. BountyInfo
    
    @IBOutlet weak var ImgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
//    var name: String?
//    var bounty: Int?
    let viewModel = DetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    func updateUI() {
//        if let bountyInfo = self.bountyInfo {
        if let bountyInfo = viewModel.bountyInfo {
            ImgView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
        }
        
        //if let name = self.name, let bounty = self.bounty {
        //    let img = UIImage(named: "\(name).jpg")
        //    ImgView.image = img
        //    nameLabel.text = name
        //    bountyLabel.text = "\(bounty)"
        //}
    }
    
    
    // completion 완료 후 동작
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

class DetailViewModel {
    var bountyInfo: BountyInfo?
    
    func update(model: BountyInfo?) {
        bountyInfo = model
    }
}
