//
//  BasketBackGroundView.swift
//  SanatSharif
//
//  Created by cyrus refahi on 8/14/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit

class BasketFooterBackGroundView: UIView {
    
    var shadowLayer: CAShapeLayer!

    override func layoutSubviews() {
        super.layoutSubviews()
        
        shadowLayer = CAShapeLayer()
        shadowLayer.path = UIBezierPath(roundedRect: self.bounds,
                                        byRoundingCorners: [UIRectCorner.BottomLeft, UIRectCorner.BottomRight],
                                        cornerRadii: CGSize(width: 5, height: 5)).CGPath
        
        shadowLayer.fillColor = UIColor(red: 0 / 255.0 , green: 128.0 / 255.0 , blue: 0 / 255.0, alpha: 1).CGColor
        
        shadowLayer.shadowColor = UIColor.darkGrayColor().CGColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        shadowLayer.shadowOpacity = 0.8
        shadowLayer.shadowRadius = 2
        
        //layer.insertSublayer(shadowLayer, atIndex: 0)
        layer.insertSublayer(shadowLayer, below: nil) // also works
        
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
