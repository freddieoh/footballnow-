//
//  PlayerTableViewController.swift
//  FootballNow!
//
//  Created by Fredrick Ohen on 1/20/18.
//  Copyright © 2018 geeoku. All rights reserved.
//

import UIKit
import Alamofire

class PlayerTableViewController: UITableViewController {
  
  var players: [Player] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    registerPlayerTableViewCellNib()
    
    fetchURL(url: "http://api.football-data.org/v1/teams/57/players")
  }
  
  
  func registerPlayerTableViewCellNib() {
    tableView.register(UINib(nibName: "PlayerTableViewCell", bundle: nil), forCellReuseIdentifier: "PlayerCell")
  }
  
  func fetchURL(url: String) {
    Alamofire.request(url).responseData { (response) in
      guard let data = response.data else { return }
      
      do {
          let decoder = JSONDecoder()
          let player = try decoder.decode(Player.self, from: data)
          let players = player.name
        
  
      }
      catch {
        print(error.localizedDescription)
        
      }
      
    
  }
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
