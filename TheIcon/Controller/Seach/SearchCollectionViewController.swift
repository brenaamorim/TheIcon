//
//  SearchViewController.swift
//  TheIcon
//
//  Created by Brena Amorim on 17/08/20.
//  Copyright © 2020 Brena Amorim. All rights reserved.
//

import UIKit

class SearchViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "titleCell"
    let CollectionsVC = CollectionsViewController.self
    let searchController = UISearchController(searchResultsController: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Coleções"
        configureNavBar()
        //Botao de add
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
        
        //Adicionando a searchBar
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        navigationItem.hidesSearchBarWhenScrolling = false
        
        // Don't hide the navigation bar because the search bar is in it.
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.searchBar.placeholder = "Buscar"
        searchController.searchResultsUpdater = self
        searchController.isActive = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CollectionsCell
        
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
    
    
    
    //    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    //
    //    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        var textSearchBar = searchController.searchBar.text!
        textSearchBar = textSearchBar.replacingOccurrences(of: " ", with: "%20")
    }
    
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        self.searchController.dismiss(animated: true, completion: nil)
        return true
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}
