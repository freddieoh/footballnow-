//
//  FixtureTableViewController.swift
//  FootballNow!
//
//  Created by Fredrick Ohen on 1/14/18.
//  Copyright © 2018 geeoku. All rights reserved.

import UIKit
import Alamofire

class FixtureTableViewController: UITableViewController {
  
  var fixtures: [Fixture] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    registerFixtureTableViewCellNib()
    fetchURL(url: "https://api.football-data.org/v1/competitions/445/fixtures")
    
  }

  func registerFixtureTableViewCellNib() {
    tableView.register(UINib(nibName: "FixtureTableViewCell", bundle: nil), forCellReuseIdentifier: "FixtureCell")
  }
  
  func fetchURL(url: String) {
    Alamofire.request(url).responseData { (response) in
      assert(Thread.isMainThread)
      guard let data = response.data else { return }
      do {
        let decoder = JSONDecoder()
        let fixtureResponse = try decoder.decode(FixturesResponse.self, from: data)
        print(fixtureResponse)
        self.fixtures = fixtureResponse.fixtures
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
    return fixtures.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellIdentifier = "FixtureCell"
    guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? FixtureTableViewCell  else {
      fatalError("The dequeued cell is not an instance of FixtureCell.")
    }
    
    let fixture = fixtures[indexPath.row]
    cell.homeTeamLabel.text = fixture.homeTeamName
    cell.awayTeamLabel.text = fixture.awayTeamName
    cell.dateLabel.text = fixture.date
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 170
  }
  
}
