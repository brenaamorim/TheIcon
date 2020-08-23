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
    }
    
    override func prepareForReuse() {
        
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
    
}
