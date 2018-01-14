//
//  FixtureTableViewController.swift
//  FootballNow!
//
//  Created by Fredrick Ohen on 1/14/18.
//  Copyright © 2018 geeoku. All rights reserved.

import UIKit

class FixtureTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
      registerFixtureTableViewCellNib()
    
  }

  
  func registerFixtureTableViewCellNib() {
    tableView.register(UINib(nibName: "FixtureTableViewCell", bundle: nil), forCellReuseIdentifier: "FixtureCell")
  }
  
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellIdentifier = "FixtureCell"
    guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? FixtureTableViewCell  else {
      fatalError("The dequeued cell is not an instance of FixtureCell.")
    }
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 170
  }

}
