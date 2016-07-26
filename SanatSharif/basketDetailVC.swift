//
//  basketDetailVC.swift
//  SanatSharif
//
//  Created by cyrus refahi on 7/24/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit
import CoreData

class basketDetailVC: UIViewController {

    
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var descTextField: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var notifLabel: UILabel!
    @IBOutlet weak var notifSwitch: UISwitch!
    @IBOutlet weak var titleLabel: UILabel!
   
    @IBOutlet weak var deleteBTN: UIButton!
    @IBOutlet weak var editBTN: UIButton!
    @IBOutlet weak var notifView : UIView!
   
    
    let moContext = UserModelManager.sharedInstance._dataControler.managedObjectContext
    var basket : Basket!
    
    
    override func viewDidLoad() {
        self.titleLabel.transform = CGAffineTransformMakeTranslation(1000, 0)
        self.dateLabel.transform = CGAffineTransformMakeTranslation(1000, 0)
        self.descTextField.transform = CGAffineTransformMakeTranslation(1000, 0)
        self.notifSwitch.transform = CGAffineTransformMakeTranslation(1000, 0)
        self.notifLabel.transform = CGAffineTransformMakeTranslation(1000, 0)
        self.deleteBTN.transform = CGAffineTransformMakeTranslation(1000, 0)
        self.editBTN.transform = CGAffineTransformMakeTranslation(1000, 0)
        self.notifView.transform = CGAffineTransformMakeTranslation(1000, 0)
        
        
        self.navigationController?.navigationBar.tintColor  = UIColor.whiteColor()
        self.tabBarController?.tabBar.hidden = true
        self.navigationController?.navigationItem.title = "بازگشت"
        
        self.titleLabel.text = basket.bName
        
        if basket.bImage != nil{
            self.backgroundImage.image = UIImage(data: basket.bImage!)
        }else{
            self.backgroundImage.image = UIImage(named: "GroceryTemp3")
        }
        
        self.dateLabel.text =  "تاریخ :" + basket.bDate!.datatypeValue
       
        
        if basket.bDiscription != nil {
            self.descTextField.text =  "توضیحات : " + basket.bDiscription!
            print(basket.bDiscription)
        }else {
            self.descTextField.text = "توضیحاتی در این مورد داده نشده است."
        }
        
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        animateView()
    }
    
    
    func animateView (){
        
        
       
        
        
        
        
        
        
        
        UIView.animateWithDuration(0.5, delay: 0.05 * Double(0) , usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
            
        
            self.titleLabel.transform = CGAffineTransformMakeTranslation(0, 0)
            
            
            }, completion: nil)
        UIView.animateWithDuration(0.5, delay: 0.05 * Double(2) , usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
            
            self.dateLabel.transform = CGAffineTransformMakeTranslation(0, 0)
            
            }, completion: nil)
        UIView.animateWithDuration(0.5, delay: 0.05 * Double(5) , usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
            
            self.descTextField.transform = CGAffineTransformMakeTranslation(0, 0)
            
            
            
            }, completion: nil)
        UIView.animateWithDuration(0.5, delay: 0.05 * Double(6) , usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
            
            self.notifSwitch.transform = CGAffineTransformMakeTranslation(0, 0)
            self.notifView.transform = CGAffineTransformMakeTranslation(0, 0)
            
            
            
            }, completion: nil)
        UIView.animateWithDuration(0.5, delay: 0.05 * Double(7) , usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
            
            self.notifLabel.transform = CGAffineTransformMakeTranslation(0, 0)
            
            
            
            }, completion: nil)
        UIView.animateWithDuration(0.5, delay: 0.05 * Double(8) , usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
            
            self.deleteBTN.transform = CGAffineTransformMakeTranslation(0, 0)
            
            
            
            }, completion: nil)
        UIView.animateWithDuration(0.5, delay: 0.05 * Double(9) , usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
            
            self.editBTN.transform = CGAffineTransformMakeTranslation(0, 0)
            
            
            
            }, completion: nil)
        
        
        
        
    }
    
    
    @IBAction func deleteBasket(sender: AnyObject) {
        
//        let person = result[0] as! NSManagedObject
        
        moContext.deleteObject(basket)
        UserModelManager.sharedInstance._basketInfoImages.removeAtIndex(UserModelManager.sharedInstance._basketInfo.indexOf(basket)!)
        UserModelManager.sharedInstance._basketInfo.removeAtIndex(UserModelManager.sharedInstance._basketInfo.indexOf(basket)!)
        
        do {
            try moContext.save()
        } catch {
            let saveError = error as NSError
            print(saveError)
        }

        self.navigationController?.popViewControllerAnimated(true)

    }
    
    @IBAction func notifSwitchChangedValue(sender: AnyObject) {
        
        
        
        
        
    }
    
    @IBAction func editInfo(sender: AnyObject) {
    }
}
