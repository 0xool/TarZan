//
//  MainPageFoodCell.swift
//  SanatSharif
//
//  Created by CyrusREfahi on 4/14/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

import UIKit

class MainPageFoodCell: UICollectionViewCell {

    
    @IBOutlet weak var foodIMage : UIImageView!
    @IBOutlet weak var foodNameLabel : UILabel!
    
     var product : Product!
    
    
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
        
        setImage(foodImageName)
        setFoodName(foodName)
        setFoodPrice(foodPrice)
        
        
    }
    
    func configureCell(product : Product){
        
        self.product = product
        
        foodNameLabel.text = product.Name
        
    }
    
    override func awakeFromNib() {
        layer.cornerRadius = 2
        self.clipsToBounds = true

        
        layer.shadowColor = UIColor(red: 157.0 / 255.0, green: 157.0 / 255.0, blue: 225 / 255.0, alpha: 0.5).CGColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 9.0
        layer.shadowOffset = CGSizeMake(0.0, 2.0)
    }
    
    
    
    
    
}
