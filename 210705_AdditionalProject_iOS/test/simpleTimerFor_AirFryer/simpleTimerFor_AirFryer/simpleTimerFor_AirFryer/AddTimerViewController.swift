//
//  AddTimerViewController.swift
//  simpleTimerFor_AirFryer
//
//  Created by inooph on 2021/07/16.
//

import UIKit

class AddTimerViewController: UIViewController {
    @IBOutlet weak var foodNameTxt: UITextField!
    @IBOutlet weak var ondoTxt: UITextField!
    @IBOutlet weak var hourTxt: UITextField!
    @IBOutlet weak var minTxt: UITextField!
    @IBOutlet weak var turnTimeTxt: UITextField!
    
    @IBOutlet weak var gogiLabel: UILabel!
    @IBOutlet weak var snackLabel: UILabel!
    @IBOutlet weak var ganpeyonLabel: UILabel!
    @IBOutlet weak var breadLabel: UILabel!
    @IBOutlet weak var chesoLabel: UILabel!
    @IBOutlet weak var hesanmulLabel: UILabel!
    @IBOutlet weak var etcFoodLabel: UILabel!
    
    private var uiTextLabel = [UILabel]()
    private let uiLabelColorArr = [#colorLiteral(red: 1, green: 0, blue: 0, alpha: 0.2), #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 0.2), #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 0.2), #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 0.2), #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 0.2), #colorLiteral(red: 0.2196078449, green: 0.2030190556, blue: 0.8549019694, alpha: 0.2), #colorLiteral(red: 0.5, green: 0.007843137719, blue: 0.4200693323, alpha: 0.2)]
    
    
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        uiTextLabel = [gogiLabel, snackLabel, ganpeyonLabel, breadLabel, chesoLabel, hesanmulLabel, etcFoodLabel]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reset(uiTextLabel)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func reset(_ uxTxtF: [UILabel]) {
        var i: Int = 0
        for item in uxTxtF {
            item.backgroundColor = uiLabelColorArr[i]
            item.layer.cornerRadius = 5
            
//            item.layer.borderColor =
//            item.layer.borderWidth = 10
            
            print("\(i + 1)")
            i += 1
            //item.addLeftPadding()
        }
    }
    
    @IBAction func addButtonTap(_ sender: Any) {
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
