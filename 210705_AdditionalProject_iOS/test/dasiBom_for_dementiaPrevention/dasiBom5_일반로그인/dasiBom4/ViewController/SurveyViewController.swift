//
//  SurveyViewController.swift
//  dasiBom4
//
//  Created by inooph on 2021/08/01.
//

import UIKit

class SurveyViewController: UIViewController {
    let viewModel = QuestionViewModel.shared
    @IBOutlet weak var submitBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let navigationBar = navigationController?.navigationBar else { return }
        navigationBar.prefersLargeTitles = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        submitBtn.layer.cornerRadius = 10
    }
    
    @IBAction func submitBtn_Tapped(_ sender: Any) {
        checkTrue()
    }
    
    func checkTrue() {
        print("\n\n ------------>>>>>>>>>>> 111")
        var tmpBool = false
        let tmpRange = 0...13
        
        
        let queArr = viewModel.getQueArr()
        
        for i in tmpRange {
            if i == 0 {
                print("\n0번째 ----- 점수 : \(queArr[0].score) / 체크여부 : \(queArr[0].checked)")
            } else {
                print("\n\(i)번째 ----- 점수 : \(queArr[i].score) / 체크여부 : \(queArr[i].checked)")
            }
        }
        print("\n\n ------------>>>>>>>>>>> 333")
    }
}


extension SurveyViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.questionArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? QuestionTableViewCell else {
            return UITableViewCell()
        }
        let survey = viewModel.questionArr[indexPath.row]
        cell.update(info: survey, index: indexPath.row)
        return cell
    }
}
