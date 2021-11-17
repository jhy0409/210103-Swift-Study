//
//  DetailViewController.swift
//  Onepiece2nd
//
//  Created by inooph on 2021/11/17.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imgVIew: UIImageView!
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
            nameLabel.text = name + ""
            let img = UIImage(named: "\(name).jpg")
            imgVIew.image = img
            bountyLabel.text = "\(bounty)"
            
            print("Detail VC\nname : \(name), bounty: \(bounty)")
        }
    }
    
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
