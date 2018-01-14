//
//  FixtureTableViewCell.swift
//  FootballNow!
//
//  Created by Fredrick Ohen on 1/14/18.
//  Copyright © 2018 geeoku. All rights reserved.
//

import UIKit

class FixtureTableViewCell: UITableViewCell {

  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var homeTeamLabel: UILabel!
  @IBOutlet weak var awayTeamLabel: UILabel!
  @IBOutlet weak var resultLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
