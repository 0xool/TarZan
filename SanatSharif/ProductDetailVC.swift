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
    @IBOutlet weak var AmountLabel: UILabel!
    
    var product : Product!
    var Amount : Int = 0
    
    override func viewDidLoad() {
    
        NameLabel.text = product.Name
        PriceLabel.text = String(product.Price)
        ExpDateLabel.text = String(product.ExpDate)

        
    }
    
    func setProductDetailVC(product : Product){
        
        self.product = product
        
    }
    
    

    @IBAction func DropDownClicked(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: {});
        
        
    }
    
    @IBAction func MinusBtnClicked(sender: AnyObject) {
        
        if Amount != 0 {
            Amount = Amount - 1

            AmountLabel.text = "تعداد خرید :‌ \(String(Amount))"
        }
    }

    @IBAction func PlusBtnClicked(sender: AnyObject) {
        
        Amount = Amount + 1
        AmountLabel.text = "تعداد خرید :‌ \(String(Amount))"
        
    }
    
    @IBAction func BuyBtnClicked(sender: AnyObject) {

        if Amount != 0 {
            let item : Item = Item(product: self.product, count: Amount, totalPrice: Amount * product.Price)
            UserModelManager.UserCredentials._Cart.addItemToCart(item);
        }else{
            
            //alert maybe :D
            
        }
        
        
    }
    
    
    
}
