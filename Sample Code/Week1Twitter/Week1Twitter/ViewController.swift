//
//  ViewController.swift
//  TwitterCF
//
//  Created by Bradley Johnson on 8/3/15.
//  Copyright (c) 2015 BPJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  //var posts = [Post]()
  var tweets = [Tweet]()

  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  @IBOutlet weak var tableView: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.navigationController?.navigationBarHidden = true
    
    tableView.estimatedRowHeight = 70
    tableView.rowHeight = UITableViewAutomaticDimension
    
    LoginService.loginForTwitter { (errorDescription, account) -> (Void) in
      if let errorDescription = errorDescription {
        //warn the user
      }
      
      if let account = account {
        TwitterService.sharedService.account = account
        NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
          self.activityIndicator.startAnimating()
        })
        
        TwitterService.tweetsFromHomeTimeline( { (errorDescription, tweets) -> (Void) in
          if let tweets = tweets {
            NSOperationQueue.mainQueue().addOperationWithBlock { () -> Void in
              self.tweets = tweets
              self.activityIndicator.stopAnimating()
              self.tableView.reloadData()
            }
          }
          
        })
        
      }
    }
    
    self.view.constraints()
    
    tableView.dataSource = self
    tableView.reloadData()
//    if let filepath = NSBundle.mainBundle().pathForResource("instagram", ofType: "json") {
//      if let data = NSData(contentsOfFile: filepath) {
//        if let posts = PostJSONParser.postsFromJSONData(data) {
//          self.posts = posts
//        }
//      
//      }
//    }
    // Do any additional setup after loading the view, typically from a nib.
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateLabels", name: UIContentSizeCategoryDidChangeNotification, object: nil)
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  deinit {
    
    NSNotificationCenter.defaultCenter().removeObserver(self, name: UIContentSizeCategoryDidChangeNotification, object: nil)
    
  }

  func updateLabels() {
    
    self.tableView.reloadData()
    
  }
  
}

//MARK: UITableViewDataSource
extension ViewController : UITableViewDataSource {
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tweets.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("PostCell", forIndexPath: indexPath) as! TweetCell
    let tweet = tweets[indexPath.row]
    //cell.textLabel?.text = tweet.text
    cell.usernameLabel.text = tweet.username
    cell.tweetLabel.text = tweet.text
    cell.usernameLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
    
    return cell
  }
}

