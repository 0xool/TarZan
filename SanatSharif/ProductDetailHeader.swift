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

protocol backBtnClickedProtocol {
    
    func backBtnClicked()
    
}


class ProductDetailHeader: UICollectionViewCell {
    
    
    
    @IBOutlet weak var imageSlider : ImageSlideshow!
    @IBOutlet weak var backBtn : UIButton!
 
    let screenWidthSize = UIScreen.mainScreen().bounds.width
    let screenHeightSize = UIScreen.mainScreen().bounds.height    
    
    var transitionDelegate: ZoomAnimatedTransitioningDelegate?
    var btnDelegate : backBtnClickedProtocol!
    
    

    
    override func awakeFromNib() {
        
        imageSlider.pageControlPosition = PageControlPosition.Hidden
        imageSlider.contentScaleMode = .ScaleAspectFit
        imageSlider.pageControl.currentPageIndicatorTintColor = UIColor.lightGrayColor();
        imageSlider.pageControl.pageIndicatorTintColor = UIColor.blackColor();
        imageSlider.slideshowInterval = 5
        imageSlider.userInteractionEnabled = false
        
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
    
    
    func removeSliderImages()  {
//        if imageSliderAlhpaIsSet {
            imageSlider.alpha = 0
            self.backBtn.alpha = 0
//            imageSliderAlhpaIsSet = false
//        }
    }
    
    func initSliderView(){
        
            imageSlider.alpha = 1
            backBtn.alpha = 1
//            imageSliderAlhpaIsSet = true
        
        imageSlider.setImageInputs([ImageSource(imageString: "Onion2")!, ImageSource(imageString: "Onion1")!, ImageSource(imageString: "Onion3")!, ImageSource(imageString: "Onion4")!])
    }
    
    func configureCell ( title : String , image : UIImage  ){
        
        //self.imageSlider.

        self.imageSlider.hidden = false
        
        
        
        // Put it somewhere, give it a frame...
    }

    @IBAction func backBtnClicked (){
        
        self.btnDelegate.backBtnClicked()
        
    }
    
}