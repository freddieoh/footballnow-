//
//  TeamsTableViewController.swift
//  FootballNow!
//
//  Created by Fredrick Ohen on 12/4/17.
//  Copyright © 2017 geeoku. All rights reserved.
//

import UIKit

class TeamsTableViewController: UITableViewController {
  
  var teams: [Team] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    
    registerTeamsTableViewCellNib()
    retrieveTeamsFromApi()
    
  }
  
  func registerTeamsTableViewCellNib() {
    tableView.register(UINib(nibName: "TeamsTableViewCell",
                             bundle: nil),
                       forCellReuseIdentifier: "TeamsCell")
  }
  
  func styleTableView() {
    tableView.separatorStyle = .singleLine
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
      guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        DispatchQueue.main.async {
          // Make UI error Change
        }
        return
      }
      
      let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
      guard let jsonTeams = json["teams"] as? [[String:Any]] else { return }
      for team in jsonTeams  {
        do {
          let team = try Team(json: team)
          self.teams.append(team)
        } catch let error {
          print(error.localizedDescription)
        }
      }
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
    task.resume()
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return teams.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cellIdentifier = "TeamsCell"
    guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TeamsTableViewCell else {
      fatalError("The dequeued cell is not an instance of TeamsCell.")
    }
    
    let team = teams[indexPath.row]
    
    cell.nameLabel.text = team.name
    cell.codeLabel.text = team.code
    cell.shortNameLabel.text = team.shortName
    
    
    let crestUrls = team.crestUrl
    let crestWebView = cell.crestWebView
    
    // MARK: Load WebView for Crest SVG Images
    
    let crestURL = URL(string: crestUrls)
    let request = URLRequest(url: crestURL!)
    crestWebView?.load(request)
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 292
  }
}
