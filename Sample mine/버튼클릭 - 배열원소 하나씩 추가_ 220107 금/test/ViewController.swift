//
//  ViewController.swift
//  test
//
//  Created by inooph on 2021/12/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var bttn: UIButton!
    @IBOutlet weak var lblText: UILabel!
    var intArray = [1, 2, 3]
    var testArray: [Int] = []
    
    
    var tempStringForButton: String {
        var Sstring = ""
        for i in testArray {
            Sstring += "\(i), "
        }
        
        return Sstring
    }
    lazy var number: Int = intArray.min()!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(number)
        
        self.testArray = [Int]()
    }

    @IBAction func tappedBtn(_ sender: UIButton) {
//        intArray.insert(number - 1, at: 0)
//        print(intArray)
//        number -= 1
//        let stringTemp = "count: \(intArray.count) / \(intArray.min()!)"
//        bttn.setTitle(stringTemp, for: .normal)
        testArray.append(number)
        number += 1
        let stringTemp = "count: \(testArray.count)"
        bttn.setTitle(stringTemp, for: .normal)
        lblText.text = tempStringForButton
        
        print(tempStringForButton)
        
    }
    
}

