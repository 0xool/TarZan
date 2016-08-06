//
//  BasketDetailHeaderCell.swift
//  SanatSharif
//
//  Created by cyrus refahi on 8/4/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit
import SABlurImageView

class BasketDetailHeaderCell: UICollectionViewCell {
    
    @IBOutlet weak var backgroundImage : UIImageView!
    @IBOutlet weak var title : UILabel!
    @IBOutlet weak var effects : UIVisualEffectView!
    @IBOutlet weak var updateBtn : UIButton!
    @IBOutlet weak var deleteBtn : UIButton!
    
    let screenWidthSize = UIScreen.mainScreen().bounds.width
    let screenHeightSize = UIScreen.mainScreen().bounds.height
    
    override func awakeFromNib() {
        self.title.alpha = 0
        self.title.transform = CGAffineTransformMakeScale(0, 0)
        self.updateBtn.transform = CGAffineTransformMakeTranslation(-100 , 0)
        self.deleteBtn.transform = CGAffineTransformMakeTranslation(screenWidthSize + 100, 0)
        
    }
    
    func configureCell ( title : String , image : UIImage  ){
    
        self.effects.effect = nil
        
        self.backgroundImage.image = image
        self.title.text = title
        

        // Put it somewhere, give it a frame...
        UIView.animateWithDuration(0.5) {
            self.effects.effect = UIBlurEffect(style: .Dark)
            self.title.alpha = 1
            self.title.transform = CGAffineTransformMakeScale(1, 1)
            self.updateBtn.transform = CGAffineTransformMakeTranslation(0, 0)
            self.deleteBtn.transform = CGAffineTransformMakeTranslation(0, 0)
            
        }
        
    }
    
    @IBAction func updateBtnClicked (sender : AnyObject){
        
    }
    
    @IBAction func deleteBtnClicked(sender : AnyObject){
        
    }
        
        
        
    
    
    
    
    
    

}
