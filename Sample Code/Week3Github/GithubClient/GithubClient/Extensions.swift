//
//  Extensions.swift
//  GithubClient
//
//  Created by Bradley Johnson on 8/20/15.
//  Copyright (c) 2015 CF. All rights reserved.
//

import Foundation

extension String {
  func validateForURL() -> Bool {
    
    var error : NSError?

    if let regex = NSRegularExpression(pattern: "[^0-9a-zA-Z\n]", options: nil, error: &error){
      let matches = regex.numberOfMatchesInString(self, options: nil, range:NSRange(location: 0, length: count(self)))
      
      return matches > 0 ?  false : true
    }
    return false

  }
}
