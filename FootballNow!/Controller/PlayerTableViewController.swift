//
//  PlayerTableViewController.swift
//  FootballNow!
//
//  Created by Fredrick Ohen on 1/20/18.
//  Copyright © 2018 geeoku. All rights reserved.
//

import UIKit

class PlayerTableViewController: UITableViewController {
  
  var players: [Player] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    registerPlayerTableViewCellNib()
    
  }
  
  
  func registerPlayerTableViewCellNib() {
    tableView.register(UINib(nibName: "PlayerTableViewCell", bundle: nil), forCellReuseIdentifier: "PlayerCell")
  }
  
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellIdentifier = "PlayerCell"
    guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PlayerTableViewCell  else {
      fatalError("The dequeued cell is not an instance of PlayerCell.")
    }
    
    return cell
    
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 180
  }
  
}
