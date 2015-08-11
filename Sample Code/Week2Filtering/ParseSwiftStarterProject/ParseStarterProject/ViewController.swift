//
//  ViewController.swift
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

  @IBOutlet weak var topImageViewConstraint: NSLayoutConstraint!
  @IBOutlet weak var bottomImageViewConstraint: NSLayoutConstraint!
  @IBOutlet weak var bottomCollectionViewConstraint: NSLayoutConstraint!
  @IBOutlet weak var leadingImageViewConstraint: NSLayoutConstraint!
  @IBOutlet weak var trailingImageViewConstraint: NSLayoutConstraint!
  @IBOutlet weak var alertButton: UIButton!
  
  @IBOutlet weak var imageView: UIImageView!
  
  let picker: UIImagePickerController = UIImagePickerController()
  
  let alert = UIAlertController(title: "Button Clicked", message: "Yes the button was clicked", preferredStyle: UIAlertControllerStyle.ActionSheet)
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      title = "Home"
      
//      if let constraints = view.constraints() as? [NSLayoutConstraint] {
//        println(constraints.count)
//        
//        for constraint in constraints {
//          if let imageView = constraint.firstItem as? UIImageView {
//            println(constraint.constant)
//          }
//          
//          if let imageView = constraint.secondItem as? UIImageView {
//            println(constraint.constant)
//            constraint.constant = 30
//          }
//        }
//      }
      
     
        // Do any additional setup after loading the view, typically from a nib.
      
      if UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad {
        
      }
      
      let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (alert) -> Void in
        println("alert cancelled")
      }
      
      if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
      let cameraAction = UIAlertAction(title: "Camera", style: UIAlertActionStyle.Default) { (alert) -> Void in
        
      }
        alert.addAction(cameraAction)
      }
      

      
      let confirmAction = UIAlertAction(title: "Photo Library", style: UIAlertActionStyle.Default) { (alert) -> Void in
        self.picker.allowsEditing = true
        self.presentViewController(self.picker, animated: true, completion: nil)
        println("confirm")
      }
      
      let sepiaAction = UIAlertAction(title: "Sepia", style: UIAlertActionStyle.Default) { (alert) -> Void in
        
        let image = CIImage(image: self.imageView.image!)
        let sepiaFilter = CIFilter(name: "CIPhotoEffectInstant")
        sepiaFilter.setValue(image, forKey: kCIInputImageKey)
        
        //cpu context, not as fast as GPU context
        let context = CIContext(options: nil)
        
        //gpu context
        let options = [kCIContextWorkingColorSpace : NSNull()]
        let eaglContext = EAGLContext(API: EAGLRenderingAPI.OpenGLES2)
        let gpuContext = CIContext(EAGLContext: eaglContext, options: options)
        
        
        let outputImage = sepiaFilter.outputImage
        let extent = outputImage.extent()
        let cgImage = gpuContext.createCGImage(outputImage, fromRect: extent)
        let finalImage = UIImage(CGImage: cgImage)
        self.imageView.image = finalImage
        
      }
      
      if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
      
      let filterAction = UIAlertAction(title: "Filter", style: UIAlertActionStyle.Default) { (alert) -> Void in
        self.enterFilterMode()
      }
        
        alert.addAction(filterAction)
      }
      
      let uploadAction = UIAlertAction(title: "Upload", style: UIAlertActionStyle.Default) { (alert) -> Void in
        
        let post = PFObject(className: "Post")
        post["text"] = "blah blah blah"
        
        if let image = self.imageView.image,
        data = UIImageJPEGRepresentation(image, 1.0)
        {
          let file = PFFile(name: "post.jpeg", data: data)
          post["image"] = file
        }
        
        post.saveInBackgroundWithBlock({ (succeeded, error) -> Void in
          
        })
      }
      
      alert.addAction(uploadAction)
      alert.addAction(cancelAction)
      alert.addAction(confirmAction)
      alert.addAction(sepiaAction)
      
      self.picker.delegate = self
      self.picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  @IBAction func buttonPressed(sender: AnyObject) {
    
    alert.modalPresentationStyle = UIModalPresentationStyle.Popover
    
    if let popover = alert.popoverPresentationController {
      popover.sourceView = view
      popover.sourceRect = alertButton.frame
    }
    self.presentViewController(alert, animated: true, completion: nil)
    
  }
  
  func enterFilterMode() {
    leadingImageViewConstraint.constant = 40
    trailingImageViewConstraint.constant = -40
    topImageViewConstraint.constant = 40
    bottomImageViewConstraint.constant = 70
    bottomCollectionViewConstraint.constant = 8
    
    UIView.animateWithDuration(0.3, animations: { () -> Void in
      self.view.layoutIfNeeded()
    })
    
    let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Done, target: self, action: "closeFilterMode")
    navigationItem.rightBarButtonItem = doneButton
  }
  
  func closeFilterMode() {
    println("closing")
  }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  

  
  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
    let image: UIImage = (info[UIImagePickerControllerEditedImage] as? UIImage)!
    self.imageView.image = image
    self.picker.dismissViewControllerAnimated(true, completion: nil)
  }
  
  func imagePickerControllerDidCancel(picker: UIImagePickerController) {
    self.picker.dismissViewControllerAnimated(true, completion: nil)
    println("Picker Cancelled")
  }
  
  
}

