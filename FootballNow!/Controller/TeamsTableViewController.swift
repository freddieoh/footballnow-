//
//  TeamsTableViewController.swift
//  FootballNow!
//
//  Created by Fredrick Ohen on 12/4/17.
//  Copyright © 2017 geeoku. All rights reserved.
//

import UIKit
import Alamofire

class TeamsTableViewController: UITableViewController {
    
    var teams: [Team] = []
    var playersLink: [Link] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerTeamsTableViewCellNib()
        
        fetchURL(url: "http://api.football-data.org/v1/competitions/445/teams")
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    func registerTeamsTableViewCellNib() {
        tableView.register(UINib(nibName: "TeamsTableViewCell",
                                 bundle: nil),
                           forCellReuseIdentifier: "TeamsCell")
    }
    
    func styleTableView() {
        tableView.separatorStyle = .singleLine
    }
    
    
    func fetchURL(url: String) {
        Alamofire.request(url).responseData { (response) in
            guard let data = response.data else { return }
            let decoder = JSONDecoder()
            do {
                let teamResponse = try decoder.decode(TeamResponse.self, from: data)
                print(teamResponse.teams[0].links.playersLink)
                self.teams = teamResponse.teams
                
                
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
        print(team.links.playersLink)
        
        
        let crestUrls = team.crestUrl
        let crestWebView = cell.crestWebView
        
        // MARK: Load WebView for Crest SVG Images
        
        let crestURL = URL(string: crestUrls)
        let request = URLRequest(url: crestURL!)
        crestWebView?.load(request)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "PlayerSegue", sender: nil)
        let indexPath = self.tableView.indexPathForSelectedRow
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 292
    }
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PlayerSegue" {
            let destination = segue.destination as? PlayerTableViewController
            
        }
    }
}
