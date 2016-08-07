//
//  DateHeaderCell.swift
//  SanatSharif
//
//  Created by cyrus refahi on 8/7/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit
import JTAppleCalendar

class DateHeaderCell: JTAppleHeaderView {

    
    @IBOutlet var monthLabel : UILabel!
    
    func configureCell(month : String){
        
        self.monthLabel.text = month
        
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

    
    
}
