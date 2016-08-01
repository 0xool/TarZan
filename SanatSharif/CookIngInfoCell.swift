//
//  CookIngInfoCell.swift
//  SanatSharif
//
//  Created by cyrus refahi on 7/31/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit

class CookIngInfoCell: UICollectionViewCell {
    
    
    var pageNumber : Int!
    var cookingInstructionCollectionConnection : CookInstrunctions!
    var checked : Bool = false
    
    @IBOutlet weak var pageNumberLabel : UILabel!
    @IBOutlet weak var instrunctionLabel : UILabel!
    @IBOutlet weak var chekBoxImage: UIImageView!
    
    override func awakeFromNib() {
        
        
    }
    
    
    
    @IBAction func nxtBtnClicked(sender : AnyObject){
        
//        UIView.animateWithDuration(0.25, animations: {
//            
//            self.chekBoxImage.rotate360Degrees()
//            
//            }) { (finished) in
//                if finished {
//                    
//                    self.chekBoxImage.image = UIImage(named: "CheckBox_Checked")
//                    self.cookingInstructionCollectionConnection.changeCollectionView(self.pageNumber + 1 )
//
//                }
//        }
        
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            self.cookingInstructionCollectionConnection.changeCollectionView(self.pageNumber + 1 )
            self.checked = true
        }
        
        self.chekBoxImage.transform = CGAffineTransformMakeScale(0.1, 0.1)
        self.chekBoxImage.image = UIImage(named: "CheckBox_Checked")
        UIView.animateWithDuration(0.25, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: .TransitionCurlUp, animations: {
            
                self.chekBoxImage.transform = CGAffineTransformMakeScale(1, 1)

            
            }) { (finished) in
                if finished{
                    
                }
        }
        
        CATransaction.commit()
        
        
        
        
        
    }
    
    func btnAnimationDone(){
        
    }
    
    @IBAction func backBtnClicked(sender : AnyObject){
        
        self.cookingInstructionCollectionConnection.changeCollectionView(self.pageNumber - 1 )

        
    }
    
    func configureCell (pageNumber : Int , instrunction : CookInstrunctions , checked : Bool){
        
        self.pageNumber = pageNumber
        self.cookingInstructionCollectionConnection = instrunction
        if checked {
            self.chekBoxImage.image = UIImage(named: "CheckBox_Checked")
        }else{
            self.chekBoxImage.image = UIImage(named: "CheckBox_Empty")
        }

        self.pageNumberLabel.text = String(pageNumber)
        
    }
    
    
    
    
    
    
}
