//
//  GraphView.swift
//  SanatSharif
//
//  Created by cyrus refahi on 7/26/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit

@IBDesignable class GraphView: UIView {
    
    //1 - the properties for the gradient
    @IBInspectable var startColor: UIColor = UIColor.clearColor()
    @IBInspectable var endColor: UIColor = UIColor.clearColor()
    
    override func drawRect(rect: CGRect) {
        
        //2 - get the current context
        let context = UIGraphicsGetCurrentContext()
        let colors = [startColor.CGColor, endColor.CGColor]
        
        //3 - set up the color space
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        //4 - set up the color stops
        let colorLocations:[CGFloat] = [0.0, 1.0]
        
        //5 - create the gradient
        let gradient = CGGradientCreateWithColors(colorSpace,
                                                  colors,
                                                  colorLocations)
        
        //6 - draw the gradient
        let startPoint = CGPoint.zero
        let endPoint = CGPoint(x:0, y:self.bounds.height)
        CGContextDrawLinearGradient(context,gradient,startPoint,endPoint,CGGradientDrawingOptions.DrawsBeforeStartLocation)
        
    }
}

