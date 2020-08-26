//
//  CollectionsCell.swift
//  TheIcon
//
//  Created by Brena Amorim on 14/08/20.
//  Copyright © 2020 Brena Amorim. All rights reserved.
//

import UIKit

class CollectionsCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        titleOfCollection()
        imageIcon()
    }
    
    override func prepareForReuse() {
        firstIconImage.image = nil
        secondIconImage.image = nil
        thirdIconImage.image = nil
        fourthIconImage.image = nil

    }
    
    func setup() {
        self.backgroundColor = UIColor.backgroundCollections
        self.layer.cornerRadius = 8.0
    }
    
    func titleOfCollection() {
        addSubview(titleLabel)
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 2).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 5).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 24).isActive = true
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor.titleColor
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        label.textAlignment = .left
        label.sizeToFit()
        label.text = "Todos os ícones salvos"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func imageIcon() {
        addSubview(firstIconImage)
        addSubview(secondIconImage)
        addSubview(thirdIconImage)
        addSubview(fourthIconImage)
        
        NSLayoutConstraint.activate([
            firstIconImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 19),
            firstIconImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            firstIconImage.widthAnchor.constraint(equalToConstant: 70),
            firstIconImage.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        NSLayoutConstraint.activate([
            secondIconImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 19),
            secondIconImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            secondIconImage.widthAnchor.constraint(equalToConstant: 70),
            secondIconImage.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        NSLayoutConstraint.activate([
            thirdIconImage.topAnchor.constraint(equalTo: firstIconImage.bottomAnchor, constant: 10),
            thirdIconImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            thirdIconImage.widthAnchor.constraint(equalToConstant: 70),
            thirdIconImage.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        NSLayoutConstraint.activate([
            fourthIconImage.topAnchor.constraint(equalTo: secondIconImage.bottomAnchor, constant: 10),
            fourthIconImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            fourthIconImage.widthAnchor.constraint(equalToConstant: 70),
            fourthIconImage.heightAnchor.constraint(equalToConstant: 70)
        ])
        
    }
    
    lazy var firstIconImage: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFill
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    lazy var secondIconImage: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFill
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    lazy var thirdIconImage: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFill
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    lazy var fourthIconImage: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFill
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
}
