//
//  RecentSearchCell.swift
//  SanatSharif
//
//  Created by CyrusREfahi on 4/22/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

import UIKit

class RecentSearchCell: UITableViewCell {
    
    @IBOutlet weak var TextSearched : UILabel!
    
    func configureCell(text : String){
    
        TextSearched.text = text
        
    }
    
    

}
