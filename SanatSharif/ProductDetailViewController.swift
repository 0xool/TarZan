//
//  ProductDetailViewController.swift
//  SanatSharif
//
//  Created by cyrus refahi on 8/27/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit
import IOStickyHeader
import ZoomTransitioning



extension ProductDetailViewController : ZoomTransitionDestinationDelegate {
    
    func transitionDestinationImageViewFrame(forward forward: Bool) -> CGRect {
        if forward {
            let x: CGFloat = 0.0
            let y : CGFloat = 0
            let width = view.frame.width
            let height = width * 3.0 / 3.0
            return CGRect(x: x, y: y, width: width, height: height)
        } else {
            
            return CGRect(x: productDetailHeader.imageSlider.frame.origin.x, y: productDetailHeader.imageSlider.frame.origin.y, width: productDetailHeader.imageSlider.frame.width, height: productDetailHeader.imageSlider.frame.height)
            //return productDetailHeader.imageSlider.convertRect(productDetailHeader.imageSlider.frame, toView: view)
        }
    }
    
    func transitionDestinationWillBegin() {
       //self.collectionView.alpha = 0
        if headerInitBool {
            self.productDetailHeader.removeSliderImages()
            self.collectionView.scrollsToTop = true
        }
        
    }
    
    func transitionDestinationDidEnd(transitioningImageView imageView: UIImageView) {
        //productDetailHeader.imageSlider.hidden = false
        //largeImageView.image = imageView.image
        self.productDetailHeader.initSliderView()
        headerInitBool = true
        
    }
    
    func transitionDestinationDidCancel() {
        //productDetailHeader.imageSlider.hidden = false
        
    }
}

extension ProductDetailViewController : backBtnClickedProtocol{
    
    func backBtnClicked() {
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
}


class ProductDetailViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var collectionView : UICollectionView!
    
    
    let headerNib = UINib(nibName: "ProductDetailHeader", bundle: NSBundle.mainBundle())
    let footerNib = UINib(nibName: "ProductDetailFooterView", bundle: NSBundle.mainBundle())
    

    private var largeImageView : UIImageView! = UIImageView()
    var productDetailHeader : ProductDetailHeader!
    private var headerInitBool : Bool = false
    
    override func viewDidLoad() {
       
        collectionView.delegate = self
        collectionView.dataSource = self
        
//        self.navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics: .Default)
//        self.navigationController?.navigationBar.shadowImage = nil
//        self.navigationController?.navigationBar.backgroundColor = UIColor.whiteColor()
//        self.navigationController?.navigationBar.alpha = 1
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
      //  self.prefersStatusBarHidden()
//        self.navigationController?.navigationBarHidden = true
//        UIApplication.sharedApplication().statusBarHidden = true
        
        
        
        if let layout: IOStickyHeaderFlowLayout = self.collectionView.collectionViewLayout as? IOStickyHeaderFlowLayout {
            layout.parallaxHeaderReferenceSize = CGSizeMake(UIScreen.mainScreen().bounds.size.width, 400)
            layout.parallaxHeaderMinimumReferenceSize = CGSizeMake(UIScreen.mainScreen().bounds.size.width, 150)
            layout.itemSize = CGSizeMake(UIScreen.mainScreen().bounds.size.width, layout.itemSize.height)
            layout.parallaxHeaderAlwaysOnTop = true
            layout.disableStickyHeaders = true
            self.collectionView.collectionViewLayout = layout
        }
        
        self.collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, 0)
        
        self.collectionView.registerNib(self.headerNib, forSupplementaryViewOfKind: IOStickyHeaderParallaxHeader, withReuseIdentifier: "header")

        
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        
//        self.navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics: .Default)
//        self.navigationController?.navigationBar.shadowImage = nil
//        self.navigationController?.navigationBar.translucent = true
//        self.navigationController?.navigationBar.backgroundColor  = UIColor(red: 0 / 255.0, green: 128 / 255.0, blue: 0 / 255.0, alpha: 1)

    }
    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0{
            let cell = self.collectionView.dequeueReusableCellWithReuseIdentifier("ProductInfoCell", forIndexPath:     indexPath)
            return cell
        }
        
        if indexPath.row == 1{
            let cell = self.collectionView.dequeueReusableCellWithReuseIdentifier("ProductRateCell", forIndexPath:     indexPath)
            return cell
        }
        
//        if indexPath.row == 1{
//            let cell = self.collectionView.dequeueReusableCellWithReuseIdentifier("ProductPriceCell", forIndexPath:     indexPath)
//            return cell
//        }
        
        if indexPath.row == 2{
            let cell = self.collectionView.dequeueReusableCellWithReuseIdentifier("ProductDateCell", forIndexPath:     indexPath)
            return cell
        }
        
//        if indexPath.row == 3{
//            let cell = self.collectionView.dequeueReusableCellWithReuseIdentifier("ProductDemensionCell", forIndexPath:     indexPath)
//            return cell
//        }
        
//        if indexPath.row == 4{
//            let cell = self.collectionView.dequeueReusableCellWithReuseIdentifier("ProductTypeCell", forIndexPath:     indexPath)
//            return cell
//        }
        
        if indexPath.row == 3 {
            let cell = self.collectionView.dequeueReusableCellWithReuseIdentifier("ProductDescCell", forIndexPath:     indexPath)
            return cell
        }
        
        return UICollectionViewCell()
        
    }
    
    
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
       
        if indexPath.row == 3 {
            return CGSizeMake(UIScreen.mainScreen().bounds.size.width, 300);
        }
        
        if indexPath.row == 0 {
            return CGSizeMake(UIScreen.mainScreen().bounds.size.width, 100);
        }
        
            return CGSizeMake(UIScreen.mainScreen().bounds.size.width, 50);
       
        
    }
    
    
    
        func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
           
            switch kind {
            

            
            case IOStickyHeaderParallaxHeader:
                let cell = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "header", forIndexPath: indexPath) as! ProductDetailHeader
                
                
                self.largeImageView = cell.imageSlider.currentSlideshowItem?.imageView
                cell.btnDelegate = self
                cell.configureCell("", image: UIImage())
                productDetailHeader = cell.self
                //cell.configureCell("test", image: UIImage())
//                if basket.bImage != nil{
//                    cell.configureCell(self.basket.bName!, image: FileManager().readImageFromFile(self.basket.bImage!))
//                }else{
//                    cell.configureCell(self.basket.bName!, image: UIImage(named: "GroceryTemp3")!)
//                }
                return cell

            
            
                
            default:
                assert(false, "Unexpected element kind")
            }
        }
    
    
    
    
    
    
}
