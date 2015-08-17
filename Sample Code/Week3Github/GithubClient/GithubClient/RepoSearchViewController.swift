//
//  RepoSearchViewController.swift
//  GithubClient
//
//  Created by Bradley Johnson on 8/17/15.
//  Copyright (c) 2015 CF. All rights reserved.
//

import UIKit

class RepoSearchViewController: UIViewController {

  @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
      searchBar.delegate = self

        // Do any additional setup after loading the view.
    }
}

//MARK: UISearchBarDelegate
extension RepoSearchViewController : UISearchBarDelegate {
  func searchBarSearchButtonClicked(searchBar: UISearchBar) {
    
    
    GithubService.repositoriesForSearchTerm(searchBar.text)
    
  }
}
