//
//  ReviewTableViewCell.swift
//  SanatSharif
//
//  Created by cyrus refahi on 7/31/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backView : UIView!
    
    
    func configureCell(gray : Bool){
        
        if gray {
            backView.backgroundColor = UIColor.colorFromRGB(225 , g: 225 , b: 225 )
        }else{
            backView.backgroundColor = UIColor.colorFromRGB(245 , g: 245 , b: 245 )
        }
        
    }
    

}
