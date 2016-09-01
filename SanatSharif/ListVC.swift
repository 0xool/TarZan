//
//  ListVC.swift
//  SanatSharif
//
//  Created by cyrus refahi on 8/31/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON



class ListVC: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource  {

    @IBOutlet weak var collectionView : UICollectionView!
    
    var categoryList : [ProductCategory] = [ProductCategory]()
    
    override func viewDidLoad() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.title = "دسته بندی"
        
        Alamofire.request(.GET, "https://tarzan.ir/wc-api/v3/products/categories", parameters: ["consumer_key": "ck_159770fbacaffae3aee064d2c96d79dee61c457c" , "consumer_secret" : "cs_bf53a78ddcb1ebaa1e24716af75ee773916ef040"])
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                switch response.result {
                case .Success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        print("JSON: \(json)")
                        for (_,subJson):(String, JSON) in json["product_categories"] {
                            
                            let categoryTemp : ProductCategory = ProductCategory()
                            
                            categoryTemp.count = subJson["count"].intValue
                            categoryTemp.name = subJson["name"].stringValue
                            categoryTemp.dispaly = subJson["display"].stringValue
                            
                            categoryTemp.desc = subJson["description"].stringValue
                            categoryTemp.parent = subJson["parent"].intValue
                            categoryTemp.imageSRC = subJson["image"].stringValue
                            
                            categoryTemp.slug = subJson["slug"].stringValue
                            
                            self.categoryList.append(categoryTemp)
                            
                            
                        }
                        
                        self.collectionView.reloadData()
                        
                    }
                case .Failure(let error):
                    print(error)
                }
        }
        //self.navigationController!.navigationBar.barTintColor = UIColor.whiteColor()
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        
        self.performSegueWithIdentifier("ListProductVC", sender: nil)
        
        
    }
    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
         let cell = self.collectionView.dequeueReusableCellWithReuseIdentifier("listCell", forIndexPath: indexPath) as! ListCell
        
        let category : ProductCategory = categoryList[indexPath.row]
            cell.configureCell(category.name , imageSRC: category.imageSRC)
        
            return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            
    
        return CGSizeMake((UIScreen.mainScreen().bounds.width / 2) - 1  , 150)
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let backItem = UIBarButtonItem()
        backItem.title = "دسته بندی"
        navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}
