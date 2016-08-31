//
//  ListVC.swift
//  SanatSharif
//
//  Created by cyrus refahi on 8/31/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit

class ListVC: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource  {

    @IBOutlet weak var collectionView : UICollectionView!
    
    
    override func viewDidLoad() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.title = "دسته بندی"
        //self.navigationController!.navigationBar.barTintColor = UIColor.whiteColor()
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        
        self.performSegueWithIdentifier("ListProductVC", sender: nil)
        
        
    }
    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
         let cell = self.collectionView.dequeueReusableCellWithReuseIdentifier("listCell", forIndexPath: indexPath) as! ListCell
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
