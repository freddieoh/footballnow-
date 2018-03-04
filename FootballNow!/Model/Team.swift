//
//  Team.swift
//  FootballNow!
//
//  Created by Fredrick Ohen on 12/4/17.
//  Copyright © 2017 geeoku. All rights reserved.
//

import Foundation

struct Team: Decodable {
    let name: String
    let code: String
    let shortName: String
    let crestUrl: String
    let links: Link
    
    enum CodingKeys: String, CodingKey {
        case name
        case code
        case shortName
        case crestUrl
        case links = "_links"
    }
    
}

