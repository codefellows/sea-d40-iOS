//
//  TimelineViewController.swift
//  ParseStarterProject
//
//  Created by Bradley Johnson on 8/11/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class TimelineViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let query = PFQuery(className: "Post")
    
    query.findObjectsInBackgroundWithBlock { (results, error) -> Void in
      if let error = error {
        println(error.localizedDescription)
      } else if let posts = results as? [PFObject] {
        println(posts.count)
        for post in posts {
          if let imageFile = post["image"] as? PFFile {
            imageFile.getDataInBackgroundWithBlock({ (data, error) -> Void in
              if let error = error {
                println(error.localizedDescription)
              } else if let data = data,
                image = UIImage(data: data){
                  NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
                    self.view.addSubview(imageView)
                    imageView.image = image
                  })
              }
            })
          }
        }
      }
    }
    
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */
  
}
