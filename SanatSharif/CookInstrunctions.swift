//
//  CookInstrunctions.swift
//  SanatSharif
//
//  Created by cyrus refahi on 7/31/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit

class CookInstrunctions: UITableViewCell , UICollectionViewDataSource , UICollectionViewDelegate {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var instructionsChecked : [Bool]! = [Bool]()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        for _ in 0...5{
            instructionsChecked.append(false)
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    
        
        return CGSizeMake(collectionView.bounds.width , collectionView.bounds.height)
    }
    
    
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cookingInfo", forIndexPath: indexPath) as! CookIngInfoCell
        
        cell.configureCell(indexPath.row, instrunction: self , checked: self.instructionsChecked[indexPath.row])
        
        return cell
    }
    
    func changeCollectionView(page : Int){
        
        if (page < 5 && page >= 0 ){
            self.collectionView?.scrollToItemAtIndexPath(NSIndexPath(forItem: page , inSection: 0), atScrollPosition: .Right , animated: true)
            if page > 0 {
                self.instructionsChecked[page - 1] = true
            }
        }

        

    }


    
}
