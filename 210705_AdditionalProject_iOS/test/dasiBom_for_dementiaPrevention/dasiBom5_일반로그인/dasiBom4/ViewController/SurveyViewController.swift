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
    /*
     Todo
     [] 제출버튼 클릭 시 파이어베이스 연동
     [] 결과조회 탭 - 그전 검사결과 받아오기
        - [] 예외처리 : 검사이력 없을 시 perform Segue(검사탭으로 이동)
     
     [] 게임하기 탭 - 게임이력 파이어베이스 연동
     */
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
    
    func checkTrue() -> (Bool, Int) {
        let tmpRange = 0...13
        let queArr = viewModel.getQueArr()
        var totalSum: Int = 0
        
        for i in tmpRange {
            guard let tmpScore = queArr[i].score, let tmpChecked = queArr[i].checked
            else {
                showAlert("알림창", "누락된 항목이 있습니다.")
                return (false, 0)
            }
            totalSum += queArr[i].score! // cell에서 체크시 점수를 주므로 강제추출 가능
        }
        return (true, totalSum)
    }
    
    func showAlert(_ title: String, _ msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showAlert(_ title: String, _ msg: (Bool, Int)) {
        guard msg.0 == true else { return }

        var tmpStr = "당신의 검사결과는 "
        if msg.1 <= 5 {
            tmpStr.append("\(msg.1)점 입니다.\n\n")
            tmpStr.append("1~5점 운동과 외부 사회 활동을 유지하시고 \n치매예방 수칙 3·3·3을 잘 실천하셔서 치매를 에방하세요.")
        } else {
            tmpStr.append("\(msg.1)점 입니다.\n\n")
            tmpStr.append("6~14점 가까운 보건소나 치매안심센터를 방문하셔서 더 정확한 치매검진을 받아보시기 바랍니다")
        }

        let alert = UIAlertController(title: title, message: tmpStr, preferredStyle: UIAlertController.Style.alert)
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
