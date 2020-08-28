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
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
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
        label.numberOfLines = 2
        label.font = UIFont(name: "NewYorkLarge-Medium", size: 16)
        label.textAlignment = .center
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
        button.setTitle("Remover da coleção", for: .selected)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.bold)
        button.setTitleColor(UIColor.white, for: UIControl.State())
//        button.backgroundColor = UIColor.buttonColor
        button.setBackgroundColor(color: (UIColor.buttonColor)!, forState: .normal)
        button.setBackgroundColor(color: (UIColor.actionColor)!, forState: .selected)
        // Mudança no background do button para adicionanr ou remover
        button.layer.cornerRadius = 8.0
        return button
    }()
}
