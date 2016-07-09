//
//  BasketCell.swift
//  SanatSharif
//
//  Created by CyrusREfahi on 4/15/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

import UIKit

class BasketCell: UITableViewCell {

    
    @IBOutlet weak var ProductPrice: UILabel!
    @IBOutlet weak var ProductDesc: UILabel!
    @IBOutlet weak var ProductName: UILabel!
    @IBOutlet weak var Stepper: UIStepper!
    @IBOutlet weak var ProductAmount: RoundLabel!
    @IBOutlet weak var ProductImage: UIImageView!
    
    
    func configureCell(price : Int , Desc : String , name : String , Amount : Int , ImageSrc : String){
        
        Stepper.autorepeat = true
        Stepper.maximumValue = 250;
        
        
        ProductAmount.text = String(Amount)
        ProductDesc.text = Desc
        ProductName.text = name
        ProductPrice.text = String(price)
        
        
        
    }
    
    func configureCell(product : Product){
        
        
    }
    
    
    @IBAction func StepperValueChanged(sender: UIStepper) {
       
        print("CLicked")
        ProductAmount.text = Int(sender.value).description
        
    }
    
}
