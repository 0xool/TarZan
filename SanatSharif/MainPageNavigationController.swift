//
//  MainPageNavigationController.swift
//  SanatSharif
//
//  Created by CyrusREfahi on 4/14/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

import UIKit

class MainPageNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        
//        self.navigationBar.barStyle = UIBarStyle.BlackTranslucent
        self.navigationBar.tintColor = UIColor(red: 48 / 255.0, green: 185 / 255.0, blue: 82 / 255.0, alpha: 1)
//        self.navigationBar.barTintColor = UIColor.whiteColor()
//        self.navigationBar.topItem?.title = "فروشگاه"
        
       // self.navigationBar.alpha = 0
        self.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.alpha = 1

        


        
        
    }

    
    

}
