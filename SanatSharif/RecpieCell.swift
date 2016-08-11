//
//  RecpieCell.swift
//  SanatSharif
//
//  Created by cyrus refahi on 7/25/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit
import expanding_collection
import SABlurImageView
import DOFavoriteButton

class RecpieCell: BasePageCollectionCell {
    
    @IBOutlet weak var title : UILabel!
    @IBOutlet weak var imageView : UIImageView!



    func openBackView()  {
        
        

        
        
    }
    
    func animateImages(delay : Int , image : RoundImageMaterial){
        
        UIView.animateWithDuration(0.5, delay: 0.25 * Double(delay), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.AllowAnimatedContent, animations: {
            
                image.transform = CGAffineTransformMakeTranslation(0, 0)
            
            }) { (finished) in
                
                    
                
        }
        
    }
    
    
    func configureCell(image : UIImage , title : String){
        

        
        self.imageView.image = image
        self.title.text = title
  
    }
    
  
    
    
}
