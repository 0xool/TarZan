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
    
    func configureCell(bannerText : String){
        
        bannerLabel?.text = bannerText
        
    }
    

}
