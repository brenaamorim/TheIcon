//
//  IconRepository.swift
//  TheIcon
//
//  Created by Brena Amorim on 25/08/20.
//  Copyright © 2020 Brena Amorim. All rights reserved.
//

import Foundation

class IconRepository: Repository {
    
    var plist: PlistManager<Icon>
    
    init(with plistName: String) {
        plist = PlistManager<Icon>(plistName: plistName)
    }
    
    func getAll() -> [Icon] {
        
        // Getting icons in plist
        if let icons = plist.readPlist() {
            return icons
        }
        
        return [Icon]()
    }
    
    func get(id: String) -> Icon? {
        nil
    }
    
    func add(object: Icon) {
        
        // Saving in Plist
        plist.addInPlist(object: object)
    }
    
    func update(object: Icon) {

        // Update plist
        delete(object: object)
        add(object: object)
    }
    
    func delete(object: Icon) {
        
        if var plist = plist.readPlist() {
            plist = plist.filter { $0.id != object.id }
            self.plist.savePlist(object: plist)
        }
    }
    
}
