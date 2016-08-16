//
//  BasketFooterView.swift
//  SanatSharif
//
//  Created by cyrus refahi on 8/14/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit

class BasketFooterView: UITableViewHeaderFooterView {

    
    
    private var cart : Cart = Cart()
    private var number : Int!
    private var basketViewController : BasketViewController!
    
    
    func configureCell (number : Int , basketViewController : BasketViewController) {
        
        self.number = number
        self.basketViewController = basketViewController
        
    }
    
    @IBAction func buyBtnClicked (sender : AnyObject){
    
        self.basketViewController.loadAuthenticationView()
        
    }
    
    
    
    
    
    
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
