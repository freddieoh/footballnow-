//
//  TeamsTableViewController.swift
//  FootballNow!
//
//  Created by Fredrick Ohen on 12/4/17.
//  Copyright © 2017 geeoku. All rights reserved.
//

import UIKit

class TeamsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      registerNibFiles()
      retrieveTeamsFromApi()

    }

  
  func registerNibFiles() {
    tableView.register(UINib(nibName: "TeamsTableViewCell", bundle: nil), forCellReuseIdentifier: "TeamsCell")
  }
  
  
  func retrieveTeamsFromApi() {
    let teamsURL = "http://api.football-data.org/v1/competitions/445/teams"
    guard let url = URL(string: teamsURL) else { return }
    let session = URLSession.shared
    let task = session.dataTask(with: url) { (data, response, error) in
      if let error = error {
        DispatchQueue.main.async {
          //make UI error Change
          print(error.localizedDescription)
        }
        return
      }
      
      guard let data = data else { return }
      
      let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
      guard let teams = json["teams"] as? [[String:Any]] else { return }
      
      for team in teams {
        print(team["name"] as Any)
      }
    
      
      guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        DispatchQueue.main.async {
          // Make UI error Change
        }
        return
      }
    }
      task.resume()
  }

  
  // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamsCell", for: indexPath) as! TeamsTableViewCell
      cell.selectionStyle = .none

      return cell
    }
  
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 220.5
    }


}
