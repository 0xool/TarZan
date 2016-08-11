//
//  LoginPopOverVC.swift
//  SanatSharif
//
//  Created by cyrus refahi on 7/17/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit

class LoginPopOverVC: UIViewController {
    
    @IBOutlet weak var loginStack: UIStackView!
    @IBOutlet weak var MainBtnStack: UIStackView!
    @IBOutlet weak var BackGroundIMG: UIImageView!
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var signupBtn: UIButton!
    
    @IBOutlet weak var BackGroundView: UIView!
    @IBOutlet weak var MainOutletLabel: UILabel!
    @IBOutlet weak var visualEffects: UIVisualEffectView!
    
    @IBOutlet weak var UserNameField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var LoginMenuBTN: UIButton!
    
    @IBOutlet weak var LoginMenuBackBTN: UIButton!
    @IBOutlet weak var Seperator_One: UIView!
    @IBOutlet weak var Seperator_Two: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.toolbarHidden = true
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        self.visualEffects.effect = nil
        animattionInit()
        
        
        // Put it somewhere, give it a frame...
        UIView.animateWithDuration(0.5) {
            self.visualEffects.effect = UIBlurEffect(style: .Dark)
            
        }
        //        var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        //        var blurEffectView = UIVisualEffectView(effect: blurEffect)
        //        blurEffectView.frame = self.BackGroundView.bounds
        //        blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight] // for supporting device rotation
        //        self.BackGroundView.addSubview(blurEffectView)
        
        // self.BackGroundIMG.makeBlurImage(self.BackGroundIMG)
        
        
        
        self.MainBtnStack.hidden = false
        UIView.animateWithDuration(0.25, animations: {self.MainBtnStack.alpha = 1})
        self.animateBTn(self.signupBtn, withDelay: 0)
        self.animateBTn(self.loginBtn, withDelay: 1)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    func animateBTn(button : UIButton ,  withDelay : Int){
        
        UIView.animateWithDuration(1, delay: 0.05 * Double(withDelay), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
            
            button.transform = CGAffineTransformMakeTranslation(0, 0)
            
            
            }, completion: { (finished) -> Void in
                if finished {
                    
                    
                }
        })
        
    }
    
    
    func animateBTn(button : UIButton ,  withDelay : Int, toPositionX : CGFloat , toPositionY : CGFloat , completeFunction: () -> ()){
        
        UIView.animateWithDuration(1, delay: 0.05 * Double(withDelay), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
            
            button.transform = CGAffineTransformMakeTranslation(toPositionX, toPositionY)
            
            
            }, completion: { (finished) -> Void in
                if finished {
                    
                    completeFunction()
                    
                }
        })
        
    }
    
    func animateStackView(button : UIStackView ,  withDelay : Int, toPositionX : CGFloat , toPositionY : CGFloat , completeFunction: () -> ()){
        
        UIView.animateWithDuration(1, delay: 0.05 * Double(withDelay), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
            
            button.transform = CGAffineTransformMakeTranslation(toPositionX, toPositionY)
            
            
            }, completion: { (finished) -> Void in
                if finished {
                    
                    completeFunction()
                    
                }
        })
        
    }
    
    func animateInputTextFiedlMovement(field : UITextField , delay : Int , toPositionX : CGFloat , toPositionY : CGFloat , completeFunction : () -> ()) {
        
        UIView.animateWithDuration(1, delay: 0.05 * Double(delay), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
            
            field.transform = CGAffineTransformMakeTranslation(toPositionX, toPositionY)
            
            
            }, completion: { (finished) -> Void in
                if finished {
                    
                    completeFunction()
                    
                }
        })
        
        
    }
    
    func fadeMainLabel(time : NSTimeInterval , fade : Bool){
        if fade {
            UIView.animateWithDuration(time, animations: {
                
                self.MainOutletLabel.alpha = 0
                
            })
        }else{
            
            UIView.animateWithDuration(time, animations: {
                
                self.MainOutletLabel.alpha = 1
                
            })
            
        }
        
    }
    
    func animateUIView(view : UIView , delay : Int , toPositionX : CGFloat , toPositionY : CGFloat , completeFunction : () -> ()){
        
        UIView.animateWithDuration(1, delay: 0.05 * Double(delay), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
            
            view.transform = CGAffineTransformMakeTranslation(toPositionX, toPositionY)
            
            
            }, completion: { (finished) -> Void in
                if finished {
                    
                    completeFunction()
                    
                }
        })
        
        
    }
    
    func animattionInit(){
        
        self.loginBtn.transform = CGAffineTransformMakeTranslation(1000, 0)
        self.signupBtn.transform = CGAffineTransformMakeTranslation(1000, 0)
        self.UserNameField.transform = CGAffineTransformMakeTranslation(-1000, 0 )
        self.Seperator_One.transform = CGAffineTransformMakeTranslation(-1000, 0 )
        self.Seperator_Two.transform = CGAffineTransformMakeTranslation(-1000, 0 )
        self.PasswordTextField.transform = CGAffineTransformMakeTranslation(-1000, 0 )
        self.LoginMenuBackBTN.transform = CGAffineTransformMakeTranslation(-1000, 0 )
        self.LoginMenuBTN.transform = CGAffineTransformMakeTranslation(-1000, 0 )
        
        
    }
    
    @IBAction func backToMenuFromLogIn(sender: AnyObject) {
        
        self.animateInputTextFiedlMovement(self.UserNameField, delay: 0, toPositionX: -1000, toPositionY: 0, completeFunction: {})
        self.animateUIView(self.Seperator_One, delay: 1, toPositionX: -1000, toPositionY: 0, completeFunction: {})
        self.animateInputTextFiedlMovement(self.PasswordTextField, delay: 2, toPositionX: -1000, toPositionY: 0, completeFunction: {})
        self.animateUIView(self.Seperator_Two, delay: 3, toPositionX: -1000, toPositionY: 0, completeFunction: {})
        self.animateBTn(self.LoginMenuBTN, withDelay: 4 , toPositionX:  -1000 , toPositionY:  0 , completeFunction: {})
        self.animateBTn(self.LoginMenuBackBTN, withDelay: 5 , toPositionX:  -1000 , toPositionY:  0 , completeFunction: {
            
            
            
            self.MainBtnStack.hidden = false
            self.fadeMainLabel(1 , fade:  false)
            UIView.animateWithDuration(0.25, animations: {self.MainBtnStack.alpha = 1})
            self.animateBTn(self.signupBtn, withDelay: 0)
            self.animateBTn(self.loginBtn, withDelay: 1)

            self.loginStack.hidden = true
            
        })
        
    }
    
    @IBAction func showLoginMenu(sender: AnyObject) {
        
        self.fadeMainLabel(0.5 , fade:  true)
        self.animateBTn(self.signupBtn, withDelay: 0 , toPositionX: 1000 , toPositionY: 0 , completeFunction: {})
        self.animateBTn(self.loginBtn, withDelay: 1, toPositionX: 1000 , toPositionY: 0 , completeFunction: {
            
            self.MainBtnStack.hidden = true
            
            self.loginStack.hidden = false
            
            self.animateInputTextFiedlMovement(self.UserNameField, delay: 0, toPositionX: 0, toPositionY: 0, completeFunction: {})
            self.animateUIView(self.Seperator_One, delay: 1, toPositionX: 0, toPositionY: 0, completeFunction: {})
            self.animateInputTextFiedlMovement(self.PasswordTextField, delay: 2, toPositionX: 0, toPositionY: 0, completeFunction: {})
            self.animateUIView(self.Seperator_Two, delay: 3, toPositionX: 0, toPositionY: 0, completeFunction: {})
            self.animateBTn(self.LoginMenuBTN, withDelay: 4)
            self.animateBTn(self.LoginMenuBackBTN, withDelay: 5)
            
        })
    }
    
    func keyboardWillShow(notification: NSNotification) {
        
        
            if view.frame.origin.y == 0{                
                UIView.animateWithDuration(0.1, animations: { () -> Void in
                    self.view.frame.origin.y -= 100
                    self.navigationController?.navigationBar.alpha = 0
                    self.tabBarController?.tabBar.alpha = 0
                    
                })
            }
            else {
                
            }
        
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        
        if view.frame.origin.y != 0 {
            
            UIView.animateWithDuration(0.1, animations: { () -> Void in
                self.view.frame.origin.y += 100
                self.navigationController?.navigationBar.alpha = 1
                self.tabBarController?.tabBar.alpha = 1
                
                
            })
        }
        else {
            
        }
        
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        
    }
}
