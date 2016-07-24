//
//  ProductDetailVC.swift
//  SanatSharif
//
//  Created by CyrusREfahi on 4/14/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

import UIKit
import ImageSlideshow


class ProductDetailVC: UIViewController {

    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var PriceLabel: UILabel!
    @IBOutlet weak var ExpDateLabel: UILabel!
    @IBOutlet weak var DementionTypeLabel: UILabel!
    @IBOutlet weak var DementionAmountLabel: UILabel!
    @IBOutlet weak var TypeLabel: UILabel!
    @IBOutlet weak var Description: UITextView!
    @IBOutlet weak var AmountLabel: UILabel!
    @IBOutlet weak var RateButton_1: UIButton!
    @IBOutlet weak var RateButton_2: UIButton!
    @IBOutlet weak var imageSlider : ImageSlideshow!
    @IBOutlet weak var RateButton_3: UIButton!

    
    var product : Product!
    var Amount : Int = 0
    var rateBTN : Bool = false
    
    var transitionDelegate: ZoomAnimatedTransitioningDelegate?
    
    override func viewDidLoad() {
        
        imageSlider.slideshowInterval = 5.0
        imageSlider.pageControlPosition = PageControlPosition.UnderScrollView
        imageSlider.contentScaleMode = .ScaleAspectFill
        imageSlider.pageControl.currentPageIndicatorTintColor = UIColor.lightGrayColor();
        imageSlider.pageControl.pageIndicatorTintColor = UIColor.blackColor();
        
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector (popView))
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipeDown)
    
        NameLabel.text = product.Name
        PriceLabel.text = String(product.Price)
        ExpDateLabel.text = String(product.ExpDate)
        
        self.RateButton_1.imageView?.contentMode = .ScaleAspectFit
        self.RateButton_2.imageView?.contentMode = .ScaleAspectFit
        self.RateButton_3.imageView?.contentMode = .ScaleAspectFit

        imageSlider.setImageInputs([ImageSource(imageString: "Onion1")!, ImageSource(imageString: "Onion2")!, ImageSource(imageString: "Onion3")!, ImageSource(imageString: "Onion4")!])
        
        //        topImageScroller.setImageInputs([AlamofireSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!, AlamofireSource(urlString: "https://images.unsplash.com/photo-1447746249824-4be4e1b76d66?w=1080")!, AlamofireSource(urlString: "https://images.unsplash.com/photo-1463595373836-6e0b0a8ee322?w=1080")!])
        
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
        self.presentViewController(ctr, animated: true, completion: nil)
    }
    
    func setProductDetailVC(product : Product){
        
        self.product = product
        
    }
    
    func popView(){
        
        print("swiped Down so WTF")
        self.dismissViewControllerAnimated(true, completion: {});

        
    }
    
    

    @IBAction func DropDownClicked(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: {});
        
        
    }
    
    @IBAction func MinusBtnClicked(sender: AnyObject) {
        
        if Amount != 0 {
            Amount = Amount - 1

            AmountLabel.text = "تعداد خرید :‌ \(String(Amount))"
        }
    }

    @IBAction func PlusBtnClicked(sender: AnyObject) {
        
        Amount = Amount + 1
        AmountLabel.text = "تعداد خرید :‌ \(String(Amount))"
        
    }
    
    @IBAction func BuyBtnClicked(sender: AnyObject) {

        if Amount != 0 {
            let item : Item = Item(product: self.product, count: Amount, totalPrice: Amount * product.Price)
            UserModelManager.sharedInstance._Cart.addItemToCart(item);
        }else{
            
            //alert maybe :D
            
        }
        
        
    }
    
    @IBAction func RateBtnNumberOneClicked(sender : AnyObject){
        if(!rateBTN){
            resetButtonImages()
            self.RateButton_1.setImage( UIImage(named: "filledStar.png") , forState: UIControlState.Normal)
        }else{
            resetButtonImages()
        }
        
        rateBTN = !rateBTN

    }
    
    @IBAction func RateBtnNumberTwoClicked(sender : AnyObject){
        
        resetButtonImages()
        
        self.RateButton_1.setImage( UIImage(named: "filledStar.png") , forState: UIControlState.Normal)
        self.RateButton_2.setImage( UIImage(named: "filledStar.png") , forState: UIControlState.Normal)

        
    }
    
    @IBAction func RateBtnNumberThreeClicked(sender : AnyObject){
        
        resetButtonImages()
        
        self.RateButton_1.setImage( UIImage(named: "filledStar.png") , forState: UIControlState.Normal)
        self.RateButton_2.setImage( UIImage(named: "filledStar.png") , forState: UIControlState.Normal)
        self.RateButton_3.setImage( UIImage(named: "filledStar.png") , forState: UIControlState.Normal)
    }
    
   
    func resetButtonImages(){
        
        self.RateButton_1.setImage( UIImage(named: "emptyStar.png") , forState: UIControlState.Normal)
        self.RateButton_2.setImage( UIImage(named: "emptyStar.png") , forState: UIControlState.Normal)
        self.RateButton_3.setImage( UIImage(named: "emptyStar.png") , forState: UIControlState.Normal)

        
    }
    
    
}
