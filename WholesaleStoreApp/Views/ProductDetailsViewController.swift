//
//  ProductDetailsViewController.swift
//  WholesaleStoreApp
//
//  Created by Nurlan Seitov on 6/5/24.
//

import UIKit
import SnapKit

class ProductDetailsViewController: UIViewController {
    
    var product: Product?
    
    private lazy var nameDetailLabel: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 20)
        title.textColor = UIColor.blue
        title.numberOfLines = 1
        title.textAlignment = .left
        title.text = "Детальная информация"
        return title
    } ()
    
    private lazy var nameLabel: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 16)
        title.textColor = UIColor.black
        title.numberOfLines = 1
        title.textAlignment = .left
        return title
    } ()
    
    private lazy var priceLabel: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 16)
        title.textColor = UIColor.black
        title.numberOfLines = 1
        title.textAlignment = .left
        return title
    } ()
    
    private lazy var manufacturerLabel: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 16)
        title.textColor = UIColor.black
        title.numberOfLines = 1
        title.textAlignment = .left
        return title
    } ()
    
    private lazy var brandLabel: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 16)
        title.textColor = UIColor.black
        title.numberOfLines = 1
        title.textAlignment = .left
        return title
    } ()
    
    private lazy var brandImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 16
        image.clipsToBounds = true
        return image
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
    }
    
    func configure(with product: Product) {
        nameLabel.text = "Name: " + product.name
        priceLabel.text = "Price: " + String(product.price)
        manufacturerLabel.text = "Manufacturer: " + product.manufacturer.name
        brandLabel.text = "Brand: " + product.brand
        brandImageView.image = UIImage(named: product.image)
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
        
    }
    
    private func setupConstraints() {
        
        self.view.addSubview(nameDetailLabel)
        nameDetailLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(20)
        }
        
        self.view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(nameDetailLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(20)
        }
        self.view.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(20)
            make.width.equalTo(100)
        }
        self.view.addSubview(manufacturerLabel)
        manufacturerLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(20)
            make.width.equalTo(200)
        }
        
        self.view.addSubview(brandLabel)
        brandLabel.snp.makeConstraints { make in
            make.top.equalTo(manufacturerLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(20)
        }
        
        self.view.addSubview(brandImageView)
        brandImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
            make.trailing.equalToSuperview().offset(-26)
            make.height.width.equalTo(70)
            make.width.equalTo(70)
        }
    }
}

