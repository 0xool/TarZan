//
//  RelatedCollectionCell.swift
//  SanatSharif
//
//  Created by cyrus refahi on 8/1/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit

class RelatedCollectionCell: UICollectionViewCell {
    
    
    @IBOutlet weak var cellImage  : UIImageView!
    @IBOutlet weak var cellLabel : UILabel!
    
    func configureCell(){
    
        self.cellImage.alpha = 0.75
        
    
    }
    

}
