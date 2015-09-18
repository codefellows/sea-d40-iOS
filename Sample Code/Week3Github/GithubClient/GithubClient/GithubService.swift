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
  
  class func createFileOnRepo() {
  let baseURL = "https://api.github.com/repos/bradleypj823/TestFromApi/contents/test2"
  let request = NSMutableURLRequest(URL: NSURL(string: baseURL)!)
    request.HTTPMethod = "PUT"
    let filePath = NSBundle.mainBundle().pathForResource("go1", ofType: "html")
   // let rawData = [NSData (contentsOfFile: <#String#>)]
    let htmlString = 
     let json = [
        "message": "my commit message",
        "committer": [
          "name": "Brad",
          "email": "johnson.bradley01@gmail.com"
        ],
        "content": "bXkgbmV3IGZpbGUgY29udGVudHM="
    ]
    
    
    
    let data = NSJSONSerialization.dataWithJSONObject(json, options: nil, error: nil)
    request.HTTPBody = data
    
    if let token = KeychainService.loadToken() {
      request.setValue("token \(token)", forHTTPHeaderField: "Authorization")
    }
    
    NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
      println(response)
      let object = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil)
      println(object)
      
    }).resume()
    
    
  }
  
  class func createRepo() {
    let baseURL = "https://api.github.com/user/repos?name=TestFromApi"
    let request = NSMutableURLRequest(URL: NSURL(string: baseURL)!)
    if let token = KeychainService.loadToken() {
      request.setValue("token \(token)", forHTTPHeaderField: "Authorization")
    }
    request.HTTPMethod = "POST"
    
    let json = ["name" : "TestFromApi"]
    let data = NSJSONSerialization.dataWithJSONObject(json, options: nil, error: nil)
    request.HTTPBody = data
    
    NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
      println(response)
     let object = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil)
      println(object)
      
    }).resume()
    
   
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
          
          if httpResponse.statusCode == 200 {
            if let users = UserJSONParser.usersFromJSONData(data) {
              NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                userSearchCallback(errorDescription: nil, users: users)
              })
            }
          }
          
          userSearchCallback(errorDescription: nil, users: nil)
          
          
        }
      }).resume()
    }
    
  }
  
}







