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
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.text = "The Icon"
        return label
    }()
    
    lazy var bodyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "NewYorkLarge-Medium", size: 16)
        label.textColor = UIColor.white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = """
        
        
        The Icon is a way to keep your ideas
        
        You can search by name or categories, save an icon
        and create new folders taping the + button on the right corner
        """
        return label
    }()
    
    let Image: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.image = #imageLiteral(resourceName: "ideaImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var startButton: UIButton = {
        let button = UIButton()
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.tintColor = .white
        button.backgroundColor = UIColor.buttonColor
        button.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        
        //Corner radius and shadow
        self.layer.masksToBounds = false
        button.layer.cornerRadius = 8.0
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        button.layer.shadowRadius = 8.0
        button.layer.shadowOpacity = 0.2
        return button
    }()
    
    var dismissAction: (() -> Void)!
    @objc func dismiss() {
        dismissAction()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.actionColor
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.75)
        ])
        
        self.addSubview(Image)
        NSLayoutConstraint.activate([
            Image.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            Image.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 80),
            Image.heightAnchor.constraint(equalToConstant: 250),
            Image.widthAnchor.constraint(equalToConstant: 250)
        ])
        
        self.addSubview(bodyLabel)
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bodyLabel.topAnchor.constraint(equalTo: Image.bottomAnchor, constant: 56),
            bodyLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            bodyLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
        
        self.addSubview(startButton)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            startButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -90),
            startButton.widthAnchor.constraint(equalTo: Image.widthAnchor, multiplier: 1),
            startButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
