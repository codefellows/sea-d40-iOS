//
//  TestAnimationsViewController.swift
//  GithubClient
//
//  Created by Bradley Johnson on 8/19/15.
//  Copyright (c) 2015 CF. All rights reserved.
//

import UIKit

class TestAnimationsViewController: UIViewController {

  @IBOutlet weak var greenView: UIView!
  
  @IBOutlet weak var redView: UIView!
  @IBAction func animate(sender: AnyObject) {
    
          //self.greenView.transform = CGAffineTransformScale(self.greenView.transform, 1.5, 1.5)
    
    UIView.animateWithDuration(0.3, animations: { () -> Void in
      //self.redView.center = CGPoint(x: 200, y: 400)
      //self.greenView.transform = CGAffineTransformScale(self.greenView.transform, 0.75, 0.75)
      self.greenView.alpha = 1
      self.greenView.transform = CGAffineTransformRotate(self.greenView.transform, CGFloat(M_PI * 45.0 / 180.0))
//      self.greenView.frame = CGRect(origin: self.greenView.frame.origin, size: CGSize(width: self.greenView.frame.width * 2, height: self.greenView.frame.height * 2))
    })
    
//    UIView.animateWithDuration(0.3, animations: { () -> Void in
//            self.greenView.center = CGPoint(x: 100, y: 400)
//            self.greenView.alpha = 0
//    }) { (finished) -> Void in
//      if finished {
//        self.greenView.alpha = 1
//      }
//    }
    
//    UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
//                  self.greenView.center = CGPoint(x: 100, y: 400)
//    }, completion: nil)
    
//    UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1.4, options: .Autoreverse | .Repeat, animations: { () -> Void in
//                        self.greenView.center = CGPoint(x: 100, y: 400)
//      }, completion: {(finished) -> Void in
//     println("finished")
//        
//    })
    
//    UIView.animateKeyframesWithDuration(3.0, delay: 0.0, options: nil, animations: { () -> Void in
//      UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.25, animations: { () -> Void in
//        self.greenView.center = CGPoint(x: 100, y: 400)
//      })
//      UIView.addKeyframeWithRelativeStartTime(0.25, relativeDuration: 0.5, animations: { () -> Void in
//        self.redView.center = CGPoint(x: 300, y: 400)
//      })
//      UIView.addKeyframeWithRelativeStartTime(0.75, relativeDuration: 0.25, animations: { () -> Void in
//        self.greenView.center = CGPoint(x: -300, y: 400)
//        self.redView.center = CGPoint(x: 600, y: 400)
//      })
//    }, completion: nil)
    
  }
    override func viewDidLoad() {
        super.viewDidLoad()
      
      greenView.alpha = 0
      //redView.alpha = 0

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
