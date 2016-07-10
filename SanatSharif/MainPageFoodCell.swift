//
//  MainPageFoodCell.swift
//  SanatSharif
//
//  Created by CyrusREfahi on 4/14/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

import UIKit

class MainPageFoodCell: UICollectionViewCell {

    
    @IBOutlet weak var PriceOutlet: UILabel!
    @IBOutlet weak var foodIMage : UIImageView!
    @IBOutlet weak var foodNameLabel : UILabel!
    @IBOutlet weak var BuyButtonOutlet: UIButton!
    
    var product : Product!
    var Amount : Int!
    
    @IBAction func BuyClicked(sender: AnyObject) {
        
        if Amount != 0 {
            let item : Item = Item(product: self.product, count: Amount, totalPrice: Amount * product.Price)
            UserModelManager.UserCredentials._Cart.addItemToCart(item);
        }else{
            
            //alert maybe :D
            
        }
        
    }
    
    
    @IBAction func MinusClicked(sender: AnyObject) {
        
        if Amount != 0 {
            Amount = Amount - 1
            let text : String = String(Amount)
            BuyButtonOutlet.setTitle(text , forState: UIControlState.Normal)
        }
        
        
    }
    
    @IBAction func PlusClicked(sender: AnyObject) {
        
        Amount = Amount + 1
        let text : String = String(Amount)
        BuyButtonOutlet.setTitle(text , forState: UIControlState.Normal)
        
    }
    
    
    
    func setImage(foodImageName : String){
        
       // foodIMage.image = UIImage(named: foodImageName)
        
    }
    
    func setFoodName(foodName : String){
        
        foodNameLabel.text = foodName
        
    }
    
    func setFoodPrice(foodPrice : String){
        
      //  foodPriceLabel.text = foodPrice
        
    }
    
    func configureCell(foodPrice : String , foodName : String , foodImageName : String){
        
        Amount = 0;
        setImage(foodImageName)
        setFoodName(foodName)
        setFoodPrice(foodPrice)
        
        
    }
    
   
    
    func configureCell(product : Product){
        
        self.product = product
        foodNameLabel.text = product.Name
        
    }
    
    override func awakeFromNib() {
        layer.cornerRadius = 4
        self.clipsToBounds = true

        
        layer.shadowColor = UIColor(red: 157.0 / 255.0, green: 157.0 / 255.0, blue: 225 / 255.0, alpha: 0.5).CGColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 9.0
        layer.shadowOffset = CGSizeMake(0.0, 2.0)
    }
    
    
    
    
    
}
