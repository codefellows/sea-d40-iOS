//
//  WebViewController.swift
//  GithubClient
//
//  Created by Bradley Johnson on 8/20/15.
//  Copyright (c) 2015 CF. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
      let webView = WKWebView(frame: view.frame)
      view.addSubview(webView)
      
      let urlRequest = NSURLRequest(URL: NSURL(string: "http://google.com")!)
      webView.loadRequest(urlRequest)
    
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
