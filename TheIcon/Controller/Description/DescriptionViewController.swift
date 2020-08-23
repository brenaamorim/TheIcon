//
//  DescriptionViewController.swift
//  TheIcon
//
//  Created by Brena Amorim on 17/08/20.
//  Copyright © 2020 Brena Amorim. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
    }
    
    func configureNavBar() {
        let navBar = self.navigationController?.navigationBar
        navBar?.prefersLargeTitles = true
        
        // Mudando a navbar default para a navbar vazia
        navBar?.isTranslucent = false
        navBar?.tintColor = UIColor.actionColor
        navBar?.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navBar?.shadowImage = UIImage()
        navBar?.backgroundColor = UIColor.white
        
        //adicionando sombra
        navBar?.layer.masksToBounds = false
        navBar?.layer.shadowColor = UIColor.lightGray.cgColor
        navBar?.layer.shadowOpacity = 0.5
        navBar?.layer.shadowOffset = CGSize(width: 2, height: 2)
        navBar?.layer.shadowRadius = 2
    }
}
