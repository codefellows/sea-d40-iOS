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
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
}

extension UserSearchViewController : UISearchBarDelegate {
  func searchBarSearchButtonClicked(searchBar: UISearchBar) {
    
    GithubService.userForSearchTerm(searchBar.text)
    //make our request to for users
  }
}
