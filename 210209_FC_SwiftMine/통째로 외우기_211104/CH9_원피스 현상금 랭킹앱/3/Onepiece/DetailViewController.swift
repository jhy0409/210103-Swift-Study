//
//  DetailViewController.swift
//  Onepiece3rd
//
//  Created by inooph on 2021/11/25.
//

import UIKit

class DetailViewController: UIViewController {
    var name: String?
    var bounty: Int?
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblBounty: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        guard let name = self.name, let bounty = self.bounty else { return }
        imgView.image = UIImage(named: "\(name).jpg")
        lblName.text = name
        lblBounty.text = "\(bounty)"
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
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
