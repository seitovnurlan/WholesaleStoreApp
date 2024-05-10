//
//  LoginViewController.swift
//  WholesaleStoreApp
//
//  Created by Nurlan Seitov on 6/5/24.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
//        imageView.backgroundColor = UIColor.lightGray
        imageView.image = UIImage(systemName: "person")
        imageView.tintColor = UIColor.gray
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var userNameTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.textColor = UIColor.black
        textField.setLeftPaddingPointsCustom(8)
        textField.placeholder = "User Name"
        textField.textAlignment = .left
//        textField.borderStyle = .roundedRect
//        textField.backgroundColor = UIColor.lightGray
        
        return textField
    }()

   
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 14)
        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.textColor = UIColor.black
        textField.setLeftPaddingPointsCustom(8)
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
//        textField.backgroundColor = UIColor.lightGray
        textField.keyboardType = .default
//        textField.borderStyle = .roundedRect

        return textField
    } ()
    
    public lazy var loginButton: UIButton = {
       let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.tintColor = UIColor.white
        button.backgroundColor = UIColor.systemBlue
        button.layer.cornerRadius = 26
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
       return button
   } ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }

private func setupViews() {
    view.addSubview(profileImageView)
    view.addSubview(userNameTextField)
    view.addSubview(passwordTextField)
    view.addSubview(loginButton)
    }

private func setupConstraints() {
    profileImageView.snp.makeConstraints { make in
        make.top.equalToSuperview().inset(140)
        make.centerX.equalToSuperview()
        make.width.equalTo(100)
        make.height.equalTo(101)
    }
    
    userNameTextField.snp.makeConstraints { make in
        make.top.equalTo(profileImageView.snp.bottom).offset(40)
        make.leading.trailing.equalToSuperview().inset(30)
        make.height.equalTo(36)
    }
    
    passwordTextField.snp.makeConstraints { make in
        make.top.equalTo(userNameTextField.snp.bottom).offset(30)
        make.leading.trailing.equalToSuperview().inset(30)
        make.height.equalTo(36)
    }
    
    loginButton.snp.makeConstraints { make in
        make.top.equalTo(passwordTextField.snp.bottom).offset(40)
        make.leading.trailing.equalToSuperview().inset(30)
        make.height.equalTo(52)
    }
}
    
    @objc func loginButtonTapped() {
        let backButtonFont = UIFont.systemFont(ofSize: 18, weight: .medium)
            UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: backButtonFont], for: .normal)
          navigationItem.backBarButtonItem = UIBarButtonItem(title: "List of goods", style: .plain, target: nil, action: nil)
//        let backButton = UIBarButtonItem(title: "List of goods", style: .plain, target: nil, action: nil)
//        navigationItem.backBarButtonItem = backButton
        let nextViewController = ProductListViewController()
        navigationController?.setNavigationBarHidden(true, animated: false)
        navigationController?.pushViewController(nextViewController, animated: true)
//        let showLIvc = MainTabBarController()
//        let nc = UINavigationController(rootViewController: showLIvc)
//        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
//           let appDelegate = windowScene.delegate as? SceneDelegate {
//            appDelegate.window?.rootViewController = nc
//        }
    }
}

extension UITextField {
    func setLeftPaddingPointsCustom(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPointsCustom(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
