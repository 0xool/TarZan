//
//  SaleTagLabel.swift
//  SanatSharif
//
//  Created by CyrusREfahi on 4/19/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

import UIKit

class SaleTagLabel: UIView {

    override func awakeFromNib() {

        
        
//        self.clipsToBounds = true
//        layer.shadowColor = UIColor(red: 157.0 / 255.0, green: 157.0 / 255.0, blue: 157.0 / 255.0, alpha: 0.5).CGColor
//        layer.shadowOpacity = 0.8
//        layer.shadowRadius = 5.0
//        layer.shadowOffset = CGSizeMake(0.0, 2.0)
    }
    
    
    override func drawRect(rect: CGRect) {
        
        roundCorners([.BottomRight , .BottomLeft], radius: 3)
        
    }
    
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.CGPath
        self.layer.mask = mask
    }
    
}
