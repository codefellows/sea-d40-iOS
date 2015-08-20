//
//  UserJSONParser.swift
//  GithubClient
//
//  Created by Bradley Johnson on 8/20/15.
//  Copyright (c) 2015 CF. All rights reserved.
//

import Foundation

class UserJSONParser {
  
  class func usersFromJSONData(jsonData : NSData) -> [User]? {
    if let rootObject = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: nil) as? [String : AnyObject],
    items = rootObject["items"] as? [[String : AnyObject]] {
      var users = [User]()
      for item in items {
        if let login = item["login"] as? String,
        id = item["id"] as? Int,
        avatarURL = item["avatar_url"] as? String {
          let user = User(login: login, avatarURL: avatarURL, id: "\(id)", image: nil)
          users.append(user)
        }
      }
      return users
    }
    return nil
  }
}