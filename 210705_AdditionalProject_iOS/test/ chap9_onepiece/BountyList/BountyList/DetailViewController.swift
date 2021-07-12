//
//  DetailViewController.swift
//  BountyList
//
//  Created by inooph on 2021/04/05.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var ImgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    var name: String?
    var bounty: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    func updateUI() {
        if let name = self.name, let bounty = self.bounty {
            let img = UIImage(named: "\(name).jpg")
            ImgView.image = img
            nameLabel.text = name
            bountyLabel.text = "\(bounty)"
        }
    }
    
    
    // completion 완료 후 동작
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
