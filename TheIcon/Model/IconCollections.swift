//
//  IconCollections.swift
//  TheIcon
//
//  Created by Brena Amorim on 18/08/20.
//  Copyright © 2020 Brena Amorim. All rights reserved.
//

// swiftlint:disable identifier_name
import Foundation

struct IconCollection: Codable {
    let icons: [Icon]
}

struct Response: Codable {
    let icon: Icon
}

struct Icon: Codable {
    let attribution: String?
    let preview_url: String?
    let term: String
    let id: String?
}
