//
//  LoginControlVC.swift
//  SanatSharif
//
//  Created by cyrus refahi on 7/17/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit

import RZTransitions

class LoginControlVC: UIViewController , UITextFieldDelegate , RZTransitionInteractionControllerDelegate {

    @IBOutlet weak var loginStack: UIStackView!
    @IBOutlet weak var MainBtnStack: UIStackView!
    @IBOutlet weak var BackGroundIMG: UIImageView!
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var guestBtn: UIButton!
    
    @IBOutlet weak var BackGroundView: UIView!
    @IBOutlet weak var MainOutletLabel: UILabel!
    @IBOutlet weak var visualEffects: UIVisualEffectView!
    
    @IBOutlet weak var UserNameField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var LoginMenuBTN: UIButton!
    
    @IBOutlet weak var LoginMenuBackBTN: UIButton!
    @IBOutlet weak var Seperator_One: UIView!
    @IBOutlet weak var Seperator_Two: UIView!
    
    @IBOutlet weak var ThirdOptionWindow: BuyWindowMaterial!
    @IBOutlet weak var SecondOptionWindow: BuyWindowMaterial!
    @IBOutlet weak var FirstOptionWindow: BuyWindowMaterial!
    
    @IBOutlet weak var guestMenu_NumberLabel : UITextField!
    @IBOutlet weak var guestMenu_NameLabel : UITextField!
    @IBOutlet weak var guestMenu_LastNameLabel : UITextField!
    
    @IBOutlet weak var guestMenu_Addresse : UITextField!
    @IBOutlet weak var guestMenu_WorkType : UITextField!
    
    @IBOutlet weak var guestMenu_CashSwitch : UISwitch!
    @IBOutlet weak var guestMenu_CardSwitch : UISwitch!
    @IBOutlet weak var guestMenu_CreditSwitch : UISwitch!
    
    
    
    
    
    var screenLocation : CGRect!
    var firstMenuGestureRecognizer : UIPanGestureRecognizer!
    var secondMenuGestureRecognizer : UIPanGestureRecognizer!
    var thirdMenuGestureRecognizer : UIPanGestureRecognizer!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.toolbarHidden = true
        
        self.guestMenu_WorkType.delegate = self;
        self.guestMenu_Addresse.delegate = self;
        self.guestMenu_NumberLabel.delegate = self;
        self.guestMenu_LastNameLabel.delegate = self;
        self.guestMenu_NumberLabel.delegate = self;
        //self.UserNameField.delegate = self;
        self.PasswordTextField.delegate = self;
        
        self.visualEffects.effect = nil
        animattionInit()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LoginControlVC.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LoginControlVC.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)

       
        // Put it somewhere, give it a frame...
        UIView.animateWithDuration(0.5) {
            self.visualEffects.effect = UIBlurEffect(style: .Dark)
            
        }
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    
   
        self.MainBtnStack.hidden = false
        UIView.animateWithDuration(0.25, animations: {self.MainBtnStack.alpha = 1})
        self.animateBTn(self.signupBtn, withDelay: 0)
        self.animateBTn(self.loginBtn, withDelay: 1)
        self.animateBTn(self.guestBtn, withDelay: 2)
        // Do any additional setup after loading the view.
    
        firstMenuGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(BuyAsGuestVC.moveMenues))
        secondMenuGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(BuyAsGuestVC.moveMenuesTwo))
        thirdMenuGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(BuyAsGuestVC.moveMenuesThree))
        self.FirstOptionWindow.addGestureRecognizer(firstMenuGestureRecognizer)
        self.SecondOptionWindow.addGestureRecognizer(secondMenuGestureRecognizer)
        self.ThirdOptionWindow.addGestureRecognizer(thirdMenuGestureRecognizer)
        
        self.SecondOptionWindow.hidden = true
        self.ThirdOptionWindow.hidden = true
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func moveMenues(){
        
        
        
        
        if firstMenuGestureRecognizer.state == UIGestureRecognizerState.Began || firstMenuGestureRecognizer.state == UIGestureRecognizerState.Changed {
            
            let translation = firstMenuGestureRecognizer.translationInView(self.view)
            // note: 'view' is optional and need to be unwrapped
            firstMenuGestureRecognizer.view!.center = CGPointMake(firstMenuGestureRecognizer.view!.center.x + translation.x, firstMenuGestureRecognizer.view!.center.y)
            
            
            firstMenuGestureRecognizer.setTranslation(CGPointMake(0,0), inView: self.view)
        }
        
        if firstMenuGestureRecognizer.state == UIGestureRecognizerState.Ended  {
            
            if firstMenuGestureRecognizer.view!.center.x <  UIScreen.mainScreen().bounds.width * 0.25{
                
                if self.guestMenu_NumberLabel.text != nil && self.guestMenu_NumberLabel.text != "" && self.guestMenu_NameLabel.text != nil && self.guestMenu_NameLabel.text != "" && self.guestMenu_LastNameLabel.text != nil && self.guestMenu_LastNameLabel.text != ""{
                    
                    self.SecondOptionWindow.frame = CGRectMake(1000 , 80 , self.SecondOptionWindow.frame.width , self.SecondOptionWindow.frame.height)
                    self.SecondOptionWindow.hidden = false
                
                UIView.animateWithDuration(0.25 , delay: 0.05 * Double(0), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
                   
                    
                    
                    self.firstMenuGestureRecognizer.view!.center.x -= 400
                    
                    
                    self.secondMenuGestureRecognizer.view!.center = CGPointMake(UIScreen.mainScreen().bounds.maxX / 2 , self.secondMenuGestureRecognizer.view!.center.y)
                    

                    
                    
                    }, completion: { (finished) -> Void in
                    if finished {
                    
                    self.FirstOptionWindow.hidden = true
                        self.dismissKeyboard()
                    
                        }
                    })
                    
                }else {
                    
                    UIView.animateWithDuration(0.25 , delay: 0.05 * Double(0), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
                        
                        self.firstMenuGestureRecognizer.view!.center = CGPointMake(UIScreen.mainScreen().bounds.maxX / 2 , self.firstMenuGestureRecognizer.view!.center.y)
                        
                        
                        }, completion: nil)
                    
                    if self.guestMenu_NumberLabel.text == nil || self.guestMenu_NumberLabel.text == "" {
                        
                        
                        
                        let alertController = UIAlertController(title: "شماره تماس وارد نشده است", message:
                            "شماره تماس خود را وارد کنید", preferredStyle: UIAlertControllerStyle.Alert)
                        alertController.addAction(UIAlertAction(title: "خارج کردن", style: UIAlertActionStyle.Default,handler: nil))
                        
                        self.presentViewController(alertController, animated: true, completion: nil)
                        
                    }else  if self.guestMenu_NameLabel.text == "" || self.guestMenu_NameLabel.text == nil{
                        
                        let alertController = UIAlertController(title: "نام وارد نشده است", message:
                            "نام خود را وارد کنید", preferredStyle: UIAlertControllerStyle.Alert)
                        alertController.addAction(UIAlertAction(title: "خارج کردن", style: UIAlertActionStyle.Default,handler: nil))
                        
                        self.presentViewController(alertController, animated: true, completion: nil)
                        
                        
                    }else if self.guestMenu_LastNameLabel.text == nil || self.guestMenu_LastNameLabel.text == "" {
                        
                        let alertController = UIAlertController(title: "نام خانوادگی وارد نشده است", message:
                            "نام خانوادگی خود را وارد کنید", preferredStyle: UIAlertControllerStyle.Alert)
                        alertController.addAction(UIAlertAction(title: "خارج کردن", style: UIAlertActionStyle.Default,handler: nil))
                        
                        self.presentViewController(alertController, animated: true, completion: nil)
                        
                    }

                
                }
                
            }
            if firstMenuGestureRecognizer.view!.center.x >  UIScreen.mainScreen().bounds.width * 0.25 {
                
                UIView.animateWithDuration(0.25 , delay: 0.05 * Double(0), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
                    
                    self.firstMenuGestureRecognizer.view!.center = CGPointMake(UIScreen.mainScreen().bounds.maxX / 2 , self.firstMenuGestureRecognizer.view!.center.y)
                    
                    
                    }, completion: nil)
                
                
            }
            
        }
        
        
    }
    
    func moveMenuesTwo(){
        
        
        
        
        if secondMenuGestureRecognizer.state == UIGestureRecognizerState.Began || secondMenuGestureRecognizer.state == UIGestureRecognizerState.Changed {
            
            let translation = secondMenuGestureRecognizer.translationInView(self.view)
            // note: 'view' is optional and need to be unwrapped
            secondMenuGestureRecognizer.view!.center = CGPointMake(secondMenuGestureRecognizer.view!.center.x + translation.x, secondMenuGestureRecognizer.view!.center.y)
            
            
            secondMenuGestureRecognizer.setTranslation(CGPointMake(0,0), inView: self.view)
        }
        
        if secondMenuGestureRecognizer.state == UIGestureRecognizerState.Ended{
            
            if secondMenuGestureRecognizer.view!.center.x <  UIScreen.mainScreen().bounds.width * 0.25{
                
                if self.guestMenu_Addresse.text != nil && self.guestMenu_Addresse.text != "" && self.guestMenu_WorkType.text != nil && self.guestMenu_Addresse.text != "" {
                    
                    self.ThirdOptionWindow.frame = CGRectMake(1000 , 80 , self.ThirdOptionWindow.frame.width , self.ThirdOptionWindow.frame.height)
                    self.ThirdOptionWindow.hidden = false
                
                UIView.animateWithDuration(0.25 , delay: 0.05 * Double(0), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
                
                    self.secondMenuGestureRecognizer.view!.center.x -= 400
                    self.thirdMenuGestureRecognizer.view!.center = CGPointMake(UIScreen.mainScreen().bounds.maxX / 2 , self.thirdMenuGestureRecognizer.view!.center.y)
                    
                    
                    }, completion:  { (finished) -> Void in
                    if finished {
                    
                    self.SecondOptionWindow.hidden = true
                        self.dismissKeyboard()
                    
                    }
                })
                }else{
                    
                    UIView.animateWithDuration(0.25 , delay: 0.05 * Double(0), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
                        
                        self.secondMenuGestureRecognizer.view!.center = CGPointMake(UIScreen.mainScreen().bounds.maxX / 2 , self.secondMenuGestureRecognizer.view!.center.y)
                        
                        
                        }, completion: nil)
                    
                    if self.guestMenu_Addresse.text == "" || self.guestMenu_Addresse.text == nil{
                        
                        let alertController = UIAlertController(title: "آدرس وارد نشده است", message:
                            "آدرس خود را وارد کنید", preferredStyle: UIAlertControllerStyle.Alert)
                        alertController.addAction(UIAlertAction(title: "خارج کردن", style: UIAlertActionStyle.Default,handler: nil))
                        
                        self.presentViewController(alertController, animated: true, completion: nil)
                        
                    }else  if self.guestMenu_WorkType.text == nil || self.guestMenu_WorkType.text == "" {
                        
                        let alertController = UIAlertController(title: "برچسب محل کار وارد نشده است", message:
                            "برچست محل کار خود را وارد کنید", preferredStyle: UIAlertControllerStyle.Alert)
                        alertController.addAction(UIAlertAction(title: "خارج کردن", style: UIAlertActionStyle.Default,handler: nil))
                        
                        self.presentViewController(alertController, animated: true, completion: nil)
                        
                    }
                    
                }
                
            }
            if secondMenuGestureRecognizer.view!.center.x >  UIScreen.mainScreen().bounds.width * 0.25 && secondMenuGestureRecognizer.view!.center.x <  UIScreen.mainScreen().bounds.width * 0.75{
                
                UIView.animateWithDuration(0.25 , delay: 0.05 * Double(0), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
                    
                    self.secondMenuGestureRecognizer.view!.center = CGPointMake(UIScreen.mainScreen().bounds.maxX / 2 , self.secondMenuGestureRecognizer.view!.center.y)
                    
                    
                    }, completion: nil)
                
                
            }
            
            if secondMenuGestureRecognizer.view!.center.x >  UIScreen.mainScreen().bounds.width * 0.75{
                
                 self.FirstOptionWindow.hidden = false
                
                UIView.animateWithDuration(0.25 , delay: 0.05 * Double(0), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
                    
                    self.secondMenuGestureRecognizer.view!.center.x += 400
                   
                    self.firstMenuGestureRecognizer.view!.center = CGPointMake(UIScreen.mainScreen().bounds.maxX / 2 , self.firstMenuGestureRecognizer.view!.center.y)
                    
                    
                    }, completion:  { (finished) -> Void in
                        if finished {
                            
                            self.SecondOptionWindow.hidden = true
                            self.dismissKeyboard()
                        }
                })
                
            }
            
            
            
            
        }
        
        dismissKeyboard()
        
        
    }
    
    func moveMenuesThree(){
        
        if thirdMenuGestureRecognizer.state == UIGestureRecognizerState.Began || thirdMenuGestureRecognizer.state == UIGestureRecognizerState.Changed {
            
            let translation = thirdMenuGestureRecognizer.translationInView(self.view)
            // note: 'view' is optional and need to be unwrapped
            thirdMenuGestureRecognizer.view!.center = CGPointMake(thirdMenuGestureRecognizer.view!.center.x + translation.x, thirdMenuGestureRecognizer.view!.center.y)
            
            
            thirdMenuGestureRecognizer.setTranslation(CGPointMake(0,0), inView: self.view)
        }
        
        if thirdMenuGestureRecognizer.state == UIGestureRecognizerState.Ended{
            
            if thirdMenuGestureRecognizer.view!.center.x <  UIScreen.mainScreen().bounds.width * 0.5{
                
                UIView.animateWithDuration(0.25, delay: 0.05 * Double(0), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
                    
                    
                    self.thirdMenuGestureRecognizer.view!.center = CGPointMake(UIScreen.mainScreen().bounds.maxX / 2 , self.thirdMenuGestureRecognizer.view!.center.y)
                    
                    
                    }, completion: nil)
                
            }
            if thirdMenuGestureRecognizer.view!.center.x >  UIScreen.mainScreen().bounds.width * 0.5 {
                
                UIView.animateWithDuration(0.25 , delay: 0.05 * Double(0), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
                    
                    self.thirdMenuGestureRecognizer.view!.center.x += 400
                    self.SecondOptionWindow.hidden = false
                    self.secondMenuGestureRecognizer.view!.center = CGPointMake(UIScreen.mainScreen().bounds.maxX / 2 , self.firstMenuGestureRecognizer.view!.center.y)
                    
                    
                    }, completion:  { (finished) -> Void in
                        if finished {
                            
                            self.ThirdOptionWindow.hidden = true
                            self.dismissKeyboard()
                            
                        }
                })
                
                
            }
            
        }
        
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
    self.guestBtn.transform = CGAffineTransformMakeTranslation(1000, 0)
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
            self.animateBTn(self.guestBtn, withDelay: 2)
            self.loginStack.hidden = true
        
        })
    
    }

    @IBAction func showLoginMenu(sender: AnyObject) {
        
        self.fadeMainLabel(0.5 , fade:  true)
        self.animateBTn(self.signupBtn, withDelay: 0 , toPositionX: 1000 , toPositionY: 0 , completeFunction: {})
        self.animateBTn(self.loginBtn, withDelay: 1, toPositionX: 1000 , toPositionY: 0 , completeFunction: {})
        self.animateBTn(self.guestBtn, withDelay: 2, toPositionX: 1000 , toPositionY: 0 , completeFunction: {
        
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        
    }
    
    
    @IBAction func GeustBtnCLicked(sender: AnyObject) {
        
        
        UIView.animateWithDuration(0.25 , delay: 0.05 * Double(0), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
            
            self.MainBtnStack.alpha = 0
            
            
            }, completion: { (finished) -> Void in
                if finished {
                    
                    self.FirstOptionWindow.hidden = false
                    UIView.animateWithDuration(1, animations: {
                        self.FirstOptionWindow.alpha = 1
                    })
                    
                }
        })

    }
    
    @IBAction func cashSwitchValueChanged(sender: AnyObject) {
        
        self.guestMenu_CardSwitch.on = false
        self.guestMenu_CreditSwitch.on = false
        
    }
    
    @IBAction func cardSwitchValueChanged(sender: AnyObject) {
    
        self.guestMenu_CreditSwitch.on = false
        self.guestMenu_CashSwitch.on = false
    
    }
    
    @IBAction func creditSwitchValueChanged(sender: AnyObject) {
    
        self.guestMenu_CashSwitch.on = false
        self.guestMenu_CardSwitch.on = false
        
    
    }

    @IBAction func backFromGuestLoginPersonalInfo(sender: AnyObject) {
        
        
        UIView.animateWithDuration(0.25 , delay: 0.05 * Double(0), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
            
            self.FirstOptionWindow.alpha = 0
            
            
            }, completion: { (finished) -> Void in
                if finished {
                    
                    self.FirstOptionWindow.hidden = true
                    UIView.animateWithDuration(1, animations: {
                        self.MainBtnStack.alpha = 1
                        self.guestMenu_Addresse.text = ""
                        self.guestMenu_WorkType.text = ""
                        self.guestMenu_NumberLabel.text = ""
                        self.guestMenu_NameLabel.text = ""
                        self.guestMenu_LastNameLabel.text = ""
                        self.dismissKeyboard()
                    })
                    
                }
        })
        
    }
    
    @IBAction func completedGuestFormPersonalInfo(sender: AnyObject) {
        
        if self.guestMenu_NumberLabel.text != nil && self.guestMenu_NumberLabel.text != "" && self.guestMenu_NameLabel.text != nil && self.guestMenu_NameLabel.text != "" && self.guestMenu_LastNameLabel.text != nil && self.guestMenu_LastNameLabel.text != "" {
            
            self.SecondOptionWindow.frame = CGRectMake(1000 , 80 , self.SecondOptionWindow.frame.width , self.SecondOptionWindow.frame.height)
            self.SecondOptionWindow.hidden = false
        
            UIView.animateWithDuration(0.25 , delay: 0.05 * Double(0), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
            
                
                self.firstMenuGestureRecognizer.view!.center.x -= 400
                self.secondMenuGestureRecognizer.view!.center = CGPointMake(UIScreen.mainScreen().bounds.maxX / 2 , self.secondMenuGestureRecognizer.view!.center.y)
            
                }, completion: { (finished) -> Void in
                    if finished {
                        
                        self.FirstOptionWindow.hidden = true
                        self.guestMenu_Addresse.isFirstResponder()
                        self.dismissKeyboard()
                        
                    }
            })
        }else{
            
            if self.guestMenu_NumberLabel.text == nil || self.guestMenu_NumberLabel.text == "" {
                
                let alertController = UIAlertController(title: "شماره تماس وارد نشده است", message:
                    "شماره تماس خود را وارد کنید", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "خارج کردن", style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
                
            }else  if self.guestMenu_NameLabel.text == "" || self.guestMenu_NameLabel.text == nil{
                
                let alertController = UIAlertController(title: "نام وارد نشده است", message:
                    "نام خود را وارد کنید", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "خارج کردن", style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
                
                
            }else if self.guestMenu_LastNameLabel.text == nil || self.guestMenu_LastNameLabel.text == "" {
                
                let alertController = UIAlertController(title: "نام خانوادگی وارد نشده است", message:
                    "نام خانوادگی خود را وارد کنید", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "خارج کردن", style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
                
            }
            
            
            
        }
    }
    
    
    @IBAction func backFromGuestAddress(sender: AnyObject) {
        
        self.view.endEditing(true)
        

            
        
            UIView.animateWithDuration(0.25 , delay: 0.05 * Double(0), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
        
                self.secondMenuGestureRecognizer.view!.center.x += 400
                self.FirstOptionWindow.hidden = false
                self.firstMenuGestureRecognizer.view!.center = CGPointMake(UIScreen.mainScreen().bounds.maxX / 2 , self.firstMenuGestureRecognizer.view!.center.y)
                }, completion: { (finished) -> Void in
                    if finished {
                        
                        self.SecondOptionWindow.hidden = true
                        self.dismissKeyboard()
                        
                    }
            })
            
        
    }
    
    
    @IBAction func completedGuestFormAddress(sender: AnyObject) {
        
        
                    
                    
                    if self.guestMenu_Addresse.text != nil && self.guestMenu_Addresse.text != "" && self.guestMenu_WorkType.text != nil && self.guestMenu_Addresse.text != "" {
                        
                        self.ThirdOptionWindow.frame = CGRectMake(1000 , 80 , self.ThirdOptionWindow.frame.width , self.ThirdOptionWindow.frame.height)
                        self.ThirdOptionWindow.hidden = false
                        
                        UIView.animateWithDuration(0.25 , delay: 0.05 * Double(0), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
                            
                            self.secondMenuGestureRecognizer.view!.center.x -= 400
                            
                            self.thirdMenuGestureRecognizer.view!.center = CGPointMake(UIScreen.mainScreen().bounds.maxX / 2 , self.thirdMenuGestureRecognizer.view!.center.y)
                            
                            }, completion:{ (finished) -> Void in
                                if finished {
                                    
                                    self.SecondOptionWindow.hidden = true
                                    self.dismissKeyboard()
                                }
                        })
                    }else{
                        
                        if self.guestMenu_Addresse.text == "" || self.guestMenu_Addresse.text == nil{
                            
                            let alertController = UIAlertController(title: "آدرس وارد نشده است", message:
                                "آدرس خود را وارد کنید", preferredStyle: UIAlertControllerStyle.Alert)
                            alertController.addAction(UIAlertAction(title: "خارج کردن", style: UIAlertActionStyle.Default,handler: nil))
                            
                            self.presentViewController(alertController, animated: true, completion: nil)
                            
                        }else  if self.guestMenu_WorkType.text == nil || self.guestMenu_WorkType.text == "" {
                            
                            let alertController = UIAlertController(title: "برچسب محل کار وارد نشده است", message:
                                "برچست محل کار خود را وارد کنید", preferredStyle: UIAlertControllerStyle.Alert)
                            alertController.addAction(UIAlertAction(title: "خارج کردن", style: UIAlertActionStyle.Default,handler: nil))
                            
                            self.presentViewController(alertController, animated: true, completion: nil)
                            
                        }
                        
                        
                        
                    }
 
        
    }
    
    @IBAction func Paymentcontinue(sender: AnyObject) {
    }
    
    @IBAction func paymentExit(sender: AnyObject) {
        self.view.endEditing(true)
        
        UIView.animateWithDuration(0.25 , delay: 0.05 * Double(0), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
        
            self.thirdMenuGestureRecognizer.view!.center.x += 400
            
            self.SecondOptionWindow.hidden = false
            self.secondMenuGestureRecognizer.view!.center = CGPointMake(UIScreen.mainScreen().bounds.maxX / 2 , self.firstMenuGestureRecognizer.view!.center.y)
        
            }, completion: { (finished) -> Void in
                if finished {
                    
                    self.ThirdOptionWindow.hidden = true
                    self.dismissKeyboard()
                    
                }
        })
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            if view.frame.origin.y == 0{
                screenLocation = keyboardSize
                
                UIView.animateWithDuration(0.1, animations: { () -> Void in
                    self.view.frame.origin.y -= 100
                    self.navigationController?.navigationBar.alpha = 0
                    self.tabBarController?.tabBar.alpha = 0
                    
                })
            }
            else {
                
            }
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

    
    @IBAction func loginBtnClicked(sender : AnyObject){
        
        if self.UserNameField.text == "" && self.UserNameField.text == nil{
            
            let alertController = UIAlertController(title: "نام کاربری وارد نشده است", message:
                "نام کاربری خود را وارد کنید", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "خارج کردن", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)

        }
        
        if self.PasswordTextField.text == "" && self.PasswordTextField.text == nil{
        
            let alertController = UIAlertController(title: "رمز وارد نشده است", message:
                "رمز خود را وارد کنید", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "خارج کردن", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        
        }
        
        
        
        
    }
    
}
