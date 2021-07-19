//
//  SettingViewController.swift
//  simpleTimerFor_AirFryer
//
//  Created by inooph on 2021/07/19.
//

import UIKit

class SettingTableViewController: UITableViewController {
    @IBOutlet weak var downSample: UISwitch!
    @IBOutlet weak var versionDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downSample.isOn = false
        // Do any additional setup after loading the view.
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
