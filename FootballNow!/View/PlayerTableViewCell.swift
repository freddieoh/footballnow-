//
//  PlayerTableViewCell.swift
//  FootballNow!
//
//  Created by Fredrick Ohen on 1/4/18.
//  Copyright © 2018 geeoku. All rights reserved.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {

  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var positionLabel: UILabel!
  @IBOutlet weak var dateOfBirthLabel: UILabel!
  @IBOutlet weak var jerseyNumberLabel: UILabel!
  @IBOutlet weak var nationalityLabel: UILabel!
  @IBOutlet weak var contractUntilLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
  }
}
