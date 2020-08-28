//
//  ListOfIconsViewController.swift
//  TheIcon
//
//  Created by Brena Amorim on 22/08/20.
//  Copyright © 2020 Brena Amorim. All rights reserved.
//

import UIKit

class ListOfIconsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "collectionsCell"
    let collectionsVC = ListOfIconsViewController.self
    var savedIcons: [Icon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Nome da Coleção"
        configureNavBar()
        collectionView.backgroundColor = .primaryColor
        collectionView.register(ListCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        
        // Calling the repository to read all notes
        savedIcons = IconRepository(with: "Salvos").getAll()
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
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return savedIcons.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? ListCollectionViewCell else {
            return ListCollectionViewCell()
        }
        
        let currentIcon = savedIcons[indexPath.row]
        let urlImage = currentIcon.preview_url
        cell.imageIcon.downloaded(from: urlImage ?? "Error to get preview_url")
        IconRepository(with: "Salvos").update(object: currentIcon)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        
        return CGSize(width: (collectionViewWidth - 120)/5, height: (collectionViewWidth - 120)/5)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 24, left: 32, bottom: 0, right: 32)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 14
    }
    // Espaçamento minimo entre coleções ao lado
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    //Espaçamento minimo vertical entre coleções
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let icon = try? savedIcons[indexPath.item]
        // Erro index
        let destination = DescriptionViewController()
        destination.dataIcon = icon
        destination.descriptionView.saveButton.isSelected = true
        navigationController?.pushViewController(destination, animated: true)
    }
}
