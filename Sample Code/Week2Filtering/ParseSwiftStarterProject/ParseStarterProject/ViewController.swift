//
//  ViewController.swift
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
  
  //MARK: Constraint Buffer Constants
  let kTrailingImageViewConstraintBuffer : CGFloat = -40
  let kLeadingImageViewConstraintBuffer : CGFloat = 40
  let kTopImageViewConstraintBuffer : CGFloat = 40
  let kBottomImageViewConstraintBuffer : CGFloat = 90
  let kThumbnailSize = CGSize(width: 100, height: 100)
  
  
  let kStandardConstraintMargin : CGFloat = 8

  //MARK: Outlets
  @IBOutlet weak var topImageViewConstraint: NSLayoutConstraint!
  @IBOutlet weak var bottomImageViewConstraint: NSLayoutConstraint!
  @IBOutlet weak var bottomCollectionViewConstraint: NSLayoutConstraint!
  @IBOutlet weak var leadingImageViewConstraint: NSLayoutConstraint!
  @IBOutlet weak var trailingImageViewConstraint: NSLayoutConstraint!
  @IBOutlet weak var alertButton: UIButton!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var collectionView: UICollectionView!
  
  let picker: UIImagePickerController = UIImagePickerController()
  
  var filters : [(UIImage, CIContext) -> (UIImage!)] = [FilterService.sepiaImageFromOriginalImage, FilterService.instantImageFromOriginalImage,FilterService.sepiaImageFromOriginalImage, FilterService.instantImageFromOriginalImage,FilterService.sepiaImageFromOriginalImage, FilterService.instantImageFromOriginalImage, ]
  
  let context = CIContext(options: nil)
  var thumbnail : UIImage!
  
  let alert = UIAlertController(title: "Button Clicked", message: "Yes the button was clicked", preferredStyle: UIAlertControllerStyle.ActionSheet)
  
  var displayImage : UIImage! {
    didSet {
      imageView.image = displayImage
      thumbnail = ImageResizer.resizeImage(displayImage, size:kThumbnailSize)
      collectionView.reloadData()
    }
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      title = "Home"
      collectionView.dataSource = self
      imageView.image = UIImage(named: "placeholder.jpg")
      
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
      
      let galleryAction = UIAlertAction(title: "Gallery", style: UIAlertActionStyle.Default) { (alert) -> Void in
        self.performSegueWithIdentifier("ShowGallery", sender: self)
      }
      
      alert.addAction(uploadAction)
      alert.addAction(cancelAction)
      alert.addAction(confirmAction)
      alert.addAction(galleryAction)
    
      
      self.picker.delegate = self
      self.picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
      
      displayImage = UIImage(named: "placeholder.jpg")
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
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowGallery" {
      if let galleryViewController = segue.destinationViewController as? GalleryViewController {
        galleryViewController.delegate = self
        galleryViewController.desiredFinalImageSize = imageView.frame.size
      }
    }
  }
  
  //MARK: Helper Methods
  
  func enterFilterMode() {
    leadingImageViewConstraint.constant = kLeadingImageViewConstraintBuffer
    trailingImageViewConstraint.constant = kTrailingImageViewConstraintBuffer
    topImageViewConstraint.constant = kTopImageViewConstraintBuffer
    bottomImageViewConstraint.constant = kBottomImageViewConstraintBuffer
    bottomCollectionViewConstraint.constant = kStandardConstraintMargin
    
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


//MARK: UIImagePickerControllerDelegate
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  

  
  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
    let image: UIImage = (info[UIImagePickerControllerEditedImage] as? UIImage)!
    displayImage = image
    self.picker.dismissViewControllerAnimated(true, completion: nil)
  }
  
  func imagePickerControllerDidCancel(picker: UIImagePickerController) {
    self.picker.dismissViewControllerAnimated(true, completion: nil)
    println("Picker Cancelled")
  }
  
  
}

//MARK: UICollectionViewDataSource
extension ViewController : UICollectionViewDataSource {
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return filters.count
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ThumbnailCell", forIndexPath: indexPath) as! ThumbnailCell
    
    let filter = filters[indexPath.row]
    let filteredImage = filter(thumbnail,context)
    cell.imageView.image = filteredImage
    
    return cell
  }
}

extension ViewController : ImageSelectedDelegate {
  func controllerDidSelectImage(newImage: UIImage) {
    displayImage = newImage
  }
}

