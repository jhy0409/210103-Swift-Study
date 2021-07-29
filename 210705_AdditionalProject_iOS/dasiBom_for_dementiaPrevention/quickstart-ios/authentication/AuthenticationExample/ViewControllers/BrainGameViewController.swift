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
  
//  var userImage = UIImageView(systemImageName: "sunset.fill", tintColor: .secondaryLabel)
    
    var btn1: UIButton?
    var btn2: UIButton?
    var btn3: UIButton?
    var btn4: UIButton?
    
    var btnArr: [UIButton] = []
    let screenWidth = UIScreen.main.bounds.size.width

    
    
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
        view.backgroundColor = .systemBlue
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
//        var view2 = UIView()
        let button1 = UIButton(); let button2 = UIButton()
        let button3 = UIButton(); let button4 = UIButton()
        
        btnArr = [button1, button2, button3, button4]
        
//        let itemSpacing: CGFloat = 20
//        let margin: CGFloat = 40
//        let tmpW = (screenWidth - (margin * 2) - itemSpacing) / 2
//        let tmpW = (300 - itemSpacing) / 2
//        print(tmpW)
        var tmpI = 1
        let fromTop = 220
        let fromLeft = 40
        
        for i in btnArr {
            switch tmpI {
            case 1:
                i.frame = CGRect.init(x: fromLeft, y: fromTop, width: 100, height: 100)
            case 2:
                i.frame = CGRect.init(x: fromLeft + 120, y: fromTop, width: 100, height: 100)
            case 3:
                i.frame = CGRect.init(x: fromLeft, y: fromTop + 120, width: 100, height: 100)
            default:
                i.frame = CGRect.init(x: fromLeft + 120, y: fromTop + 120, width: 100, height: 100)
            }
            
            i.setTitle("TEST", for: .normal)
            i.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(25))
            i.setTitleColor(UIColor.black, for: .normal)
            i.backgroundColor = .white
            i.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.center
            i.isEnabled = true
            i.addTarget(self, action: #selector(self.testAction), for: .touchUpInside)
            
            view.addSubview(i)
            tmpI += 1
        }
    }
    
    private func showMunjeLabel() {
        
        
    }
    @objc func testAction(sender: UIButton!) {
        print("\n -----------> 클릭되었음")
    }

//  private func animateUpdates(for tableView: UITableView) {
//    UIView.transition(with: tableView, duration: 0.2,
//                      options: .transitionCrossDissolve,
//                      animations: { tableView.reloadData() })
//  }

  private var originalOffset: CGFloat?

//  private func adjustUserImageAlpha(_ offset: CGFloat) {
//    originalOffset = originalOffset ?? offset
//    let verticalOffset = offset - originalOffset!
//    userImage.alpha = 1 - (verticalOffset * 0.05)
//  }
}
