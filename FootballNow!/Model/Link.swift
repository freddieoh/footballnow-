//
//  Link.swift
//  FootballNow!
//
//  Created by Fredrick Ohen on 2/3/18.
//  Copyright © 2018 geeoku. All rights reserved.
//

import Foundation

struct Link: Decodable {
    let fixturesLink: String
    let playersLink: String
    
    enum LinkTypeKeys : String, CodingKey {
        case fixtures
        case players
    }
    
    enum LinkKeys : String, CodingKey {
        case href
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: LinkTypeKeys.self)
        
        let fixturesContainer = try container.nestedContainer(keyedBy: LinkKeys.self, forKey: .fixtures)
        let playersContainer = try container.nestedContainer(keyedBy: LinkKeys.self, forKey: .players)
        
        fixturesLink = try fixturesContainer.decode(String.self, forKey: .href)
        playersLink = try playersContainer.decode(String.self, forKey: .href)
    }
}
