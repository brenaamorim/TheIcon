//
//  Router.swift
//  TheIcon
//
//  Created by Brena Amorim on 18/08/20.
//  Copyright © 2020 Brena Amorim. All rights reserved.
//

import Foundation
import OAuthSwift

enum Router {
//    case getIcon(id: String)
    case searchIcons(term: String)
}

struct IconsAPI {
//    let endpoint: String = "https://api.thenounproject.com/icon"
    let endpointSearch: String = "https://api.thenounproject.com/icons"
    
    var route: Router
    
    var url: String? {
            switch route {
//            case .getIcon(let id):
//                return "\(endpoint)/\(id)"
            case .searchIcons(let term):
                return "\(endpointSearch)/\(term)"
        }
    }
}

// Exemplo pesquisa: https://api.thenounproject.com/icons/bag?limit=10
// Exemplo icone: https://api.thenounproject.com/icon/247
