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
    
//  public func signCurrentUserOut() {
//    try? Auth.auth().signOut()
//  }
  
  // MARK: - Private Helpers
    
    
    override func loadView() {
        super.loadView()
        view = UIView()
        view.backgroundColor = .systemBlue
        
        
    }
    
    private func updateGameUI(_ btnArr: [UIButton?]) {
        let margin: CGFloat = 40
        let itemSpacing: CGFloat = 20
        
        let w = view.bounds.width
        let width = ((w - (margin * 2)) - itemSpacing) / 2
        
        for i in btnArr {
            i?.frame = CGRect(x: 40, y: 150, width: width, height: width)
            i?.backgroundColor = .blue
            print("\n 확인확인화")
        }
        // [] 크기세팅이 끝나면 각 버튼별로 btnArr에 추가
    }
    
    
  private func configureNavigationBar() {
    navigationItem.title = "기억력 향상하기"
    guard let navigationBar = navigationController?.navigationBar else { return }
    navigationBar.prefersLargeTitles = true
    navigationBar.titleTextAttributes = [.foregroundColor: UIColor.systemOrange]
    navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.systemOrange]
    
    btnMake()
  }
    private func btnMake() {
        let button1 = UIButton(); let button2 = UIButton()
        let button3 = UIButton(); let button4 = UIButton()
        
        btnArr = [button1, button2, button3, button4]
        
        var tmpI = 1
        for i in btnArr {
            switch tmpI {
            case 1:
                i.frame = CGRect.init(x: 40, y: 130, width: 100, height: 100)
            case 2:
                i.frame = CGRect.init(x: 160, y: 130, width: 100, height: 100)
            case 3:
                i.frame = CGRect.init(x: 40, y: 250, width: 100, height: 100)
            default:
                i.frame = CGRect.init(x: 160, y: 250, width: 100, height: 100)
            }
            
            i.setTitle("TEST", for: .normal)
            i.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(25))
            i.setTitleColor(UIColor.black, for: .normal)
            i.backgroundColor = .white
            i.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.center
            i.isEnabled = true
            i.addTarget(self, action: #selector(self.testAction), for: .touchUpInside)
            
            view.addSubview(i)
            i.translatesAutoresizingMaskIntoConstraints = false
            tmpI += 1
        }
    }
    
    @objc func testAction(sender: UIButton!) {
        print("\n 클릭되었음")
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
