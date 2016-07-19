//
//  MediumWindowViewMaterial.swift
//  SanatSharif
//
//  Created by CyrusREfahi on 4/15/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

import UIKit

class MediumWindowViewMaterial: UIView {

    
    override func awakeFromNib() {
        
        self.clipsToBounds = true
        layer.cornerRadius = 8
        layer.shadowColor = UIColor(red: 157.0 / 255.0, green: 157.0 / 255.0, blue: 157.0 / 255.0, alpha: 0.5).CGColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 8.0
        layer.shadowOffset = CGSizeMake(0.0, 2.0)
    }
    
    
}
