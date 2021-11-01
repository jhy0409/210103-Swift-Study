//
//  ViewController.swift
//  MiniCalc
//
//  Created by inooph on 2021/10/31.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblCalc: UILabel!
    @IBOutlet weak var lblContents: UILabel!
    
    var oper: String = "" // 연산자
    var firstNum: Int?
    var secondNum: Int?
    func returnOperatorStr(oper: String) -> String {
        switch oper {
        case "+":
            return "+"
        case "-":
            return "-"
        case "*":
            return "✕"
        default:
            return "÷"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblCalc.text = ""
        lblContents.text = ""
    }
    
    // MARK: - [ㅇ] 0~9까지 버튼 탭 시 라벨 변경
    @IBAction func btntapped1(_ sender: UIButton) {
        setNumber(str1: lblCalc.text!, str2: sender.currentTitle?.isEmpty == false ? sender.currentTitle! : "")
    }
    @IBAction func btntapped2(_ sender: UIButton) {
        setNumber(str1: lblCalc.text!, str2: sender.currentTitle?.isEmpty == false ? sender.currentTitle! : "")
    }
    @IBAction func btntapped3(_ sender: UIButton) {
        setNumber(str1: lblCalc.text!, str2: sender.currentTitle?.isEmpty == false ? sender.currentTitle! : "")
    }
    @IBAction func btntapped4(_ sender: UIButton) {
        setNumber(str1: lblCalc.text!, str2: sender.currentTitle?.isEmpty == false ? sender.currentTitle! : "")
    }
    @IBAction func btntapped5(_ sender: UIButton) {
        setNumber(str1: lblCalc.text!, str2: sender.currentTitle?.isEmpty == false ? sender.currentTitle! : "")
    }
    
    @IBAction func btntapped6(_ sender: UIButton) {
        setNumber(str1: lblCalc.text!, str2: sender.currentTitle?.isEmpty == false ? sender.currentTitle! : "")
    }
    @IBAction func btntapped7(_ sender: UIButton) {
        setNumber(str1: lblCalc.text!, str2: sender.currentTitle?.isEmpty == false ? sender.currentTitle! : "")
    }
    @IBAction func btntapped8(_ sender: UIButton) {
        setNumber(str1: lblCalc.text!, str2: sender.currentTitle?.isEmpty == false ? sender.currentTitle! : "")
    }
    @IBAction func btntapped9(_ sender: UIButton) {
        setNumber(str1: lblCalc.text!, str2: sender.currentTitle?.isEmpty == false ? sender.currentTitle! : "")
    }
    @IBAction func btntapped0(_ sender: UIButton) {
        setNumber(str1: lblCalc.text!, str2: sender.currentTitle?.isEmpty == false ? sender.currentTitle! : "")
    }
    
    func setNumber(str1: String, str2: String) {
        lblCalc.text = str1 + str2
    }
    
    // MARK: - [ㅇ] 연산 버튼 누름
    @IBAction func btnPlusTapped(_ sender: UIButton) {
        setFirstNumAndOperator(num1: Int(lblCalc.text ?? "0") ?? nil, oper: "+")
        lblCalc.text = ""
    }
    @IBAction func btnMinusTapped(_ sender: UIButton) {
        setFirstNumAndOperator(num1: Int(lblCalc.text ?? "0") ?? nil, oper: "-")
        lblCalc.text = ""
    }
    @IBAction func btnMultiplyTapped(_ sender: UIButton) {
        setFirstNumAndOperator(num1: Int(lblCalc.text ?? "0") ?? nil, oper: "*")
        lblCalc.text = ""
    }
    @IBAction func btnDivisionTapped(_ sender: UIButton) {
        setFirstNumAndOperator(num1: Int(lblCalc.text ?? "0") ?? nil, oper: "/")
        lblCalc.text = ""
    }
    
    func setFirstNumAndOperator(num1: Int?, oper: String) {
        firstNum = num1
        self.oper = oper
        lblContents.text = "\(num1!) \(returnOperatorStr(oper: oper))"
    }
    
    // MARK: - [ㅇ] 연산
    @IBAction func submitAnswer(_ sender: UIButton) {
        secondNum = CLong(lblCalc.text ?? "0") ?? nil
        guard let first = firstNum, let second = secondNum
        else {
            let booleanForCalc = (firstNum == nil, secondNum == nil)
            showAlert(bool: booleanForCalc, title: "에러발생", checkLable: lblCalc.text)
            return
            
        }
        lblCalc.text = calc(num1: first, num2: second, oper: oper)
        guard let lblcTxt = lblCalc.text else { return }
        lblContents.text = "\(first) \(returnOperatorStr(oper: oper)) \(second) = \(lblcTxt)"
    }
    
    @IBAction func btnResetTapped(_ sender: UIButton) {
        reset()
    }
    
    func calc(num1: CLong, num2: CLong, oper: String) -> String? {
        var result: (Int, Bool)
        switch oper {
        case "+":
            result = num1.addingReportingOverflow(num2)
            if result.1 == true {
                showAlert(title: "오버플로우 발생", message: "범위 초과로 값을 초기화합니다.")
                return nil
            } else {
                return "\(result.0)"
            }
            
        case "-":
            let absNum2 = abs(num2)
            result = num1.subtractingReportingOverflow(absNum2)
            if result.1 == true {
                showAlert(title: "오버플로우 발생", message: "범위 초과로 값을 초기화합니다.")
                return nil
            } else {
                return "\(result.0)"
            }
            
        case "*":
            result = num1.multipliedReportingOverflow(by: num2)
            if result.1 == true {
                showAlert(title: "오버플로우 발생", message: "범위 초과로 값을 초기화합니다.")
                return nil
            } else {
                return "\(result.0)"
            }
            
        default:
            result = num1.dividedReportingOverflow(by: num2)
            if result.1 == true {
                if(num2 <= 0) {
                    showAlert(bool: num2<=0, title: "에러 발생")
                    return nil }
                showAlert(title: "오버플로우 발생", message: "범위 초과로 값을 초기화합니다.")
                return nil
            } else {
                return "\(result.0)"
            }
        }
    }
    
    func reset() {
        firstNum = nil
        secondNum = nil
        lblCalc.text = ""
        lblContents.text = ""
        oper = ""
    }
    
    // MARK: - [ㅇ] 경고창
    private func showAlert(bool: (num1: Bool, num2: Bool), title: String, checkLable: String?) {
        var message = ""
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        if bool.num1 == true {
            message.append("- 첫번째 숫자가 유효하지 않은 값입니다.\n- 첫번째 숫자는 연산자를 누를 때 저장됩니다.\n- 첫번째 숫자 > 연산자 > 두번째 숫자 > = 순서로 입력하십시오\n\n")
        }
        if bool.num2 == true {
            let minC = "\(CLong.min)"
            let maxC = "\(CLong.min)"
            message.append("- 두번째 숫자가 유효하지 않은 값입니다. \n\ncLong 최대 및 최소값 : \(numberFormatter.string(from: NSNumber(value: CLong.min))!) ~ \(numberFormatter.string(from: NSNumber(value: CLong.max))!)\n 음수 최대자리 수 \(minC.count) ~ 양수 최대자리 수 \(maxC.count) - 현재 입력값 자리 수 \(checkLable!.count)\n\n유효하지 않은 입력으로 값을 초기화합니다.")
        }
        
        print(" 1 \(bool.num1) / 2 \(bool.num2)")
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { UIAlertAction in
            self.reset()
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func showAlert(bool: Bool, title: String) {
        if bool == true {
            let message = "0보다 작거나 같은 값으로 나눌 수 없습니다."
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default) { UIAlertAction in
                self.reset()
            }
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { UIAlertAction in
            self.reset()
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}

