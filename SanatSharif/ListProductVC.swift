//
//  ListProductVC.swift
//  SanatSharif
//
//  Created by cyrus refahi on 8/31/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit
import ZoomTransitioning
import Alamofire
import SwiftyJSON



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

extension ListProductVC : HolderViewDelegate {
    
    func animateLabel() {
        
    }
    
    func addHolderView() {
        let boxSize: CGFloat = 100.0
        holderView.frame = CGRect(x: view.bounds.width / 2 - boxSize / 2,
                                  y: view.bounds.height / 2 - boxSize / 2,
                                  width: boxSize,
                                  height: boxSize)
        holderView.parentFrame = view.frame
        holderView.delegate = self
        
        view.addSubview(holderView)
        holderView.addOval()
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
    var holderView = HolderView(frame: CGRectZero)

    
    private var category : ProductCategory!
    
    var Category : ProductCategory{
        get{
            return category
        }
        set{
            category = newValue
        }
    }
    
    private var productList : [Product]! = [Product]()

    
    override func viewDidLoad() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        print("The Category is : \(category.name)")
        
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.title = "دسته بندی"
        
        Alamofire.request(.GET, "https://tarzan.ir/wc-api/v3/products", parameters: ["consumer_key": "ck_159770fbacaffae3aee064d2c96d79dee61c457c" , "consumer_secret" : "cs_bf53a78ddcb1ebaa1e24716af75ee773916ef040" , "per_page" : "35" ])
            .responseJSON { response in
                //print(response.request)  // original URL request
//                print(response.response) // URL response
//                print(response.data)     // server data
//                print(response.result)   // result of response serialization
                
                switch response.result {
                case .Success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        
                        for (_,subJson):(String, JSON) in json["products"] {
            
                            print("JSON: \(json["products"])")
                                let categoryArrayList = subJson["categories"].array
                                //add to collectionViewModel
                            for cat in categoryArrayList!{
                                
                                //print(self.category.name)
                                if cat.string == self.category.name{
//                                    print("\(subJson["title"].string)")
                                    let product : Product = Product()
                                    product.Name = subJson["title"].stringValue
                                    product.Price = subJson["price"].intValue
                                    product.ID = subJson["id"].intValue
                                    product.imageSRC = subJson["featured_src"].stringValue
                                    
                                    self.productList.append(product)
                                    
                                }

                            }
                                
                            
                            
                        }
                        self.holderView.removeFromSuperview()
                        self.view.userInteractionEnabled = true
                        self.collectionView.reloadData()
                    
                    }
                case .Failure(let error):
                    print(error)
                }
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        self.view.userInteractionEnabled = false
        addHolderView()
   
    }
    
    
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let  cell = collectionView.dequeueReusableCellWithReuseIdentifier("FoodCell", forIndexPath: indexPath) as! MainPageFoodCell
        
        
        cell.configureTheCell(productList[indexPath.row])
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
        return productList.count
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let product : Product = productList[indexPath.row]
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
