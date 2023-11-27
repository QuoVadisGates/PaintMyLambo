//
//  ViewController.swift
//  PhotoFilters
//
//  Created by QuoVadis Gates on 12/2/14.
//  Copyright (c) 2014 QuoVadis Gates. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var photoImageView: UIImageView!
    
    //Create a place to render the filter image
    let context = CIContext(options: nil)
    
    @IBAction func applyFilter(sender: AnyObject) {
        
        // Create an image to filter
        let inputImage = CIImage(image: photoImageView.image)
        
        // Create a random color to pass to a filter
        let randomColor = [kCIInputAngleKey: (Double(arc4random_uniform(314)) / 100)]
        
        // Apply a filter to the image 
        let filteredImage = inputImage.imageByApplyingFilter("CIHueAdjust", withInputParameters: randomColor)
        
        // Render the filter image
        let reneredImage = context.createCGImage(filteredImage, fromRect:filteredImage.extent())
        
        // Reflect the change back in the interface
        photoImageView.image = UIImage(CGImage: reneredImage)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

