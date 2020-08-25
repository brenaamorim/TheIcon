//
//  OnBoardingStatus.swift
//  TheIcon
//
//  Created by Brena Amorim on 22/08/20.
//  Copyright © 2020 Brena Amorim. All rights reserved.
//

import Foundation

struct OnBoardingStatus: Codable {
    static let plistName: String = "OnBoardingStatus"
    
    let firstLaunch: Bool = true
    let firstLaunchTimestamp: TimeInterval = Date().timeIntervalSince1970
    //timeInterval é necessário?
    
    private enum CodingKeys: String, CodingKey {
        case firstLaunch, firstLaunchTimestamp
    }
}
