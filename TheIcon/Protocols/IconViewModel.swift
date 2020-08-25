//
//  IconViewModel.swift
//  TheIcon
//
//  Created by Brena Amorim on 25/08/20.
//  Copyright © 2020 Brena Amorim. All rights reserved.
//

import Foundation

class IconViewModel {
    
    var icons: [Icon]?
    var repository: Repository
    
    init(repository: Repository) {
        self.repository = repository
        icons = self.repository.getAll()
    }
    
}
