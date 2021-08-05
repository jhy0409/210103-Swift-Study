//
//  ViewResultTableViewCell.swift
//  dasiBom4
//
//  Created by inooph on 2021/08/04.
//

import UIKit

class ViewResultTableViewCell: UITableViewCell {
    @IBOutlet weak var lbName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    //MARK: - setCoderName
    func setCoderName(_ name: String) {
        self.lbName.text = name
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
