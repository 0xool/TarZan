//
//  ProductDetailHeader.swift
//  SanatSharif
//
//  Created by cyrus refahi on 8/27/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit
import SABlurImageView
import ImageSlideshow


class ProductDetailHeader: UICollectionViewCell {
    
    
    
    @IBOutlet weak var imageSlider : ImageSlideshow!
 
    let screenWidthSize = UIScreen.mainScreen().bounds.width
    let screenHeightSize = UIScreen.mainScreen().bounds.height    
    var transitionDelegate: ZoomAnimatedTransitioningDelegate?

    
    override func awakeFromNib() {
        
        imageSlider.pageControlPosition = PageControlPosition.Hidden
        imageSlider.contentScaleMode = .ScaleAspectFill
        imageSlider.pageControl.currentPageIndicatorTintColor = UIColor.lightGrayColor();
        imageSlider.pageControl.pageIndicatorTintColor = UIColor.blackColor();
        
        //imageSlider.setImageInputs([ImageSource(imageString: "Onion2")!, ImageSource(imageString: "Onion1")!, ImageSource(imageString: "Onion3")!, ImageSource(imageString: "Onion4")!])
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(click))
        imageSlider.addGestureRecognizer(recognizer)
        
    }
    
    func click() {
        let ctr = FullScreenSlideshowViewController()
        ctr.pageSelected = {(page: Int) in
            self.imageSlider.setScrollViewPage(page, animated: false)
        }
        
        ctr.initialImageIndex = imageSlider.scrollViewPage
        ctr.inputs = imageSlider.images
        self.transitionDelegate = ZoomAnimatedTransitioningDelegate(slideshowView: imageSlider, slideshowController: ctr)
        // Uncomment if you want disable the slide-to-dismiss feature
        // self.transitionDelegate?.slideToDismissEnabled = false
        ctr.transitioningDelegate = self.transitionDelegate
        //self.presentViewController(ctr, animated: true, completion: nil)
    }
    
    func configureCell ( title : String , image : UIImage  ){
        
        
        self.imageSlider.hidden = false
        imageSlider.setImageInputs([ImageSource(imageString: "Onion2")!, ImageSource(imageString: "Onion1")!, ImageSource(imageString: "Onion3")!, ImageSource(imageString: "Onion4")!])
        
        
        // Put it somewhere, give it a frame...
 
        
    }

}