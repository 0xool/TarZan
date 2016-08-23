//
//  CardImageView.swift
//  SanatSharif
//
//  Created by cyrus refahi on 8/22/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit

class CardImageView: UIImageView {

    override func awakeFromNib() {
        
        layer.cornerRadius = 5
        
        layer.shadowColor = UIColor.blackColor().CGColor
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowOpacity = 0.4
        layer.shadowRadius = 2
    }
    
    
}
