//
//  GalleryViewController.swift
//  ParseStarterProject
//
//  Created by Bradley Johnson on 8/13/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit
import Photos

protocol ImageSelectedDelegate : class {
  func controllerDidSelectImage(UIImage) -> (Void)
}

class GalleryViewController: UIViewController {
  
  var fetchResult : PHFetchResult!
  let cellSize = CGSize(width: 100, height: 100)
  var desiredFinalImageSize : CGSize!
  var startingScale : CGFloat = 0
  var scale : CGFloat = 0
  
  
  @IBOutlet weak var collectionView: UICollectionView!
  weak var delegate : ImageSelectedDelegate?

  //MARK: ViewController Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    
     
      
     fetchResult = PHAsset.fetchAssetsWithMediaType(PHAssetMediaType.Image, options: nil)
      
      collectionView.dataSource = self
      collectionView.delegate = self
      
      let pinchGesture = UIPinchGestureRecognizer(target: self, action: "pinchRecognized:")
      collectionView.addGestureRecognizer(pinchGesture)
        // Do any additional setup after loading the view.
    }
  
  func pinchRecognized(pinch : UIPinchGestureRecognizer) {
    //println(pinch.scale)
    
    if pinch.state == UIGestureRecognizerState.Began {
      println("began!")
      startingScale = pinch.scale
    }
    
    if pinch.state == UIGestureRecognizerState.Changed {
      println("changed!")
    }
    
    if pinch.state == UIGestureRecognizerState.Ended {
      println("ended!")
      scale = startingScale * pinch.scale
      let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
      let newSize = CGSize(width: layout.itemSize.width * scale, height: layout.itemSize.height * scale)
  
      collectionView.performBatchUpdates({ () -> Void in
        layout.itemSize = newSize
        layout.invalidateLayout()
      }, completion: nil )
      
    }
  }

}

//MARK: UICollectionViewDataSource
extension GalleryViewController : UICollectionViewDataSource {
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return fetchResult.count
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("GalleryCell", forIndexPath: indexPath) as! ThumbnailCell
    
    if let asset = fetchResult[indexPath.row] as? PHAsset {
       PHCachingImageManager.defaultManager().requestImageForAsset(asset, targetSize: cellSize, contentMode: PHImageContentMode.AspectFill, options: nil) { (image, info) -> Void in
        
        if let image = image {
          println("calling request handler for row :\(indexPath.row) for image size: \(image.size)")
          cell.imageView.image = image
        }
      }
    }
    
    return cell
  }
}

extension GalleryViewController : UICollectionViewDelegate {
  func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    
    
    let options = PHImageRequestOptions()
    options.synchronous = true
    
    if let asset = fetchResult[indexPath.row] as? PHAsset {
      PHCachingImageManager.defaultManager().requestImageForAsset(asset, targetSize: desiredFinalImageSize, contentMode: PHImageContentMode.AspectFill, options: options) { (image, info) -> Void in
        
        if let image = image {
          println("calling request handler for row :\(indexPath.row) for image size: \(image.size)")
          self.delegate?.controllerDidSelectImage(image)
          self.navigationController?.popViewControllerAnimated(true)
        }
      }
    }
  }
}
