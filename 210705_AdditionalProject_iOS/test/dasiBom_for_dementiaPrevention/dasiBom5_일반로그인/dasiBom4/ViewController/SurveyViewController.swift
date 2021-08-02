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
         showAlert("검사결과", checkTrue())
    }
    
    func checkTrue() -> (Bool, String) {
        let tmpRange = 0...13
        let queArr = viewModel.getQueArr()
        var totalSum: Int = 0
        
        for i in tmpRange {
            guard let tmpScore = queArr[i].score, let tmpChecked = queArr[i].checked
            else {
                showAlert("알림창", "누락된 항목이 있습니다.")
                return (false, "")
            }
            totalSum += queArr[i].score! // cell에서 체크시 점수를 주므로 강제추출 가능
        }
        return (true, "\(totalSum)")
    }
    
    func showAlert(_ title: String, _ msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showAlert(_ title: String, _ msg: (Bool, String)) {
        guard msg.0 == true else { return }
        
        let alert = UIAlertController(title: title, message: "검사결과는 \(msg.1)", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
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
