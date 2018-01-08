//
//  LeagueTableViewController.swift
//  FootballNow!
//
//  Created by Fredrick Ohen on 1/4/18.
//  Copyright © 2018 geeoku. All rights reserved.
//

import UIKit

class LeagueTableViewController: UITableViewController {

  
    override func viewDidLoad() {
        super.viewDidLoad()
      registerNibFiles()

    }
  
  func registerNibFiles() {
    tableView.register(UINib(nibName: "LeagueTableViewCell", bundle: nil), forCellReuseIdentifier: "LeagueCell")
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
