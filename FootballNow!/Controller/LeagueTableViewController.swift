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

  
    override func viewDidLoad() {
        super.viewDidLoad()
      registerLeagueTableViewCellNib()

    }
  
    override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
      fetchURL(url: "https://api.football-data.org/v1/competitions/445/leagueTable", param: ["standing":"links"])
    }
  
    func registerLeagueTableViewCellNib() {
    tableView.register(UINib(nibName: "LeagueTableViewCell", bundle: nil), forCellReuseIdentifier: "LeagueCell")
    }
  
  func fetchURL(url: String, param: [String:Any]) {
    Alamofire.request(url, parameters: param).responseString { (response) in
         print(response.value ?? "No Value")
        }.responseJSON { (response) in
          print(response.value ?? "No JSON Value")
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
    let cell = tableView.dequeueReusableCell(withIdentifier: "LeagueCell", for: indexPath) as! LeagueTableViewCell
      
      
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 327
  }

}
