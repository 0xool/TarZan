//
//  BuyWindowMaterial.swift
//  SanatSharif
//
//  Created by cyrus refahi on 7/18/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit
import UIKit.UIPanGestureRecognizer


class BuyWindowMaterial: UIView  {
    
    
    
    override func awakeFromNib() {
        
        self.clipsToBounds = true
        layer.cornerRadius = 8
        layer.shadowColor = UIColor(red: 157.0 / 255.0, green: 157.0 / 255.0, blue: 157.0 / 255.0, alpha: 0.5).CGColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 15
        layer.shadowOffset = CGSizeMake(2.0, 2.0)
        
        
    }
    
   



}
