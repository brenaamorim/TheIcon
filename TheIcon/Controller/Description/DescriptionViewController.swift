//
//  DescriptionViewController.swift
//  TheIcon
//
//  Created by Brena Amorim on 17/08/20.
//  Copyright © 2020 Brena Amorim. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {
    //    var descriptionView: DescriptionView { return self.view as? DescriptionView }
    var text: String = ""
    lazy var descriptionView: DescriptionView = {
        return DescriptionView()
    }()
    
    var dataIcon: Icon?
    var savedIcons = [Icon]()
    var viewsize = UIScreen.main.bounds.width
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        self.title = "Ícone"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        consumeAPI()
        self.view = descriptionView
    }
    
    func consumeAPI() {
        self.descriptionView.iconImage.downloaded(from: dataIcon?.preview_url ?? "Error to get preview_url")
        self.descriptionView.titleLabel.text = (dataIcon?.term ?? "Nothing").capitalized
    }
    
    func configureNavBar() {
        let navBar = self.navigationController?.navigationBar
        navBar?.prefersLargeTitles = false
        let attrs = [
               NSAttributedString.Key.foregroundColor: UIColor.titleColor,
               NSAttributedString.Key.font: UIFont(name: "NewYorkLarge-Medium", size: 17)
           ]
           navBar?.titleTextAttributes = attrs as [NSAttributedString.Key: Any]
        
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
    
    private func save() {
        
        UIView.animate(withDuration: 0.5, animations: {
            self.descriptionView.saveButton.setTitle("Salvar", for: .normal)
            self.descriptionView.iconImage.backgroundColor = UIColor.black
        })
    }
    
    override func  loadView() {
        self.view = DescriptionView(frame: UIScreen.main.bounds)
    }
    
}
