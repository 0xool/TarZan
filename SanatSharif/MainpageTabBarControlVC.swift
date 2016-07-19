//
//  MainpageTabBarControlVC.swift
//  SanatSharif
//
//  Created by CyrusREfahi on 4/20/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

import UIKit

class MainpageTabBarControlVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func awakeFromNib() {
        
        UITabBar.appearance().tintColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0)
        
        let MainPageTabBar = self.tabBar.items![0]
        let BasketPageTabBar = self.tabBar.items![1]
        
        MainPageTabBar.title = "محصولات"
        MainPageTabBar.titlePositionAdjustment = UIOffsetMake(0 , -5);
        BasketPageTabBar.title = "سبدخرید"
        BasketPageTabBar.titlePositionAdjustment = UIOffsetMake(0 , -5);
        
        MainPageTabBar.selectedImage = UIImage(named: "barcodePic")
        BasketPageTabBar.selectedImage = UIImage(named: "basketPic")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)

        
        
    }
    
  
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
