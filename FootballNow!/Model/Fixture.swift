//
//  Fixture.swift
//  FootballNow!
//
//  Created by Fredrick Ohen on 1/4/18.
//  Copyright © 2018 geeoku. All rights reserved.
//

import Foundation

struct Fixture: Decodable {
    let date: String?
    let homeTeamName: String?
    let awayTeamName: String?
    let result: Result
}
