//
//  UIColor.swift
//  TheIcon
//
//  Created by Brena Amorim on 14/08/20.
//  Copyright © 2020 Brena Amorim. All rights reserved.
//

import UIKit

extension UIColor {

    static let actionColor = UIColor.init(hex: "352245", alpha: 1.0)
    static let primaryColor = UIColor.init(hex: "FFFFFF", alpha: 1.0)
    static let backgroundCollections = UIColor.init(hex: "E8E8E9", alpha: 1.0)
    static let backgroundIcons = UIColor.init(hex: "E8E8E9", alpha: 0.10)
    static let titleColor = UIColor.init(hex: "3E3E3F", alpha: 1.0)
    static let buttonColor = UIColor.init(hex: "F86942", alpha: 1.0)
    
    public convenience init?(hex: String, alpha: CGFloat) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        var rgbValue: UInt64 = 0

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
        return
    }
}
