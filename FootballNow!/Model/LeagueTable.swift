//
//  LeagueTable.swift
//  FootballNow!
//
//  Created by Fredrick Ohen on 1/4/18.
//  Copyright © 2018 geeoku. All rights reserved.
//

import Foundation

struct LeagueTable: Decodable {
 
  let leagueCaption: String?
  let matchDay: Int?
  let standing: [Standing]

}

struct Standing: Decodable {
  
  let position: Int?
  let teamName: String?
  let crestURI: String?
  let playedGames: Int?
  let points: Int?
  let goals: Int?
  let wins: Int?
  let draws: Int?
  let losses: Int?
  
}



