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
    
    
    func configureCell(turnSwitchOn : Bool){
        
        if turnSwitchOn {
            
            notifSwitch.on = true
            
        }
        
    }
    
    
}
