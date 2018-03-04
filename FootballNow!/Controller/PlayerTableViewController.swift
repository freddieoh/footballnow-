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
                let playerResponse = try decoder.decode(PlayerResponse.self, from: data)
                self.players = playerResponse.players
                
            }
            catch {
                print(error.localizedDescription)
                
            }
            self.tableView.reloadData()
        }
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "PlayerCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PlayerTableViewCell  else {
            fatalError("The dequeued cell is not an instance of PlayerCell.")
        }
        
        let player = players[indexPath.row]
        cell.nameLabel.text = player.name
        cell.positionLabel.text = player.position
        cell.dateOfBirthLabel.text = player.dateOfBirth
        cell.jerseyNumberLabel.text = player.jerseyNumber?.description
        cell.nationalityLabel.text = player.nationality
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}
