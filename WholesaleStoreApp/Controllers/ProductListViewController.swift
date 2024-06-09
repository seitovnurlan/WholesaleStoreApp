//
//  ProductListViewController.swift
//  WholesaleStoreApp
//
//  Created by Nurlan Seitov on 6/5/24.
//

import UIKit
import SnapKit

class ProductListViewController: UIViewController, ProductAddingDelegate, ProductEditingDelegate {
    
    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.setLeftPaddingPointsCustom(36)
        textField.placeholder = "Search"
        textField.textColor = UIColor.gray
        textField.textAlignment = .left
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 14)
        return textField
    }()
    
    private lazy var searchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(systemName: "magnifyingglass")
        imageView.tintColor = UIColor.gray
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var listTableView: UITableView = {
//        let tableView = UITableView(frame: .zero, style: .horizontal)
//        let tableView = UITableView(frame: .zero, style: .plain)
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ContactsTableViewCell")
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.reuseIdentifier)
        return tableView
    }()
    
    var products: [Product] = []
    
    var selectedProductIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationItem.leftBarButtonItems = [createCustomBackButton()]
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
    
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTapped))

               // Добавление кнопок в навигационную панель
               navigationItem.rightBarButtonItems = [addButton, editButton]
        
//        let backButton = UIBarButtonItem(title: "List of goods", style: .plain, target: nil, action: nil)
//            backButton.tintColor = .black
//            navigationItem.leftBarButtonItems = [backButton]
        listTableView.dataSource = self
        listTableView.delegate = self
        loadProducts()
        setupViews()
        setupConstraints()
        
        let doubleTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap(_:)))
        doubleTapRecognizer.numberOfTapsRequired = 2
        listTableView.addGestureRecognizer(doubleTapRecognizer)
        
    }
    func didEditProduct(_ product: Product, at index: Int) {
        products[index] = product
        listTableView.reloadData()
    }

    func loadProducts() {
        products.append(Product(name: "Спорт.костюм", price: 35.0, manufacturer: Manufacturer(name: "Nike"), brand: "Nike Sportswear", image: "nike"))
        products.append(Product(name: "Спорт.кепка", price: 15.0, manufacturer: Manufacturer(name: "Nike"), brand: "Jordan", image: "nike"))
        products.append(Product(name: "Спорт.обувь", price: 25.0, manufacturer: Manufacturer(name: "Nike"), brand: "Converse", image: "nike"))
        products.append(Product(name: "Спорт.футболка", price: 10.5, manufacturer: Manufacturer(name: "Nike"), brand: "Jordan", image: "nike"))
        products.append(Product(name: "Кепка", price: 12.5, manufacturer: Manufacturer(name: "Adidas"), brand: "Adidas Originals", image: "adidas"))
        products.append(Product(name: "Штаны", price: 40.5, manufacturer: Manufacturer(name: "Adidas"), brand: "Adidas Performance", image: "adidas"))
        products.append(Product(name: "Худи", price: 55.0, manufacturer: Manufacturer(name: "Adidas"), brand: "Y-3", image: "adidas"))
        products.append(Product(name: "Майка", price: 15.0, manufacturer: Manufacturer(name: "Adidas"), brand: "Adidas Originals", image: "adidas"))
        products.append(Product(name: "Футболка", price: 15.0, manufacturer: Manufacturer(name: "Puma"), brand: "Puma Sportstyle", image: "puma"))
        products.append(Product(name: "Красовки", price: 25.0, manufacturer: Manufacturer(name: "Puma"), brand: "Puma Motorsport", image: "puma"))
        products.append(Product(name: "Шортик", price: 35.0, manufacturer: Manufacturer(name: "Puma"), brand: "Puma Golf", image: "puma"))
        products.append(Product(name: "Кепка", price: 35.0, manufacturer: Manufacturer(name: "Puma"), brand: "Puma Sportstyle", image: "puma"))
        
        var _: Product = products[0]
    }
    
    func didAddProduct(_ product: Product) {
        products.append(product)
        listTableView.reloadData()
    }
    
       private func createCustomBackButton() -> UIBarButtonItem {
          
           var backButton = UIBarButtonItem(title: "List of goods", style: .plain, target: nil, action: nil)
           backButton.tintColor = .systemBlue
           return backButton
       }
    @objc func addTapped() {
        let addProductVC = AddProductViewController()
        addProductVC.delegate = self
//        navigationController?.navigationBar.topItem?.title = "Назад"
        navigationController?.pushViewController(addProductVC, animated: true)
       }

       @objc func editTapped() {
           
           guard let selectedIndex = selectedProductIndex else {
               let alert = UIAlertController(title: "Ошибка", message: "Выберите товар для редактирования", preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
               present(alert, animated: true, completion: nil)
               return
           }
           
           let editProductVC = EditProductViewController()
           editProductVC.products = products
           editProductVC.selectedIndex = selectedIndex
           editProductVC.delegate = self
           navigationController?.pushViewController(editProductVC, animated: true)
       }
    
    @objc func handleDoubleTap(_ gestureRecognizer: UITapGestureRecognizer) {
            let point = gestureRecognizer.location(in: listTableView)
            if let indexPath = listTableView.indexPathForRow(at: point) {
                let selectedProduct = products[indexPath.row]
                showProductDetails(for: selectedProduct)
            }
        }
    
    func setupViews() {
        view.addSubview(searchTextField)
        view.addSubview(searchImageView)
        view.addSubview(listTableView)
    }
    
    func setupConstraints() {
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(2)
//            make.top.equalToSuperview().inset(95)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.height.equalTo(36)
        }
        
        searchImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(8)
//            make.top.equalToSuperview().inset(103)
            make.leading.equalTo(24)
            make.height.width.equalTo(20)
        }
        listTableView.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.top.equalTo(searchTextField.snp.bottom).offset(10)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

extension ProductListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.reuseIdentifier, for: indexPath) as! ProductTableViewCell
        if indexPath.row < products.count {
                let product = products[indexPath.row]
                cell.configure(with: product)
            }
            return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedProductIndex = indexPath.row
//        let selectedProduct = products[indexPath.row]
//        showProductDetails(for: selectedProduct)
    }
    func showProductDetails(for product: Product) {
        let nextViewController = ProductDetailsViewController()
        nextViewController.product = product
        nextViewController.configure(with: product)
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}

//extension ProductListViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("HellO!")
//    }
//}
