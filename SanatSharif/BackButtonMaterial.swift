//
//  BackButtonHandler.swift
//  SanatSharif
//
//  Created by CyrusREfahi on 4/13/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

import UIKit

class BackButtonMaterial : UIButton {
    
    override func awakeFromNib() {
        layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
        self.imageView?.clipsToBounds = true

        layer.shadowColor = UIColor(red: 157.0 / 255.0, green: 157.0 / 255.0, blue: 157.0 / 255.0, alpha: 0.5).CGColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSizeMake(0.0, 2.0)
    }
    
    
}
