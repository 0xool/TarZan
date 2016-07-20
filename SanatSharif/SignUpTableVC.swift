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
    
    @IBOutlet weak var phoneNumberField : UITextField!
    @IBOutlet weak var nameField : UITextField!
    @IBOutlet weak var familyNameField : UITextField!
    
    @IBOutlet weak var emailFiel : UITextField!
    @IBOutlet weak var addressField : UITextField!
    @IBOutlet weak var workTypeField : UITextField!
    

    let effect = UIBlurEffect(style: .Dark)
    let resizingMask =  UIViewAutoresizing.FlexibleHeight
    
    @IBAction func singUp (sender : AnyObject){

        if phoneNumberField.text == "" || self.phoneNumberField.text == nil{
            
            
            let alertController = UIAlertController(title: "شماره تماس وارد نشده است", message:
                "شماره تماس خود را وارد کنید", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "خارج کردن", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
        
        if phoneNumberValid(self.phoneNumberField.text!){
            
            let alertController = UIAlertController(title: "شماره تماس درست نمی باشد", message:
                "لطفاً شماره تماس درست وارد کنید", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "خارج کردن", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
        
        if self.nameField.text == "" || self.nameField.text == nil {
            
            let alertController = UIAlertController(title: "نام وارد نشده است", message:
                "نام خود را وارد کنید", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "خارج کردن", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
        
        if self.familyNameField.text == "" || self.familyNameField.text == nil{
            
            let alertController = UIAlertController(title: "نام خانوادگی وارد نشده است", message:
                "نام خانوادگی خود را وارد کنید", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "خارج کردن", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
        
        if self.emailFiel.text == "" || self.emailFiel.text == nil{
            
            let alertController = UIAlertController(title: "ایمیل وارد نشده است", message:
                "ایمیل خود را وارد کنید", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "خارج کردن", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
        
        if self.addressField.text == "" || self.addressField.text == nil{
            
            let alertController = UIAlertController(title: "آدرس وارد نشده است", message:
                "آدرس خود را وارد کنید", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "خارج کردن", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
        
        if self.workTypeField.text == "" || self.workTypeField.text == nil{
            
            let alertController = UIAlertController(title: "برچسب کاری وارد نشده است", message:
                "برچسب کاری خود را وارد کنید", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "خارج کردن", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
        
        
    }
    
    func phoneNumberValid ( phoneNumber :  String) -> Bool{
        
            let number = Int(phoneNumber)
            
            if number == nil{
                
                return false
                
            }
                
            return true
    }
    
  
    
    
    override func viewDidLoad() {
     
        let imageView = SABlurImageView(image: UIImage(named: "featured-grocery"))
        imageView.addBlurEffect(5, times:1)

        
        self.tableView.backgroundView = imageView
        self.tableView.backgroundView?.contentMode = .ScaleAspectFill
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector (DissmissView))
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    func DissmissView(){
        
        let tmpController :UIViewController! = self.presentingViewController;
        self.dismissViewControllerAnimated(true, completion: {()->Void in
        print("done");
        tmpController.dismissViewControllerAnimated(true, completion: nil);
        });
    }
    
    @IBAction func backWithNoSignUP(sender : AnyObject){
        
        DissmissView()
        
    }
    
}
