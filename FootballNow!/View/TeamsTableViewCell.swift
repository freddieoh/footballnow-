//
//  TeamsTableViewCell.swift
//  FootballNow!
//
//  Created by Fredrick Ohen on 12/4/17.
//  Copyright © 2017 geeoku. All rights reserved.
//

import UIKit
import WebKit

class TeamsTableViewCell: UITableViewCell {

  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var shortNameLabel: UILabel!
  @IBOutlet weak var codeLabel: UILabel!
  @IBOutlet weak var crestWebView: WKWebView!
  
  fileprivate func disableWebViewScroll() {
    crestWebView.scrollView.isScrollEnabled = false
  }
  
  override func awakeFromNib() {
        super.awakeFromNib()
    
    disableWebViewScroll()
  }
  
  func webViewDidFinishLoad(_ webView: WKWebView!) {
    print("The size is being called")
  }
  
  func setMagnification(_ magnification: CGFloat, centeredAt point: CGPoint) {
  }
}
