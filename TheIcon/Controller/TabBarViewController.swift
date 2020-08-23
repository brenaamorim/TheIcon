//
//  TabBarViewController.swift
//  IconApp
//
//  Created by Brena Amorim on 14/08/20.
//  Copyright © 2020 Brena Amorim. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        view.backgroundColor = .purple
        
        // Do any additional setup after loading the view.
    }
    
    func setupTabBar() {
        
//        self.tabBar.tintColor = .actionColor
//        self.tabBar.barTintColor = .black
      
        let collectionsVC = UINavigationController(rootViewController: CollectionsViewController())
        collectionsVC.tabBarItem = UITabBarItem(title: "Coleções", image: UIImage(systemName: "heart.circle.fill", withConfiguration: UIImage.SymbolConfiguration(weight: .regular) ), tag: 0)
 
        let categoriesVC = UINavigationController(rootViewController: CategoriesViewController())
        categoriesVC.tabBarItem = UITabBarItem(title: "Buscar", image: UIImage(systemName: "globe", withConfiguration: UIImage.SymbolConfiguration(weight: .regular)), tag: 1)
        
        viewControllers = [collectionsVC, categoriesVC]
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let navigations = viewControllers else { return }
        let navigation = navigations[item.tag] as? UINavigationController
        navigation?.popToRootViewController(animated: true)
    }
    
}
