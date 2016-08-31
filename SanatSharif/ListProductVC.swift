//
//  ListProductVC.swift
//  SanatSharif
//
//  Created by cyrus refahi on 8/31/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit
import ZoomTransitioning



extension ListProductVC : ZoomTransitionSourceDelegate {
    
    
    func transitionSourceImageView() -> UIImageView {
        return selectedImageView
    }
    
    func transitionSourceImageViewFrame(forward forward: Bool) -> CGRect {
        if ( self.navigationController?.navigationBar.translucent == false){
            var temp = selectedImageView.convertRect(selectedImageView.frame, toView: self.view)
            temp.origin.y = temp.origin.y + 57
            return temp
            
        }
        var temp = selectedImageView.convertRect(selectedImageView.frame, toView: self.view)
        temp.origin.y = temp.origin.y - 8
        return temp
        
    }
    
    func transitionSourceWillBegin() {
        selectedImageView.hidden = true
    }
    
    func transitionSourceDidEnd() {
        selectedImageView.hidden = false
    }
    
    func transitionSourceDidCancel() {
        selectedImageView.hidden = false
    }
}


extension ListProductVC : BuyAnimationDelegate {
    
    func BuyBtnAnimation(image: UIImage, cellPosition: NSIndexPath) {
        
        let cellSnapshot = UIImageView(frame: CGRectMake(100, 150, 50, 50)); // set as you want
        cellSnapshot.image = image;
        
        cellSnapshot.layer.masksToBounds = false
        cellSnapshot.layer.cornerRadius = cellSnapshot.frame.size.width / 2
        cellSnapshot.clipsToBounds = true
        cellSnapshot.layer.shadowOffset = CGSizeMake(-5.0, 0.0)
        cellSnapshot.layer.shadowRadius = 5.0
        cellSnapshot.layer.shadowOpacity = 0.4
        
        self.view.addSubview(cellSnapshot)
        
        let attribute : UICollectionViewLayoutAttributes = self.collectionView.layoutAttributesForItemAtIndexPath(cellPosition)!
        let cellRect : CGRect = attribute.frame
        
        let cellFrameInSuperview : CGRect = self.collectionView.convertRect(cellRect, toView: self.view)
        
        cellSnapshot.center = CGPointMake(cellFrameInSuperview.origin.x + 50, cellFrameInSuperview.origin.y + 200)
        
        
        
        
        UIView.animateWithDuration(1, animations: {
            
            // cellSnapshot.transform = CGAffineTransformMakeTranslation( 0 , UIScreen.mainScreen().bounds.height)
            cellSnapshot.frame = CGRectMake(UIScreen.mainScreen().bounds.width / 2, UIScreen.mainScreen().bounds.height, 0, 0)
            
            
        }) { (finished) in
            if finished {
                cellSnapshot.removeFromSuperview()
            }
        }
        
    }
    
}

class ListProductVC: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource  {

    
    @IBOutlet weak var collectionView : UICollectionView!
    
    var selectedImageView : UIImageView!

    
    override func viewDidLoad() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.title = "دسته بندی"
        
    }
    
    override func viewDidAppear(animated: Bool) {
    }
    
    
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let  cell = collectionView.dequeueReusableCellWithReuseIdentifier("FoodCell", forIndexPath: indexPath) as! MainPageFoodCell
        
        cell.configureCell("۲۰۰۰", foodName: "گوجه و پیاز  ", foodImageName: "  ")
        cell.animationDelegate = self
        cell.index = indexPath
        cell.layer.shadowOffset = CGSizeMake(0, 1)
        cell.layer.shadowColor = UIColor.blackColor().CGColor
        cell.layer.shadowRadius = 1
        cell.layer.shadowOpacity = 0.6
        cell.clipsToBounds = false
        let shadowFrame: CGRect = (cell.layer.bounds)
        let shadowPath: CGPathRef = UIBezierPath(rect: shadowFrame).CGPath
        cell.layer.shadowPath = shadowPath

        
        return cell
        
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let product = Product(id: 0, name: "پیاز جعفری", price: 0, expDate: 0)
        self.selectedImageView = (self.collectionView.cellForItemAtIndexPath(indexPath) as! MainPageFoodCell).foodIMage
        performSegueWithIdentifier("showDetails", sender: product)

        
        
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        
        
        return CGSizeMake((collectionView.bounds.width - 16) / 2 , UIScreen.mainScreen().bounds.width * 0.65)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetails" {
            if let productDetailVC = segue.destinationViewController as? ProductDetailVC {
                if let product = sender as? Product {
                    productDetailVC.product = product
                }
            }
        }
    }
    
    
}
