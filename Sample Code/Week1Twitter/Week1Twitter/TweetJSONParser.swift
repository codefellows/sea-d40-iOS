//
//  TweetJSONParser.swift
//  TwitterCF
//
//  Created by Bradley Johnson on 8/3/15.
//  Copyright (c) 2015 BPJ. All rights reserved.
//


import UIKit

class TweetJSONParser {
  class func tweetsFromJSONData(jsonData : NSData) -> [Tweet]? {
    var error : NSError?
    
    if let rootObject = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: &error) as? [[String : AnyObject]] {
      var tweets = [Tweet]()
      for tweetObject in rootObject {
        if let text = tweetObject["text"] as? String,
          id = tweetObject["id_str"] as? String,
          userInfo = tweetObject["user"] as? [String : AnyObject],
          username = userInfo["name"] as? String,
          profileImageURL = userInfo["profile_image_url"] as? String {
            var tweet = Tweet(text: text, id: id, username: username, profileImageURL: profileImageURL, profileImage: nil)
            tweets.append(tweet)
        }
      }
      return tweets
    }
    return nil
  }
}

//TweetJSONParser.tweetsFromJSONData(<#jsonData: NSData#>)

//
//let myParser = TweetJSONParser()
//myParser.tweetsFromJSONData(<#jsonData: NSData#>)