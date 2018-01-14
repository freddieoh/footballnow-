//
//  LeagueTableViewController.swift
//  FootballNow!
//
//  Created by Fredrick Ohen on 1/4/18.
//  Copyright © 2018 geeoku. All rights reserved.
//

import UIKit
import Alamofire

class LeagueTableViewController: UITableViewController {

  var standings: [Standing] = []
  
    override func viewDidLoad() {
        super.viewDidLoad()
      registerLeagueTableViewCellNib()

    }
  
    override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
      fetchURL(url: "https://api.football-data.org/v1/competitions/445/leagueTable")
    }
  
    func registerLeagueTableViewCellNib() {
    tableView.register(UINib(nibName: "LeagueTableViewCell", bundle: nil), forCellReuseIdentifier: "LeagueCell")
    }
  
    func fetchURL(url: String) {
      Alamofire.request(url).responseData { (response) in
        guard let data = response.data else { return }
          do {
            let table = try LeagueTable.decode(data: data)
            let standings = table.standing

            for teams in standings {
                self.standings.append(teams)
              }
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
        return standings.count
    }
  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
      let cellIdentifier = "LeagueCell"
      guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? LeagueTableViewCell  else {
        fatalError("The dequeued cell is not an instance of LeagueCell.")
      }
      
      let standing = standings[indexPath.row]
      cell.positionLabel.text = standing.position?.description
      cell.teamNameLabel.text = standing.teamName
      cell.drawsLabel.text = standing.draws?.description
      cell.goalsLabel.text = standing.goals?.description
      cell.lossesLabel.text = standing.losses?.description
      cell.playedGamesLabel.text = standing.playedGames?.description
      cell.winsLabel.text = standing.wins?.description
      cell.pointsLabel.text = standing.points?.description
      
      return cell
    }
  
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 327
    }

}

//: Decodable Extension


extension Decodable {
  static func decode(data: Data) throws -> Self {
    let decoder = JSONDecoder()
    return try decoder.decode(Self.self, from: data)
  }
}

