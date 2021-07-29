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
  
  var userImage = UIImageView(systemImageName: "sunset.fill", tintColor: .secondaryLabel)

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

  // MARK: - UIViewController Life Cycle

  override func loadView() {
    view = UITableView(frame: .zero, style: .insetGrouped)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    configureNavigationBar()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

  }

  // MARK: - DataSourceProviderDelegate

  func tableViewDidScroll(_ tableView: UITableView) {
    adjustUserImageAlpha(tableView.contentOffset.y)
  }

  

  // MARK: - Firebase 🔥

  public func signCurrentUserOut() {
    try? Auth.auth().signOut()
//    updateUI()
  }

  public func linkUserToOtherAuthProviders() {
    guard let user = user else { return }
    let accountLinkingController = AccountLinkingViewController(for: user)
    let navController = UINavigationController(rootViewController: accountLinkingController)
    navigationController?.present(navController, animated: true, completion: nil)
  }

  public func requestVerifyEmail() {
    user?.sendEmailVerification { error in
      guard error == nil else { return self.displayError(error) }
      print("Verification email sent!")
    }
  }

  public func refreshCurrentUserIDToken() {
    let forceRefresh = true
    user?.getIDTokenForcingRefresh(forceRefresh) { token, error in
      guard error == nil else { return self.displayError(error) }
      if let token = token {
        print("New token: \(token)")
      }
    }
  }

  

  // MARK: - Private Helpers

  private func configureNavigationBar() {
    navigationItem.title = "기억력 향상하기"
    guard let navigationBar = navigationController?.navigationBar else { return }
    navigationBar.prefersLargeTitles = true
    navigationBar.titleTextAttributes = [.foregroundColor: UIColor.systemOrange]
    navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.systemOrange]
//    navigationBar.addProfilePic(userImage)
  }

//  private func updateUserImage() {
//    guard let photoURL = user?.photoURL else {
//      let defaultImage = UIImage(systemName: "person.circle.fill")
//      userImage.image = defaultImage?.withTintColor(.secondaryLabel, renderingMode: .alwaysOriginal)
//      return
//    }
//    userImage.setImage(from: photoURL)
//  }

  private func animateUpdates(for tableView: UITableView) {
    UIView.transition(with: tableView, duration: 0.2,
                      options: .transitionCrossDissolve,
                      animations: { tableView.reloadData() })
  }

  private func presentEditUserInfoController(for item: Itemable,
                                             to saveHandler: @escaping (String) -> Void) {
    let editController = UIAlertController(
      title: "Update \(item.detailTitle!)",
      message: nil,
      preferredStyle: .alert
    )
    editController.addTextField { $0.placeholder = "New \(item.detailTitle!)" }

    let saveHandler: (UIAlertAction) -> Void = { _ in
      let text = editController.textFields!.first!.text!
      saveHandler(text)
    }

    editController.addAction(UIAlertAction(title: "Save", style: .default, handler: saveHandler))
    editController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
    present(editController, animated: true, completion: nil)
  }

  private var originalOffset: CGFloat?

  private func adjustUserImageAlpha(_ offset: CGFloat) {
    originalOffset = originalOffset ?? offset
    let verticalOffset = offset - originalOffset!
    userImage.alpha = 1 - (verticalOffset * 0.05)
  }
}
