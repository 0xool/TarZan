//
//  BasketToBuyCell.swift
//  SanatSharif
//
//  Created by cyrus refahi on 7/23/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit

class BasketToBuyCell: UICollectionViewCell {

    
    
    @IBOutlet weak var BasketToBuyImageView: UIImageView!
    @IBOutlet weak var coreView : UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var personName: UILabel!
    
    var fullScreen : Bool = false
    
    func configureCell (image : UIImage , title : String , date : NSDate , personName : String){
        
        self.BasketToBuyImageView.image = image
        self.titleLabel.text = title
        //self.dateLabel.text = date.date
        self.personName.text = personName
        
    }
    
    override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes) {
        super.applyLayoutAttributes(layoutAttributes)
        
        
        
        let standardHeight = UltravisualLayoutConstants.Cell.standardHeight
        let featuredHeight = UltravisualLayoutConstants.Cell.featuredHeight
        
        
        let delta = 1 - ((featuredHeight - CGRectGetHeight(frame)) / (featuredHeight - standardHeight))
        
        
        let minAlpha: CGFloat = 0.3
        let maxAlpha: CGFloat = 0.75
        self.coreView.alpha = maxAlpha - (delta * (maxAlpha - minAlpha))
        
        let scale = max(delta, 0.5)
        titleLabel.transform = CGAffineTransformMakeScale(scale, scale)
        
        dateLabel.alpha = delta
        personName.alpha = delta
    }
    
    
}
