//
//  SearchViewController.swift
//  IconApp
//
//  Created by Brena Amorim on 14/08/20.
//  Copyright © 2020 Brena Amorim. All rights reserved.
//

import UIKit
import OAuthSwift

class CategoriesViewController: UIViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    var termIcon: String = ""
    var resultsByCategory = [Icon]()
    
    var categories: [String] = ["Climate", "Communication", "Nature", "Objects"]
    var categoriesText: [String] = ["Clima", "Comunicação", "Natureza", "Objetos"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Descobrir"
        setupUI()
        configureNavBar()
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
        
        //Adicionando a searchBar
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        navigationItem.hidesSearchBarWhenScrolling = false
        
        // Don't hide the navigation bar because the search bar is in it.
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.searchBar.placeholder = "Buscar"
        searchController.isActive = true
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CategoriesTableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        
        view.addSubview(tableView)
        tableView.rowHeight = 103
        tableView.sectionHeaderHeight = 16
        tableView.tableAutoLayout(to: view)
        tableView.separatorStyle = .none
        return tableView
    }()
}

extension CategoriesViewController {
    private func setupUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        
        NSLayoutConstraint.activate([
            tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: self.view.heightAnchor)
        ])
    }
}

extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? CategoriesTableViewCell else {
            return CategoriesTableViewCell()
        }
        let currentItem = categories[indexPath.row]
        cell.cardCategory.image = UIImage(named: currentItem)
        cell.categoryLabel.text = categoriesText[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Inabilitando interações do usuario (evitando multiplas chamadas de API)
//        tableView.isUserInteractionEnabled = false
        termIcon = categories[indexPath.row]
        resultsByCategory = [Icon]()
        searchIcon(with: termIcon) { results in
            results?.forEach({ result in
                self.resultsByCategory.append(result)
            })
            DispatchQueue.main.async {
                let destination = SearchCollectionViewController()
                destination.listOfResults = self.resultsByCategory
                self.navigationController?.pushViewController(destination, animated: true)
            }
        }
        //Consumindo a API quando o usuário seleciona uma categoria
        //Dar feedback pro usuario (simbolo carregando)
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.contentView.backgroundColor = .white
        }
    }
    //background da célula quando selecionada
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {

        if let indexPathForSelectedRow = tableView.indexPathForSelectedRow,
            indexPathForSelectedRow == indexPath {
            tableView.deselectRow(at: indexPath, animated: false)
            return nil
        }
        return indexPath
    }
    //Deselecionando uma celula anteriormente selecionada
    
}

extension CategoriesViewController: UISearchBarDelegate {
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        let destination = SearchCollectionViewController()
        navigationController?.pushViewController(destination, animated: true)
        return false
    }
}
