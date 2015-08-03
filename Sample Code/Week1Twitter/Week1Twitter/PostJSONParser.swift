//
//  PostJSONParser.swift
//  TwitterCF
//
//  Created by Bradley Johnson on 8/3/15.
//  Copyright (c) 2015 BPJ. All rights reserved.
//

import Foundation

class PostJSONParser {
  class func postsFromJSONData(jsonData : NSData) -> [Post]? {
    
    var error : NSError?
    
    if let rootObject = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: &error) as? [String : AnyObject],
      data = rootObject["data"] as? [[String : AnyObject]]
    {
      
      var posts = [Post]()
      for postObject in data {
        if let username = postObject["username"] as? String,
          firstname = postObject["first_name"] as? String,
          profilePicture = postObject["profile_picture"] as? String {
            println(username)
            let post = Post(username: username, firstname: firstname, profilePicture: profilePicture)
            posts.append(post)
        } else {
          
        }
      }
      
      return posts
    }
    
    if let error = error {
      //examine error in here
    }
    return nil
  }
}
