//
//  CategoriesTableViewCell.swift
//  TheIcon
//
//  Created by Brena Amorim on 17/08/20.
//  Copyright © 2020 Brena Amorim. All rights reserved.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {
    
    // Inicialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setupUI()
    }
    
    // Set properties
    lazy var cardCategory: UIImageView = {
        let card = UIImageView()
        card.backgroundColor = .purple
        card.translatesAutoresizingMaskIntoConstraints = false
        card.contentMode = .scaleAspectFill
        card.clipsToBounds = true
        
        //Corner radius and shadow
        self.contentView.layer.masksToBounds = false
        card.layer.cornerRadius = 8.0
        card.layer.shadowColor = UIColor.black.cgColor
        card.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        card.layer.shadowRadius = 8.0
        card.layer.shadowOpacity = 0.2
        return card
    }()
    
}

// Set constraints
extension CategoriesTableViewCell {
    private func setupUI() {
        self.contentView.addSubview(cardCategory)
        
        NSLayoutConstraint.activate([
            cardCategory.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            cardCategory.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            cardCategory.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18),
            cardCategory.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18)
        ])
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
