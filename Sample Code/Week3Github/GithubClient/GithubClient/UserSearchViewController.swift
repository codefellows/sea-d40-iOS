//
//  UserSearchViewController.swift
//  GithubClient
//
//  Created by Bradley Johnson on 8/19/15.
//  Copyright (c) 2015 CF. All rights reserved.
//

import UIKit

class UserSearchViewController: UIViewController {

  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var collectionView: UICollectionView!
  
  let imageQueue = NSOperationQueue()
  
  var users = [User]()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      
        //imageQueue.maxConcurrentOperationCount = 1
        searchBar.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.delegate = self

  }
  
  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)
    navigationController?.delegate = nil

  }

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowUserDetail" {
      if let destination = segue.destinationViewController as? UserDetailViewController,
        indexPath = collectionView.indexPathsForSelectedItems().first as? NSIndexPath {
        let user = users[indexPath.row]
        destination.selectedUser = user
      }
    }
  }
  
}

extension UserSearchViewController : UISearchBarDelegate {
  func searchBarSearchButtonClicked(searchBar: UISearchBar) {
    searchBar.resignFirstResponder()
    
    GithubService.userForSearchTerm(searchBar.text, userSearchCallback: { (errorDescription, users) -> (Void) in
      if let error = errorDescription {
        
      } else if let users = users {
        self.users = users
        self.collectionView.reloadData()
        
      }
    })
    //make our request to for users
  }
  
  func searchBar(searchBar: UISearchBar, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
    
    return text.validateForURL()
  
}
  
}

extension UserSearchViewController : UICollectionViewDataSource {
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return users.count
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("UserCell", forIndexPath: indexPath) as! UserCell
    
    cell.avatarImageView.image = nil
    cell.hidden = false
    cell.alpha = 0
    
    cell.tag++
    let tag = cell.tag
    
    var user = users[indexPath.row]
    
    if let image = user.image {
      cell.avatarImageView.image = image
    } else {
      
      ImageService.fetchProfileImage(user.avatarURL, imageQueue: imageQueue, completionHandler: { (image) -> () in
        user.image = image
        self.users[indexPath.row] = user
        if cell.tag == tag {
          cell.avatarImageView.image = user.image
          
          UIView.animateWithDuration(0.3, animations: { () -> Void in
            cell.alpha = 1
          })
        }
      })
    }
    return cell
  }
}

extension UserSearchViewController : UINavigationControllerDelegate {
  func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    
    
    return toVC is UserDetailViewController ? ToUserDetailAnimationController() : nil
    
  }
}
