//
//  DescriptionView.swift
//  TheIcon
//
//  Created by Brena Amorim on 17/08/20.
//  Copyright © 2020 Brena Amorim. All rights reserved.
//

import UIKit

class DescriptionView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.addSubview(titleLabel)
        self.addSubview(iconImage)
        self.addSubview(saveButton)
    }
    
    func setupContraints() {
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 24)
        ])
        
        NSLayoutConstraint.activate([
            iconImage.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            iconImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            iconImage.heightAnchor.constraint(equalToConstant: 100),
            iconImage.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            saveButton.centerXAnchor.constraint(equalTo: iconImage.centerXAnchor),
            saveButton.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 32),
            saveButton.heightAnchor.constraint(equalToConstant: 66),
            saveButton.widthAnchor.constraint(equalToConstant: 200)

        ])
        
    }
    
    let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor.titleColor
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.bold)
        label.textAlignment = .left
//        label.text = text
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let iconImage: UIImageView = {
        let icon = UIImageView(frame: .zero)
        icon.image = .none
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Salvar na coleção", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.medium)
        button.setTitleColor(UIColor.white, for: UIControl.State())
        button.backgroundColor = UIColor.buttonColor
        button.layer.cornerRadius = 8.0
        return button
    }()
}
