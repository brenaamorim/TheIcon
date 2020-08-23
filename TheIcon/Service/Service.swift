//
//  Service.swift
//  TheIcon
//
//  Created by Brena Amorim on 19/08/20.
//  Copyright © 2020 Brena Amorim. All rights reserved.
//

import Foundation
import OAuthSwift

//func getIconData(with iconId: String, completion: @escaping ([Icon]?) -> Void) {
//    let api = IconsAPI(route: .getIcon(id: iconId))
//    
//    guard let url = api.url else {return}
//    
//    let oauthswift = OAuth1Swift(
//        consumerKey: "57953a9578ab41fcafea11c93d5bdb6f",
//        consumerSecret: "ad7d163c8d864183b6677a086a545712"
//    )
//    // HTTP request without authorize
//   oauthswift.client.get(url as URLConvertible) { result in
//        switch result {
//        case .success(let sucess):
//            print(sucess)
//            let data = sucess.data
//            guard let response = try? JSONDecoder().decode(Response.self, from: data) else {
//                completion([])
//                return
//            }
//            completion([response.icon])
//        case .failure(let error):
//            print(error.localizedDescription)
//        }
//        
//    }
//}

func searchIcon(with term: String, completion: @escaping ([Icon]?) -> Void) {
    let api = IconsAPI(route: .searchIcons(term: term))
    
    guard let url = api.url else {return}
    
    let oauthswift = OAuth1Swift(
        consumerKey: "57953a9578ab41fcafea11c93d5bdb6f",
        consumerSecret: "ad7d163c8d864183b6677a086a545712"
    )
    // HTTP request without authorize
   oauthswift.client.get(url as URLConvertible) { result in
        switch result {
        case .success(let sucess):
            print(sucess)
            let data = sucess.data
            guard let response = try? JSONDecoder().decode(IconCollection.self, from: data) else {
                completion([])
                return
            }
            completion(response.icons)
        case .failure(let error):
            print(error.localizedDescription)
        }
        
    }
}
