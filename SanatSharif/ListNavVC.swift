//
//  ListNavVC.swift
//  SanatSharif
//
//  Created by cyrus refahi on 8/31/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit
import ZoomTransitioning

class ListNavVC: UINavigationController {

    private let zoomNavigationControllerDelegate = ZoomNavigationControllerDelegate()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        delegate = zoomNavigationControllerDelegate
    }
    
    override func viewDidLoad() {
        
       self.navigationBar.tintColor = UIColor.whiteColor()
                
    }
    
    
    
    
    
    
}
