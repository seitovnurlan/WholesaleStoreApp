//
//  ProductTableViewCell.swift
//  WholesaleStoreApp
//
//  Created by Nurlan Seitov on 6/5/24.
//

import UIKit
import SnapKit

class ProductTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: ProductTableViewCell.self)
    
    private lazy var nameLabel: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 14)
        title.textColor = UIColor.black
        title.numberOfLines = 1
        title.textAlignment = .left
        return title
    } ()
    
    private lazy var priceLabel: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 14)
        title.textColor = UIColor.black
        title.numberOfLines = 1
        title.textAlignment = .left
        return title
    } ()
    
    private lazy var manufacturerLabel: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 14)
        title.textColor = UIColor.black
        title.numberOfLines = 1
        title.textAlignment = .left
        return title
    } ()
    
    private lazy var brandLabel: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 14)
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with ads: Product) {
        nameLabel.text = ads.name
        priceLabel.text = String(ads.price)
        manufacturerLabel.text = ads.manufacturer.name
        brandLabel.text = ads.brand
        brandImageView.image = UIImage(named: ads.image)
    }
    
    private func setupConstraints() {
        self.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(6)
            make.height.equalTo(20)
            make.width.equalTo(120)
        }
        self.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(1)
            make.leading.equalTo(nameLabel.snp.trailing).offset(12)
            make.height.equalTo(20)
            make.width.equalTo(60)
        }
        self.addSubview(manufacturerLabel)
        manufacturerLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(6)
            make.height.equalTo(20)
            make.width.equalTo(120)
        }
        
        self.addSubview(brandLabel)
        brandLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.leading.equalTo(manufacturerLabel.snp.trailing).offset(12)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(20)
        }
        
        self.addSubview(brandImageView)
        brandImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(-16)
            make.height.width.equalTo(50)
            make.width.equalTo(50)
        }
    }
}
