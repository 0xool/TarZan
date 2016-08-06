//
//  RoundViewWithShadowMaterial.swift
//  SanatSharif
//
//  Created by cyrus refahi on 8/6/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import Foundation

class RoundViewWithShadowMaterial: UIView {
    
    var shadowLayer: CAShapeLayer!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: 12).CGPath
            shadowLayer.fillColor = UIColor.whiteColor().CGColor
            
            shadowLayer.shadowColor = UIColor.darkGrayColor().CGColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 2.0, height: 2.0)
            shadowLayer.shadowOpacity = 0.8
            shadowLayer.shadowRadius = 2
            
            layer.insertSublayer(shadowLayer, atIndex: 0)
            //layer.insertSublayer(shadowLayer, below: nil) // also works
        }        
    }
    
    func animateView (){
        
        self.transform = CGAffineTransformMakeScale(0, 0)
        self.hidden = false

        UIView.animateWithDuration(0.25, animations: {
            
            self.transform = CGAffineTransformMakeScale(1, 1)
            
        })
        
        
    }
    
}