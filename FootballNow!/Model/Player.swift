//
//  Player.swift
//  FootballNow!
//
//  Created by Fredrick Ohen on 1/4/18.
//  Copyright © 2018 geeoku. All rights reserved.
//

import Foundation

struct Player: Decodable {
    let name: String?
    let position: String?
    let jerseyNumber: Int?
    let dateOfBirth: String?
    let nationality: String?
}
