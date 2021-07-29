//
//  BrainGameViewController.swift
//  AuthenticationExample
//
//  Created by inooph on 2021/07/29.
//  Copyright © 2021 Firebase. All rights reserved.
//

import UIKit
import Firebase

class BrainGameViewController: UIViewController{
    
    var btnArr: [UIButton] = []
    let screenWidth = UIScreen.main.bounds.size.width
    var randN1: Int = Int.random(in: 1...10)
    var randN2: Int = Int.random(in: 1...10)
    var randN3: Int = Int.random(in: 1...10)
    lazy var result: Int = randN1 + (randN2 * randN3)
    
    
    private var _user: User?
    var user: User? {
        get { _user ?? Auth.auth().currentUser }
        set { _user = newValue }
    }
    
    /// Init allows for injecting a `User` instance during UI Testing
    /// - Parameter user: A Firebase User instance
    init(_ user: User? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //    let view2 = UIView()
        //    view2.backgroundColor = .red
        //    view.addSubview(view2)
        //    view2.translatesAutoresizingMaskIntoConstraints = false
        //        let horizontalConstraint = NSLayoutConstraint(item: view2, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        //        let verticalConstraint = NSLayoutConstraint(item: view2, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
        //        let widthConstraint = NSLayoutConstraint(item: view2, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 300)
        //        let heightConstraint = NSLayoutConstraint(item: view2, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 300)
        //        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
        
        configureNavigationBar()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    // MARK: - Firebase 🔥
    
    private func showUILabel() {
        let btn = UIButton()
        btn.setTitle("9999999999", for: .normal)
        btn.titleColor(for: .normal)
        btn.backgroundColor = .blue
        view.addSubview(btn)
        print("\n\n view did load")
    }
    
    // MARK: - Private Helpers
    
    override func loadView() {
        super.loadView()
        view = UIView()
        view.backgroundColor = .systemGray6
    }
    
    private func configureNavigationBar() {
        navigationItem.title = "기억력 향상하기"
        guard let navigationBar = navigationController?.navigationBar else { return }
        navigationBar.prefersLargeTitles = true
        navigationBar.titleTextAttributes = [.foregroundColor: UIColor.systemOrange]
        navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.systemOrange]
        
        showMunjeLabel()
        btnMake()
    }
    private func btnMake() {
        let button1 = UIButton()
        let button2 = UIButton()
        let button3 = UIButton()
        let button4 = UIButton()
        
        btnArr = [button1, button2, button3, button4]
        
        //        let itemSpacing: CGFloat = 20
        //        let margin: CGFloat = 40
        //        let tmpW = (screenWidth - (margin * 2) - itemSpacing) / 2
        //        print(tmpW)
        var tmpI = 1
        let fromTop = 190
        let fromLeft = 40
        let btnSize = 135
        for i in btnArr {
            switch tmpI {
            case 1:
                i.frame = CGRect.init(x: fromLeft, y: fromTop, width: btnSize, height: btnSize)
            case 2:
                i.frame = CGRect.init(x: fromLeft + btnSize + 20, y: fromTop, width: btnSize, height: btnSize)
            case 3:
                i.frame = CGRect.init(x: fromLeft, y: fromTop + btnSize + 20, width: btnSize, height: btnSize)
            default:
                i.frame = CGRect.init(x: fromLeft + btnSize + 20, y: fromTop + btnSize + 20, width: btnSize, height: btnSize)
            }
            
            let tmpN = Int.random(in: 1...100) // 나머지 버튼은 랜덤으로 숫자생성
            i.setTitle("\(tmpN)", for: .normal)
            i.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(25))
            i.setTitleColor(UIColor.black, for: .normal)
            i.backgroundColor = .white
            i.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.center
            i.isEnabled = true
            i.layer.cornerRadius = 10
            i.addTarget(self, action: #selector(self.testAction), for: .touchUpInside)
            
            view.addSubview(i)
            tmpI += 1
        }
        
        // [ㅇ] 버튼 셋 중 하나는 정답이어야 함
        setBtnText_Random(btnArr)
    }
    
    
    private func showMunjeLabel() {
        let munjeUILabel = UILabel()
        
        munjeUILabel.text = "문제 : \(randN1) + (\(randN2) * \(randN3))"
        munjeUILabel.textAlignment = .left
        munjeUILabel.font = UIFont.systemFont(ofSize: CGFloat(22), weight: .light)
        munjeUILabel.frame = CGRect(x: 20, y: 120, width: screenWidth, height: 30)
        
        view.addSubview(munjeUILabel)
    }
    
    private func setBtnText_Random(_ btnArr: [UIButton]) {
        var tmpRange = Int.random(in: 0...3)
        let tmp: UIButton = btnArr[tmpRange]

        print("\n ------------> \(result)")
        tmp.setTitle("\(result)", for: .normal)
    }
    
    
    
    
    @objc func testAction(sender: UIButton!) {
        guard let btn = sender as? UIButton else { return }
        if btn.titleLabel?.text == "\(result)" {
            print("\n -----------> 정답입니다.")
        } else {
            print("\n -----------> 틀렸습니다.")
        }
    }
    
    
    private var originalOffset: CGFloat?
    
}
