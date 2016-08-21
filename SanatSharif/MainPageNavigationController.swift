//
//  MainPageNavigationController.swift
//  SanatSharif
//
//  Created by CyrusREfahi on 4/14/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

import UIKit
import RZTransitions

class MainPageNavigationController: RZTransitionsNavigationController {
    
    override func viewDidLoad() {
        
        self.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.translucent = true
        
    }

    
    

}
