//
//  BasketHeaderView.swift
//  SanatSharif
//
//  Created by cyrus refahi on 8/14/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit

class BasketHeaderView: UITableViewHeaderFooterView {

    var section : Int!
    private var tableViewClass : BasketViewController!
    
    override func awakeFromNib() {
    
    
    }
    
    func configureHeader (section : Int , tableViewClass : BasketViewController){
        
        self.section = section
        self.tableViewClass = tableViewClass
        
    }
    
    @IBAction func expandBtnClicked (sender : AnyObject){
        
        self.tableViewClass.openSection(self.section)
        
    }
    
    
    

}


