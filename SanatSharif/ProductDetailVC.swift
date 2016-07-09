//
//  ProductDetailVC.swift
//  SanatSharif
//
//  Created by CyrusREfahi on 4/14/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

import UIKit

class ProductDetailVC: UIViewController {

    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var PriceLabel: UILabel!
    @IBOutlet weak var ExpDateLabel: UILabel!
    @IBOutlet weak var DementionTypeLabel: UILabel!
    @IBOutlet weak var DementionAmountLabel: UILabel!
    @IBOutlet weak var TypeLabel: UILabel!
    @IBOutlet weak var Description: UITextView!
    
    var product : Product!
    
    override func viewDidLoad() {
    
        NameLabel.text = product.Name
        PriceLabel.text = String(product.Price)
        ExpDateLabel.text = String(product.ExpDate)
        Description.text = "Later maybe :D"
        
    }
    
    

    @IBAction func DropDownClicked(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: {});
        
        
    }
    
    
    @IBAction func BuyBtnClicked(sender: AnyObject) {

        
        
    }
    
    
    
}
