//
//  RelatedSection.swift
//  SanatSharif
//
//  Created by cyrus refahi on 8/1/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit

class RelatedSection: UITableViewCell , UICollectionViewDelegate , UICollectionViewDataSource  {

    @IBOutlet weak var collectionView : UICollectionView!
    
    
    override func awakeFromNib() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(collectionView.bounds.height , collectionView.bounds.width / 2 )
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCellWithReuseIdentifier("RelatedCollectionCell", forIndexPath: indexPath) as! RelatedCollectionCell
        
        cell.configureCell()
        
        return cell
    }
    
    
    
    
}
