//
//  IngredientItemCell.swift
//  SanatSharif
//
//  Created by cyrus refahi on 7/28/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit

class IngredientItemCell: UITableViewCell {

    @IBOutlet weak var backView : UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(gray : Bool){
        
        if !gray{
            self.backView.backgroundColor = UIColor.colorFromRGB(245 , g: 245 , b: 245 )
        }else{
            self.backView.backgroundColor = UIColor.colorFromRGB(225 , g: 225 , b: 225 )
        }
        
    }

}
