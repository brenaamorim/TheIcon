//
//  OnBoardingView.swift
//  TheIcon
//
//  Created by Brena Amorim on 22/08/20.
//  Copyright © 2020 Brena Amorim. All rights reserved.
//

import UIKit

class OnBoardingView: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "NewYorkLarge-Semibold", size: 32)
        label.textColor = UIColor.titleColor
        label.numberOfLines = 0
        label.text = "The Icon"
        return label
    }()
    
    lazy var bodyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "NewYorkLarge-Medium", size: 18)
        label.textColor = UIColor.titleColor
        label.numberOfLines = 0
        label.text = """
        
        🧩 The Icon is a way to keep your ideas
        
        1. You can search by name or categories
        
        2. Save an icon
        
        3. Create new folders taping the + button on the right corner
        
        """
        return label
    }()
    
    lazy var startButton: UIButton = {
        let button = UIButton()
        button.setTitle("START WRITING", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.tintColor = .white
        button.backgroundColor = UIColor.buttonColor
        button.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        return button
    }()
    
    var dismissAction: (() -> Void)!
    @objc func dismiss() {
        dismissAction()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.75)
        ])
        
        self.addSubview(bodyLabel)
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bodyLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            bodyLabel.widthAnchor.constraint(equalTo: titleLabel.widthAnchor)
        ])
        
        self.addSubview(startButton)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            startButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -90),
            startButton.widthAnchor.constraint(equalTo: bodyLabel.widthAnchor, multiplier: 1),
            startButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
