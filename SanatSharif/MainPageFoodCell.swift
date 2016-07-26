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
    var type : String!
    var Amount : Int!
    var animate : Bool!
    
    @IBAction func BuyClicked(sender: AnyObject) {
        
        if Amount != 0 {
            let item : Item = Item(product: self.product, count: Amount, totalPrice: Amount * product.Price)
            UserModelManager.sharedInstance._Cart.addItemToCart(item);
        }else{
            
            //alert maybe :D
            
        }
        
    }
    
    
    @IBAction func MinusClicked(sender: AnyObject) {
        
        
        
        
        if Amount != 0 {
        self.transform = CGAffineTransformMakeScale(0.9, 0.9)
         
            self.Amount = self.Amount - 1
            let text : String = String(self.Amount)
            self.BuyButtonOutlet.setTitle(text , forState: UIControlState.Normal)
            
            
            UIView.animateWithDuration(0.15, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1.5,
                                       options: UIViewAnimationOptions.AllowAnimatedContent, animations: {
                                        
                                      self.transform = CGAffineTransformMakeScale(1.1, 1.1)
                },
                                       completion: { _ in
                                    
                                        
                                        
                                        UIView.animateWithDuration(0.15, delay: 0.0, usingSpringWithDamping: 0.15, initialSpringVelocity: 1.5,
                                            options: UIViewAnimationOptions.AllowAnimatedContent, animations: {
                                                
                                                self.transform = CGAffineTransformMakeScale(1, 1)
                                                
                                            },
                                            completion: { _ in
                                                
                                                
                                                
                                        })
            })

            
        }
        
        
    }
    
    @IBAction func PlusClicked(sender: AnyObject) {
        
        self.transform = CGAffineTransformMakeScale(0.85, 0.85)
        self.Amount = self.Amount + 1
        let text : String = String(self.Amount)
        self.BuyButtonOutlet.setTitle(text , forState: UIControlState.Normal)
        
        UIView.animateWithDuration(0.15, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.5,
                                   options: UIViewAnimationOptions.CurveEaseIn, animations: {
                                    
                                    self.transform = CGAffineTransformMakeScale(1.05, 1.05)
            },
                                   completion: { _ in
                                    
                                    UIView.animateWithDuration(0.15, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.5,
                                        options: UIViewAnimationOptions.AllowAnimatedContent, animations: {
                                            
                                            self.transform = CGAffineTransformMakeScale(1, 1)
                                            
                                        },
                                        completion: { _ in
                                            
                                    })
        })
        
        
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
        layer.cornerRadius = 6
        self.clipsToBounds = true

        
        layer.shadowColor = UIColor(red: 157.0 / 255.0, green: 157.0 / 255.0, blue: 225 / 255.0, alpha: 0.5).CGColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 9.0
        layer.shadowOffset = CGSizeMake(0.0, 2.0)
    }
    
    
    
    
    
}
