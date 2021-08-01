//
//  SurveyViewController.swift
//  dasiBom4
//
//  Created by inooph on 2021/08/01.
//

import UIKit

class SurveyViewController: UIViewController {
    let viewModel = QuestionViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let navigationBar = navigationController?.navigationBar else { return }
        navigationBar.prefersLargeTitles = true
        // Do any additional setup after loading the view.
    }
}

extension SurveyViewController: UITableViewDelegate {
    
}

extension SurveyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.questionArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? QuestionTableViewCell else {
            return UITableViewCell()
        }
        let survey = viewModel.questionArr[indexPath.row]
        cell.update(info: survey)
        
        return cell
    }
}
