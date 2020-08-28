//
//  CollectionsViewController.swift
//  IconApp
//
//  Created by Brena Amorim on 14/08/20.
//  Copyright © 2020 Brena Amorim. All rights reserved.
//

import UIKit
import OAuthSwift

class CollectionsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "collectionsCell"
    let repository = IconRepository(with: "Salvos")
    var saved = [Icon]()

    let collectionsVC = CollectionsViewController.self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Coleções"
        configureNavBar()
        //Botao de add
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        collectionView.backgroundColor = .primaryColor
        collectionView.register(CollectionsCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    //Inicialização do layout da CollectionView
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureNavBar() {
        let navBar = self.navigationController?.navigationBar
        navBar?.prefersLargeTitles = true
        let attrs = [
            NSAttributedString.Key.foregroundColor: UIColor.titleColor,
            NSAttributedString.Key.font: UIFont(name: "NewYorkLarge-Semibold", size: 34)
        ]
        navBar?.largeTitleTextAttributes = attrs as [NSAttributedString.Key: Any]
        
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
    
    @objc func addTapped () {
        print("Add button was tapped")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? CollectionsCell else {
            return CollectionsCell()
        }
        saved = repository.getAll()
        
        if saved.count >= 1 {
            cell.firstIconImage.downloaded(from: saved[0].preview_url!)
        }
        if saved.count >= 2 {
            cell.secondIconImage.downloaded(from: saved[1].preview_url!)
        }
        if saved.count >= 3 {
            cell.thirdIconImage.downloaded(from: saved[2].preview_url!)
        }
        if saved.count >= 4 {
            cell.fourthIconImage.downloaded(from: saved[3].preview_url!)
        }
        
//        collectionView.reloadItems(at: [indexPath])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        
        return CGSize(width: (collectionViewWidth - 41)/2, height: (collectionViewWidth - 41)/2)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 24, left: 16, bottom: 0, right: 16)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 9
    }
    // Espaçamento minimo entre coleções ao lado
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 62
    }
    //Espaçamento minimo vertical entre coleções
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let destination = ListOfIconsViewController()
        navigationController?.pushViewController(destination, animated: true)
    }
}

