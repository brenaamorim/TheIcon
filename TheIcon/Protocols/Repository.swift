//
//  Repository.swift
//  TheIcon
//
//  Created by Brena Amorim on 25/08/20.
//  Copyright © 2020 Brena Amorim. All rights reserved.
//

protocol Repository {
    
    func getAll() -> [Icon]
    func get (id: String) -> Icon?
    func add(object: Icon)
    func update(object: Icon)
    func delete(object: Icon)
    
}
