//
//  MainPageFoodCell.swift
//  SanatSharif
//
//  Created by CyrusREfahi on 4/14/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

import UIKit

protocol BuyAnimationDelegate {
    func BuyBtnAnimation(image : UIImage , cellPosition : CGRect)
}

class MainPageFoodCell: UICollectionViewCell {

    
    @IBOutlet weak var PriceOutlet: UILabel!
    @IBOutlet weak var foodIMage : UIImageView!
    @IBOutlet weak var foodNameLabel : UILabel!
    
    @IBOutlet weak var BuyButtonViewOutlet: UIView!
    @IBOutlet weak var BuyButtonLabel : UILabel!
    @IBOutlet weak var firstButBtn : UIButton!
    
    var animationDelegate : BuyAnimationDelegate!
    
    var product : Product!
    var type : String!
    
    var Amount : Int!
    var animate : Bool!
    var cellPos : CGRect!
    
    
    @IBAction func BuyClicked(sender: AnyObject) {
        
            self.BuyButtonLabel.text = "0"
        
            self.animationDelegate.BuyBtnAnimation(self.foodIMage.image! , cellPosition: self.cellPos)
            self.layer.borderWidth = 2.0
            self.layer.borderColor = UIColor(red: 0, green: 128 / 255, blue: 0, alpha: 1).CGColor
            self.BuyButtonViewOutlet.backgroundColor = UIColor(red: 0, green: 128 / 255, blue: 0, alpha: 1)
            self.firstButBtn.hidden = true
        
    }
    
    
    
    
    @IBAction func MinusClicked(sender: AnyObject) {
        
        
        
        
        if Amount != 0 {
        self.transform = CGAffineTransformMakeScale(0.99, 0.99)
         
            self.Amount = self.Amount - 1
            let text : String = String(self.Amount)
            self.BuyButtonLabel.text =  text
            
            
            UIView.animateWithDuration(0.15, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1.5,
                                       options: UIViewAnimationOptions.AllowAnimatedContent, animations: {
                                        
                                      self.transform = CGAffineTransformMakeScale(1.01, 1.01)
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
        
        if self.Amount == 0 {
            
            self.layer.borderWidth = 0
            self.BuyButtonViewOutlet.backgroundColor = UIColor(red: 204 / 255 , green: 204/255 , blue: 204/255, alpha: 1)
            self.firstButBtn.hidden = false
            
        }
        
    }
    
    @IBAction func PlusClicked(sender: AnyObject) {
        
        self.transform = CGAffineTransformMakeScale(0.95, 0.95)
        self.Amount = self.Amount + 1
        let text : String = String(self.Amount)
        self.BuyButtonLabel.text =  text
        
        UIView.animateWithDuration(0.15, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.5,
                                   options: UIViewAnimationOptions.CurveEaseIn, animations: {
                                    
                                    self.transform = CGAffineTransformMakeScale(1.05, 1.05)
            },
                                   completion: { _ in
                                    
                                    UIView.animateWithDuration(0.2, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.5,
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

        
        
        
    }
    
    
    
    
    
}
