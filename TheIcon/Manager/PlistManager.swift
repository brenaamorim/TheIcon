//
//  PlistManager.swift
//  TheIcon
//
//  Created by Brena Amorim on 25/08/20.
//  Copyright © 2020 Brena Amorim. All rights reserved.
//

import Foundation

struct PlistManager<Type: Codable> {
    
    let plistName: String = "IconPlist"
    let encoder = PropertyListEncoder()
    let url: URL
    
    init(plistName: String) {
        url = URL(fileURLWithPath: NSHomeDirectory()+"/Library/Preferences/\(plistName)")
    }
    
    func readPlist() -> [Type]? {
        if let data = try? Data(contentsOf: url),
            let propertyListDecoded = try? PropertyListDecoder().decode([Type].self, from: data) {
            return propertyListDecoded
        }
        return nil
    }
    
    func addInPlist(object: Type) {
        
        var list = [Type]()
        
        if var plist = readPlist() {
            plist.append(object)
            savePlist(object: plist)
        } else {
            list.append(object)
            savePlist(object: list)
        }
        
    }
    
    func savePlist(object: [Type]) {
        encoder.outputFormat = .xml
        do {
            let data = try encoder.encode(object)
            try data.write(to: url)
        } catch {
            print(error)
        }
    }
    
}
