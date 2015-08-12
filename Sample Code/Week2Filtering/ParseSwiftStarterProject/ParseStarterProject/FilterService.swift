//
//  FilterService.swift
//  ParseStarterProject
//
//  Created by Bradley Johnson on 8/12/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit

class FilterService {
  class func sepiaImageFromOriginalImage(original : UIImage,  context : CIContext) -> UIImage! {
    
    let image = CIImage(image: original)
    let filter = CIFilter(name: "CISepiaTone")
    filter.setValue(image, forKey: kCIInputImageKey)
    return filteredImageFromFilter(filter, context: context)
  }
  
  class func instantImageFromOriginalImage(original : UIImage,context : CIContext) -> UIImage! {
    
    let image = CIImage(image: original)
    let filter = CIFilter(name: "CIPhotoEffectInstant")
    filter.setValue(image, forKey: kCIInputImageKey)
    //set the vector for the colors
    
    return filteredImageFromFilter(filter, context: context)
  }
  
  private class func filteredImageFromFilter(filter : CIFilter, context : CIContext) -> UIImage {
    
    let outputImage = filter.outputImage
    let extent = outputImage.extent()
    let cgImage = context.createCGImage(outputImage, fromRect: extent)
    return UIImage(CGImage: cgImage)!
  }
  
  
}
