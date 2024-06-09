//
//  EditProductViewController.swift
//  WholesaleStoreApp
//
//  Created by Nurlan Seitov on 10/6/24.
//

import UIKit
import SnapKit

protocol ProductEditingDelegate: AnyObject {
    func didEditProduct(_ product: Product, at index: Int)
}

class EditProductViewController: UIViewController {
    
    var products: [Product] = []
    var selectedIndex: Int = 0
    
    private lazy var editProdLabel: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 20)
        title.textColor = UIColor.systemBlue
        title.numberOfLines = 1
        title.textAlignment = .left
        title.text = "Редактирование товаров"
        return title
    } ()
    
    private lazy var nameProdLabel: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 20)
        title.textColor = UIColor.blue
        title.numberOfLines = 1
        title.textAlignment = .left
        title.text = "Наименование товара"
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
        textField.textAlignment = .left
        return textField
    }()
    
    private lazy var priceProdLabel: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 20)
        title.textColor = UIColor.blue
        title.numberOfLines = 1
        title.textAlignment = .left
        title.text = "Стоимость"
        return title
    } ()
    
    private lazy var priceTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray4.cgColor
        textField.textColor = UIColor.black
        textField.setLeftPaddingPointsCustom(8)
        textField.textAlignment = .left
        return textField
    }()
    
    private lazy var manufacturedProdLabel: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 20)
        title.textColor = UIColor.blue
        title.numberOfLines = 1
        title.textAlignment = .left
        title.text = "Производство"
        return title
    } ()
    
    private lazy var manufacturedTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray4.cgColor
        textField.textColor = UIColor.black
        textField.setLeftPaddingPointsCustom(8)
        textField.textAlignment = .left
        return textField
    }()
    
    private lazy var brandProdLabel: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 20)
        title.textColor = UIColor.blue
        title.numberOfLines = 1
        title.textAlignment = .left
        title.text = "Имя бренда"
        return title
    } ()
    
    private lazy var brandTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray4.cgColor
        textField.textColor = UIColor.black
        textField.setLeftPaddingPointsCustom(8)
        textField.textAlignment = .left
        return textField
    }()
    
    private lazy var saveButton: UIButton = {
       let button = UIButton(type: .system)
        button.setTitle("Сохранить изменения", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.tintColor = UIColor.white
        button.backgroundColor = UIColor.systemBlue
        button.layer.cornerRadius = 26
        button.addTarget(self, action: #selector(saveChanges), for: .touchUpInside)
       return button
   } ()
    weak var delegate: ProductEditingDelegate?
    
        override func viewWillAppear(_ animated: Bool) {
                super.viewWillAppear(animated)
                nameTextField.becomeFirstResponder()
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let selectedProduct = products[selectedIndex]
           nameTextField.text = selectedProduct.name
           priceTextField.text = "\(selectedProduct.price)"
           manufacturedTextField.text = selectedProduct.manufacturer.name
           brandTextField.text = selectedProduct.brand
        setupConstraints()
       
    }
    
    @objc func saveChanges() {
        
        guard let name = nameTextField.text,
              let priceString = priceTextField.text,
              let price = Double(priceString),
              let manufactrer = manufacturedTextField.text,
              let brand = brandTextField.text else {
            showAlert(message: "Ошибка при вводе данных!")
            return
        }
      
        products[selectedIndex].name = name
        products[selectedIndex].price = price
        products[selectedIndex].manufacturer.name = manufactrer
        products[selectedIndex].brand = brand
        
        delegate?.didEditProduct(products[selectedIndex], at: selectedIndex)
        
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
        
        self.view.addSubview(editProdLabel)
        editProdLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
//            make.leading.equalToSuperview().offset(16)
//            make.trailing.equalToSuperview().offset(-16)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(36)
        }
        
        self.view.addSubview(nameTextField)
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(editProdLabel.snp.bottom).offset(20)
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
        
        self.view.addSubview(saveButton)
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(brandTextField.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(52)
        }
    }
}
