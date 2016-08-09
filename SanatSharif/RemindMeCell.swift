//
//  RemindMeCell.swift
//  SanatSharif
//
//  Created by cyrus refahi on 8/7/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit

class RemindMeCell: UICollectionViewCell {
    
    @IBOutlet weak var notifSwitch : UISwitch!
    
    var basketDetail : basketDetailVC!
    
    
    func configureCell(turnSwitchOn : Bool , _basketDetailVC  : basketDetailVC){
        
        self.basketDetail = _basketDetailVC
        
        if turnSwitchOn {
            
            notifSwitch.on = true
            
        }
        
    }
    
    
    @IBAction func switchValueChanged (sender : AnyObject){
        
        self.basketDetail.notifSwitchChangedValue()
        
    }
    
}
