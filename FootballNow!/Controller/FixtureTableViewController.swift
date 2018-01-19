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
  var results: [Result] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    registerFixtureTableViewCellNib()
    fetchURL(url: "https://api.football-data.org/v1/competitions/445/fixtures")
    styleTableView()
  }

  func registerFixtureTableViewCellNib() {
    tableView.register(UINib(nibName: "FixtureTableViewCell", bundle: nil), forCellReuseIdentifier: "FixtureCell")
  }
  
  func styleTableView() {
    tableView.separatorStyle = .singleLine
  }
  
  func fetchURL(url: String) {
    Alamofire.request(url).responseData { (response) in
      guard let data = response.data else { return }
      do {
        let decoder = JSONDecoder()
        let fixtureResponse = try decoder.decode(FixturesResponse.self, from: data)
        let results = fixtureResponse.fixtures.map { $0.result }
        print(results)
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
    cell.goalsHomeTeamLabel.text = fixture.result.goalsHomeTeam?.description
    cell.goalsAwayTeamLabel.text = fixture.result.goalsAwayTeam?.description
    cell.dateLabel.text = fixture.date?.toDateString(inputDateFormat: "yyyy-MM-dd'T'HH:mm:ssZ", ouputDateFormat: "MMM d, yyyy")
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 170
  }

}
//MARK: DateFormatter

extension String {
  func toDateString( inputDateFormat inputFormat  : String,  ouputDateFormat outputFormat  : String ) -> String
  {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = inputFormat
    let date = dateFormatter.date(from: self)
    dateFormatter.dateFormat = outputFormat
    return dateFormatter.string(from: date!)
  }
}
