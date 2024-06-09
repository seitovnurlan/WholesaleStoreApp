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
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray4.cgColor
        textField.textColor = UIColor.black
        textField.setLeftPaddingPointsCustom(8)
        textField.placeholder = "Имя"             //User Name
        textField.textAlignment = .left
//        textField.borderStyle = .roundedRect
//        textField.backgroundColor = UIColor.lightGray
        
        return textField
    }()

   
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 16)
        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray4.cgColor
        textField.textColor = UIColor.black
        textField.setLeftPaddingPointsCustom(8)
        textField.placeholder = "Пароль"                  //Password
        textField.isSecureTextEntry = true
//        textField.backgroundColor = UIColor.lightGray
        textField.keyboardType = .default
//        textField.borderStyle = .roundedRect

        return textField
    } ()
    
    private lazy var rememberMeButton: UIButton = {
       let button = UIButton(type: .system)
//        button.backgroundColor = .lightGray
        button.setTitle("Запомнить меня", for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        
        var rememberMeConfig = UIButton.Configuration.plain()
//        rememberMeConfig.title = "Запомнить меня"
        rememberMeConfig.image = UIImage(systemName: "checkmark")
        rememberMeConfig.imagePadding = 10
        
        let titleText = "Запомнить меня"
        let attributedTitle = NSAttributedString(string: titleText, attributes: [
                   .font: UIFont.systemFont(ofSize: 12, weight: .medium)
               ])
        rememberMeConfig.attributedTitle = AttributedString(attributedTitle)
        button.setAttributedTitle(attributedTitle, for: .normal)
        rememberMeConfig.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 8, weight: .medium)
               
        button.configuration = rememberMeConfig
        
//        let checkmarkImage = UIImage(systemName: "checkmark")
//        button.setImage(checkmarkImage, for: .normal)
//        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .black
//        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(didTapRememberMeButton), for: .touchUpInside)
       return button
   } ()
    
    private lazy var forgotPasswordButton: UIButton = {
       let button = UIButton(type: .system)
        button.setTitle("Забыли пароль?", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        button.tintColor = UIColor.systemBlue
        button.addTarget(self, action: #selector(didTapForgotPasswordButton), for: .touchUpInside)
       return button
   } ()
    
    private lazy var loginButton: UIButton = {
       let button = UIButton(type: .system)
        button.setTitle("Войти", for: .normal)         //Login
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.tintColor = UIColor.white
        button.backgroundColor = UIColor.systemBlue
        button.layer.cornerRadius = 26
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
       return button
   } ()
    
    private lazy var userAgreementLabel: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 13)
        title.numberOfLines = 0
        title.textAlignment = .center
        title.text = "При входе, вы принимаете условия"
        title.textColor = .gray
        return title
    } ()
    
    private lazy var userAgreementContinuedLabel: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 13)
        title.numberOfLines = 0
        title.textAlignment = .center
        title.text = "Пользовательское соглашения и Политики конфиденциальности"
        title.textColor = .systemBlue
        return title
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
    view.addSubview(rememberMeButton)
    view.addSubview(forgotPasswordButton)
    view.addSubview(loginButton)
    view.addSubview(userAgreementLabel)
    view.addSubview(userAgreementContinuedLabel)
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
        make.top.equalTo(userNameTextField.snp.bottom).offset(20)
        make.leading.trailing.equalToSuperview().inset(30)
        make.height.equalTo(36)
    }
    
    rememberMeButton.snp.makeConstraints { make in
        make.top.equalTo(passwordTextField.snp.bottom).offset(15)
        make.leading.equalToSuperview().inset(30)
        make.height.equalTo(30)
    }
    
    forgotPasswordButton.snp.makeConstraints { make in
        make.top.equalTo(passwordTextField.snp.bottom).offset(15)
        make.trailing.equalToSuperview().offset(-30)
//        make.leading.equalTo(rememberMeButton.snp.trailing).offset(60)
        make.height.equalTo(30)
    }
    
    loginButton.snp.makeConstraints { make in
        make.top.equalTo(forgotPasswordButton.snp.bottom).offset(40)
        make.leading.trailing.equalToSuperview().inset(30)
        make.height.equalTo(52)
    }
    
    userAgreementLabel.snp.makeConstraints { make in
        make.top.equalTo(loginButton.snp.bottom).offset(30)
        make.leading.trailing.equalToSuperview().inset(30)
        make.height.equalTo(13)
    }
    
    userAgreementContinuedLabel.snp.makeConstraints { make in
        make.top.equalTo(userAgreementLabel.snp.bottom).offset(1)
        make.leading.trailing.equalToSuperview().inset(50)
        make.height.equalTo(40)
    }
}
    
    @objc func didTapRememberMeButton() {
        print("Remember Me button was tapped")
    }
    
    @objc func didTapForgotPasswordButton() {
        print("Forgot Password button was tapped")
    }
    
    @objc func loginButtonTapped() {
        let backButtonFont = UIFont.systemFont(ofSize: 18, weight: .medium)
            UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: backButtonFont], for: .normal)
          navigationItem.backBarButtonItem = UIBarButtonItem(title: "List of goods", style: .plain, target: nil, action: nil)

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
