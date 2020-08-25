//
//  SearchCollectionViewCell.swift
//  TheIcon
//
//  Created by Brena Amorim on 17/08/20.
//  Copyright © 2020 Brena Amorim. All rights reserved.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    override func prepareForReuse() {
        imageIcon.image = nil
    }
    
    func setup() {
        self.backgroundColor = UIColor.backgroundIcons
        self.layer.cornerRadius = 8.0
        self.addSubview(imageIcon)
        
        imageIcon.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, width: 51, height: 51)
    }
    
    var imageIcon: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .clear
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
