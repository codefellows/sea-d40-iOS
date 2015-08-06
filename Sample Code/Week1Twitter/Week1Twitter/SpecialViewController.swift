//
//  SpecialViewController.swift
//  Week1Twitter
//
//  Created by Bradley Johnson on 8/6/15.
//  Copyright (c) 2015 BPJ. All rights reserved.
//

import UIKit

class SpecialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
      if let crazyView = NSBundle.mainBundle().loadNibNamed("CrazyView", owner: self, options: nil).first as? CrazyView {
        view.addSubview(crazyView)
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
