//
//  BasketViewTopCellMaterial.swift
//  SanatSharif
//
//  Created by cyrus refahi on 7/16/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit

class infoCellMaterial: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBOutlet weak var cartTitle : UILabel!
    
    override func awakeFromNib() {
        
        roundCorners([.TopLeft , .TopRight], radius: 2)
//        layer.shadowColor = UIColor(red: 157.0 / 255.0, green: 157.0 / 255.0, blue: 157.0 / 255.0, alpha: 0.5).CGColor
//        layer.shadowOpacity = 1
//        layer.shadowRadius = 8.0
//        layer.shadowOffset = CGSizeMake(0.0, 2.0)
    }
    
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.CGPath
        self.layer.mask = mask
    }

    

}
