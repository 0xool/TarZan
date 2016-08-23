//
//  SearchVC.swift
//  SanatSharif
//
//  Created by cyrus refahi on 8/20/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit

class SearchResultVC: UIViewController  , UICollectionViewDelegate , UICollectionViewDataSource {
    
    var textSearched : String!
    @IBOutlet weak var collectionView : UICollectionView!
    
    override func viewDidLoad() {
        
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics: UIBarMetrics.Default)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    
        return CGSize(width: UIScreen.mainScreen().bounds.width, height: 170)
    
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = self.collectionView.dequeueReusableCellWithReuseIdentifier("searchCell", forIndexPath: indexPath) as! searchCell
        
        return cell
        
        
    }

}
