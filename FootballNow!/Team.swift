//
//  Team.swift
//  FootballNow!
//
//  Created by Fredrick Ohen on 12/4/17.
//  Copyright © 2017 geeoku. All rights reserved.
//

import Foundation

struct Team {
  
  let name: String
  let code: String
  let shortName: String
  let crestUrl: String

}

enum SerializationError: Error {
  case missing(String)
  case invalid(String, Any)
  
}


extension Team {
  
  init(json: [String:Any]) throws {
    guard let name = json["name"] as? String else {
      throw SerializationError.missing("name")
    }
    
    guard let code = json["code"] as? String else {
      throw SerializationError.missing("code")
    }
    
    guard let shortName = json["shortName"] as? String else {
      throw SerializationError.missing("shortName")
    }
    
    guard let crestUrl = json["crestUrl"] as? String else {
      throw SerializationError.missing("crestUrl")
    }
    
    self.name = name
    self.code = code
    self.shortName = shortName
    self.crestUrl = crestUrl
    
  }
  
  
}
