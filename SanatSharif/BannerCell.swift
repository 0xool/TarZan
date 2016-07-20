//
//  BannerCell.swift
//  SanatSharif
//
//  Created by CyrusREfahi on 4/20/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

import UIKit

class BannerCell: UICollectionViewCell {
    
    @IBOutlet weak var bannerLabel : UILabel?
    
    var type : String!
    
    var animate : Bool!
    
    func configureCell(bannerText : String){
        
        //bannerLabel?.text = bannerText
        
    }
    
    override func awakeFromNib() {
        layer.cornerRadius = 6
        self.clipsToBounds = true
        
        
        layer.shadowColor = UIColor(red: 157.0 / 255.0, green: 157.0 / 255.0, blue: 225 / 255.0, alpha: 0.5).CGColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 9.0
        layer.shadowOffset = CGSizeMake(0.0, 2.0)
    }
    
    

}
