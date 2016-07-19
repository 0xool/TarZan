//
//  SignUpTableVC.swift
//  SanatSharif
//
//  Created by cyrus refahi on 7/19/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit
import SABlurImageView



class SignUpTableVC: UITableViewController {
    
    let effect = UIBlurEffect(style: .Dark)
    let resizingMask =  UIViewAutoresizing.FlexibleHeight
    
    override func viewDidLoad() {
     
        let imageView = SABlurImageView(image: UIImage(named: "GroceryTemp3"))
        imageView.addBlurEffect(10, times:1)

        
        self.tableView.backgroundView = imageView
    }
    
}
