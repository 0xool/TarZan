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
    @IBOutlet weak var RateButton_1: UIButton!
    @IBOutlet weak var RateButton_2: UIButton!
    @IBOutlet weak var RateButton_3: UIButton!

    
    var product : Product!
    var Amount : Int = 0
    var rateBTN : Bool = false
    
    override func viewDidLoad() {
    
        NameLabel.text = product.Name
        PriceLabel.text = String(product.Price)
        ExpDateLabel.text = String(product.ExpDate)
        
        self.RateButton_1.imageView?.contentMode = .ScaleAspectFit
        self.RateButton_2.imageView?.contentMode = .ScaleAspectFit
        self.RateButton_3.imageView?.contentMode = .ScaleAspectFit


        
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
    
    @IBAction func RateBtnNumberOneClicked(sender : AnyObject){
        if(!rateBTN){
            resetButtonImages()
            self.RateButton_1.setImage( UIImage(named: "filledStar.png") , forState: UIControlState.Normal)
        }else{
            resetButtonImages()
        }
        
        rateBTN = !rateBTN

    }
    
    @IBAction func RateBtnNumberTwoClicked(sender : AnyObject){
        
        resetButtonImages()
        
        self.RateButton_1.setImage( UIImage(named: "filledStar.png") , forState: UIControlState.Normal)
        self.RateButton_2.setImage( UIImage(named: "filledStar.png") , forState: UIControlState.Normal)

        
    }
    
    @IBAction func RateBtnNumberThreeClicked(sender : AnyObject){
        
        resetButtonImages()
        
        self.RateButton_1.setImage( UIImage(named: "filledStar.png") , forState: UIControlState.Normal)
        self.RateButton_2.setImage( UIImage(named: "filledStar.png") , forState: UIControlState.Normal)
        self.RateButton_3.setImage( UIImage(named: "filledStar.png") , forState: UIControlState.Normal)
    }
    
   
    func resetButtonImages(){
        
        self.RateButton_1.setImage( UIImage(named: "emptyStar.png") , forState: UIControlState.Normal)
        self.RateButton_2.setImage( UIImage(named: "emptyStar.png") , forState: UIControlState.Normal)
        self.RateButton_3.setImage( UIImage(named: "emptyStar.png") , forState: UIControlState.Normal)

        
    }
    
    
}
