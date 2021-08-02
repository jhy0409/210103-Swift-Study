//
//  BrainGameViewController.swift
//  dasiBom4
//
//  Created by inooph on 2021/08/02.
//

import UIKit

class BrainGameViewController: UIViewController {
    
    /*
     Todo
     [] 제출버튼 클릭 시 파이어베이스 연동
        - [] 예외처리 : 서버와 연동여부
     
     [] 결과조회 탭 - 그전 검사결과 받아오기
        - [] 예외처리 : 검사이력 없을 시 perform Segue(검사탭으로 이동)
     
     [] 게임하기 탭
        - [] 문제당 시도회차, 걸린 시간
        - [] 게임이력 파이어베이스 연동
     */
    
    @IBOutlet weak var questionLabel: UILabel!
    var answer: String?
    
    let btn1 = UIButton(); let btn2 = UIButton()
    let btn3 = UIButton(); let btn4 = UIButton()
    lazy var btnArr: [UIButton] = [btn1, btn2, btn3, btn4]
    lazy var rainbowUIColorArr: [UIColor] = [ UIColor(hex: "#ea58aa"), UIColor(hex: "#f59acc"),
                                              UIColor(hex: "#f9c455"), UIColor(hex: "#7ce9dd"),
                                              UIColor(hex: "#15cc94"), UIColor(hex: "#a59ddd")]
    override func viewDidLoad() {
        super.viewDidLoad()
        setUIButton(btnArr) // 오토 레이아웃
        makeLabelTxt() // 간단 문제 라벨 세팅, 정답버튼 내용 랜덤배치
        submitUser(btnArr) // 버튼탭 할 때 동작
    }
}

extension BrainGameViewController {
    func submitUser(_ btnArr: [UIButton]) {
        for i in btnArr {
            i.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)
        }
    }
    
    @objc func buttonAction(_ sender: UIButton!) {
        guard let str = sender.titleLabel?.text else { return }
        print("Button tapped \(str)")
        showAlert(str, "알림")
    }
    
    func showAlert(_ userResult: String, _ title: String?) {
        var msg = ""
        var tmpBool: Bool
        if userResult == answer {
            msg = "정답입니다."
            tmpBool = true
        } else {
            msg = "틀렸습니다."
            tmpBool = false
        }
        
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        if tmpBool == false {
            let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(ok)
        } else {
            let ok = UIAlertAction(title: "확인", style: .default) { _ in
                self.setUIButton(self.btnArr)
                self.makeLabelTxt()
            }
            alert.addAction(ok)
        }
        present(alert, animated: true, completion: nil)
    }
    
    func makeLabelTxt() {
        let tmpN1 = Int.random(in: 1...10)
        let tmpN2 = Int.random(in: 1...10)
        let tmpN3 = Int.random(in: 1...10)
        
        let oper: [String] = ["+", "-", "*"]
        let oper1: String = oper.randomElement()!
        let oper2: String = oper.randomElement()!
        let tmpStr: String = "\(tmpN1) \(oper1) (\(tmpN2) \(oper2) \(tmpN3))"
        print("\n----> \(tmpStr)")
        questionLabel.text = "문제 : \(tmpStr)"
        answer = calcResult(tmpN1, tmpN2, tmpN3, oper1, oper2)
        btnArr.randomElement()?.setTitle(answer, for: .normal)
        
    }
    
    func calcResult(_ n1: Int, _ n2: Int, _ n3: Int, _ oper1: String, _ oper2: String) -> String{
        var result1: Int
        switch oper2 {
        case "+":
            result1 = n2 + n3
        case "-":
            result1 = n2 - n3
        default:
            result1 = n2 * n3
        }
        
        var result2: Int
        switch oper1 {
        case "+":
            result2 = n1 + result1
        case "-":
            result2 = n1 - result1
        default:
            result2 = n1 * result1
        }
        print("\n------> result is \(result2)")
        return "\(result2)"
    }
    
    func setUIButton(_ btnArr: [UIButton]) {
        let itemSpacing: CGFloat = 18
        let margin: CGFloat = 40
        let fromTop: CGFloat = 200
        
        let width = (view.bounds.width - itemSpacing - (margin * 2)) / 2
        let tmpRange = 0...3
        for i in tmpRange {
            btnArr[i].backgroundColor = rainbowUIColorArr.randomElement()
            btnArr[i].layer.cornerRadius = 10
            btnArr[i].titleLabel?.font = UIFont.systemFont(ofSize: 55)
            switch i {
            case 0:
                btnArr[i].frame = CGRect(x: margin, y: fromTop, width: width, height: width)
                btnArr[i].setTitle("\(Int.random(in: 10...30))", for: .normal)
            case 1:
                btnArr[i].frame = CGRect(x: margin + width + itemSpacing, y: fromTop, width: width, height: width)
                btnArr[i].setTitle("\(Int.random(in: 10...30))", for: .normal)
            case 2:
                btnArr[i].frame = CGRect(x: margin, y: fromTop + width + itemSpacing, width: width, height: width)
                btnArr[i].setTitle("\(Int.random(in: 10...30))", for: .normal)
            default:
                btnArr[i].frame = CGRect(x: margin + width + itemSpacing, y: fromTop + width + itemSpacing, width: width, height: width)
                btnArr[i].setTitle("\(Int.random(in: 10...30))", for: .normal)
            }
            self.view.addSubview(btnArr[i])
        }
    }
}

