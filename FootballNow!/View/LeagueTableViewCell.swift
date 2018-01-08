//
//  LeagueTableViewCell.swift
//  FootballNow!
//
//  Created by Fredrick Ohen on 1/4/18.
//  Copyright © 2018 geeoku. All rights reserved.
//

import UIKit

class LeagueTableViewCell: UITableViewCell {
  
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var playedGamesLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var goalsLabel: UILabel!
    @IBOutlet weak var winsLabel: UILabel!
    @IBOutlet weak var drawsLabel: UILabel!
    @IBOutlet weak var lossesLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
