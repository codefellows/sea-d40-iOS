//
//  GithubService.swift
//  GithubClient
//
//  Created by Bradley Johnson on 8/17/15.
//  Copyright (c) 2015 CF. All rights reserved.
//

import Foundation


class GithubService {
  class func repositoriesForSearchTerm(searchTerm : String) {
    let baseURL = "http://localhost:3000"
    let finalURL = baseURL + "?q=\(searchTerm)"
    
    if let url = NSURL(string: finalURL) {
      NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
        if let error = error {
          println("error")
        } else if let httpResponse = response as? NSHTTPURLResponse {
          println(httpResponse)
          
          
        }
      }).resume()
    }
    
  }
  
  class func userForSearchTerm(searchTerm : String, userSearchCallback : (errorDescription : String?, users :[User]?) -> (Void)) {
    let baseURL = "https://api.github.com/search/users"
    let finalURL = baseURL + "?q=\(searchTerm)"
    let request = NSMutableURLRequest(URL: NSURL(string: finalURL)!)
    if let token = KeychainService.loadToken() {
      request.setValue("token \(token)", forHTTPHeaderField: "Authorization")
    }
    
    if let url = NSURL(string: finalURL) {
      NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
        if let error = error {
          println("error")
        } else if let httpResponse = response as? NSHTTPURLResponse {
          println(httpResponse)
          //i have the data, got my response
          
          userSearchCallback(errorDescription: nil, users: nil)
          
          
        }
      }).resume()
    }
    
  }
  
}







