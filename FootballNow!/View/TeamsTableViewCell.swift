//
//  TeamsTableViewCell.swift
//  FootballNow!
//
//  Created by Fredrick Ohen on 12/4/17.
//  Copyright © 2017 geeoku. All rights reserved.
//

import UIKit
import WebKit

class TeamsTableViewCell: UITableViewCell {

  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var shortNameLabel: UILabel!
  @IBOutlet weak var codeLabel: UILabel!
  @IBOutlet weak var crestWebView: WKWebView!
  

  
  override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
