//
//  AddProductViewController.swift
//  WholesaleStoreApp
//
//  Created by Nurlan Seitov on 6/5/24.
//

import UIKit
import SnapKit

protocol ProductAddingDelegate: AnyObject {
    func didAddProduct(_ product: Product)
}

class AddProductViewController: UIViewController {
    
    var products: [Product] = []
    
    private lazy var addNewProdLabel: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 20)
        title.textColor = UIColor.systemBlue
        title.numberOfLines = 1
        title.textAlignment = .left
        title.text = "Добавление нового товара"
        return title
    } ()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray4.cgColor
        textField.textColor = UIColor.black
        textField.setLeftPaddingPointsCustom(8)
        textField.placeholder = "Наименование товара"             
        textField.textAlignment = .left
        return textField
    }()
    
    private lazy var priceTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray4.cgColor
        textField.textColor = UIColor.black
        textField.setLeftPaddingPointsCustom(8)
        textField.placeholder = "Стоимость"
        textField.textAlignment = .left
        return textField
    }()
    
    private lazy var manufacturedTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray4.cgColor
        textField.textColor = UIColor.black
        textField.setLeftPaddingPointsCustom(8)
        textField.placeholder = "Производство"
        textField.textAlignment = .left
        return textField
    }()
    
    private lazy var brandTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray4.cgColor
        textField.textColor = UIColor.black
        textField.setLeftPaddingPointsCustom(8)
        textField.placeholder = "Имя бренда"
        textField.textAlignment = .left
        return textField
    }()
    
    private lazy var addButton: UIButton = {
       let button = UIButton(type: .system)
        button.setTitle("Добавить продукт", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.tintColor = UIColor.white
        button.backgroundColor = UIColor.systemBlue
        button.layer.cornerRadius = 26
        button.addTarget(self, action: #selector(addProductTapped), for: .touchUpInside)
       return button
   } ()
    weak var delegate: ProductAddingDelegate?
    
        override func viewWillAppear(_ animated: Bool) {
                super.viewWillAppear(animated)
                nameTextField.becomeFirstResponder()
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
       
    }
    
    @objc func addProductTapped() {
        
        guard let name = nameTextField.text,
              let priceString = priceTextField.text,
              let price = Double(priceString),
              let manufactrer = manufacturedTextField.text,
              let brand = brandTextField.text else {
            showAlert(message: "Ошибка при вводе данных!")
            return
        }
      
        let newProduct = Product(name: name, price: price, manufacturer: Manufacturer(name: manufactrer), brand: brand, image: "defaultImage")
//        products.append(newProduct)
        delegate?.didAddProduct(newProduct)
        
        nameTextField.text = ""
        priceTextField.text = ""
        manufacturedTextField.text = ""
        brandTextField.text = ""
        
        
        let backButtonFont = UIFont.systemFont(ofSize: 18, weight: .medium)
            UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: backButtonFont], for: .normal)
//          navigationItem.backBarButtonItem = UIBarButtonItem(title: "List of goods", style: .plain, target: nil, action: nil)
//        let backButton = UIBarButtonItem(title: "List of goods", style: .plain, target: nil, action: nil)
        let backButton = UIButton(type: .system)
        backButton.setTitle("List of goods", for: .normal)
//        backButton.setTitleColor(.systemBlue, for: .normal)
        backButton.setTitleColor(.systemBlue, for: .disabled)
        backButton.tintColor = .systemBlue
        backButton.isEnabled = false
        let barButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.backBarButtonItem = barButtonItem
        navigationController?.popViewController(animated: true)
    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func setupConstraints() {
        
        self.view.addSubview(addNewProdLabel)
        addNewProdLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
//            make.leading.equalToSuperview().offset(16)
//            make.trailing.equalToSuperview().offset(-16)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(36)
        }
        
        self.view.addSubview(nameTextField)
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(addNewProdLabel.snp.bottom).offset(20)
//            make.leading.equalToSuperview().offset(16)
//            make.trailing.equalToSuperview().offset(-16)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(36)
        }
        
        self.view.addSubview(priceTextField)
        priceTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(10)
//            make.leading.equalToSuperview().offset(16)
//            make.trailing.equalToSuperview().offset(-16)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(36)
        }
        self.view.addSubview(manufacturedTextField)
        manufacturedTextField.snp.makeConstraints { make in
            make.top.equalTo(priceTextField.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(36)
        }
        self.view.addSubview(brandTextField)
        brandTextField.snp.makeConstraints { make in
            make.top.equalTo(manufacturedTextField.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(36)
        }
        
        self.view.addSubview(addButton)
        addButton.snp.makeConstraints { make in
            make.top.equalTo(brandTextField.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(52)
        }
    }
}

