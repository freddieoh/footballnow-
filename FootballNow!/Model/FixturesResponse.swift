//
//  FixturesResponse.swift
//  FootballNow!
//
//  Created by Fredrick Ohen on 1/18/18.
//  Copyright © 2018 geeoku. All rights reserved.
//

import Foundation

struct FixturesResponse: Decodable {
    let fixtures: [Fixture]
}
