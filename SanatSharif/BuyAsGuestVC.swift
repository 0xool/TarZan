//
//  BuyAsGuestVC.swift
//  SanatSharif
//
//  Created by cyrus refahi on 7/18/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit


class BuyAsGuestVC: UIViewController {
    
    @IBOutlet weak var ThirdOptionWindow: BuyWindowMaterial!
    @IBOutlet weak var SecondOptionWindow: BuyWindowMaterial!
    @IBOutlet weak var FirstOptionWindow: BuyWindowMaterial!
    
    enum PaymentMethod {
        case ONLINE
        case CASH
        case ACCOUNT
    }
   
    @IBOutlet weak var InfoContainerVIew: BasketInfoTableViewVC!
    var name : String!
    var number : String!
    
    var lastName : String!
    var workType : String!
    var addresss : String!
    
    var paymentMethod : PaymentMethod!
    var firstLocation :CGPoint = CGPointMake(0, 0)
    var firstMenuGestureRecognizer : UIPanGestureRecognizer!
    var secondMenuGestureRecognizer : UIPanGestureRecognizer!
    var thirdMenuGestureRecognizer : UIPanGestureRecognizer!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstMenuGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(BuyAsGuestVC.moveMenues))
        secondMenuGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(BuyAsGuestVC.moveMenuesTwo))
        thirdMenuGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(BuyAsGuestVC.moveMenuesThree))
        self.FirstOptionWindow.addGestureRecognizer(firstMenuGestureRecognizer)
        self.SecondOptionWindow.addGestureRecognizer(secondMenuGestureRecognizer)
        self.ThirdOptionWindow.addGestureRecognizer(thirdMenuGestureRecognizer)
        
        self.SecondOptionWindow.hidden = true
        self.ThirdOptionWindow.hidden = true
        // Do any additional setup after loading the view.
    }
    
    func moveMenues(){
        
        SecondOptionWindow.center.x += 150
        self.SecondOptionWindow.hidden = false
        
        
        if firstMenuGestureRecognizer.state == UIGestureRecognizerState.Began || firstMenuGestureRecognizer.state == UIGestureRecognizerState.Changed {
            
            let translation = firstMenuGestureRecognizer.translationInView(self.view)
            // note: 'view' is optional and need to be unwrapped
            firstMenuGestureRecognizer.view!.center = CGPointMake(firstMenuGestureRecognizer.view!.center.x + translation.x, firstMenuGestureRecognizer.view!.center.y)
            
            
            firstMenuGestureRecognizer.setTranslation(CGPointMake(0,0), inView: self.view)
        }
        
        if firstMenuGestureRecognizer.state == UIGestureRecognizerState.Ended{
            
            if firstMenuGestureRecognizer.view!.center.x <  UIScreen.mainScreen().bounds.width * 0.25{
                
                UIView.animateWithDuration(1, delay: 0.05 * Double(0), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
                    
                    self.firstMenuGestureRecognizer.view!.center.x -= 400
                    self.secondMenuGestureRecognizer.view!.center = CGPointMake(UIScreen.mainScreen().bounds.maxX / 2 , self.secondMenuGestureRecognizer.view!.center.y)
                    
                    
                    }, completion: nil)
                
            }
            if firstMenuGestureRecognizer.view!.center.x >  UIScreen.mainScreen().bounds.width * 0.25 {
                
                UIView.animateWithDuration(1, delay: 0.05 * Double(0), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
                    
                    self.firstMenuGestureRecognizer.view!.center = CGPointMake(UIScreen.mainScreen().bounds.maxX / 2 , self.firstMenuGestureRecognizer.view!.center.y)
                    
                    
                    }, completion: nil)
                
                
            }
            
        }
        
        
    }
    
    func moveMenuesTwo(){
        
        ThirdOptionWindow.center.x += 150
        self.ThirdOptionWindow.hidden = false
        
        
        if secondMenuGestureRecognizer.state == UIGestureRecognizerState.Began || secondMenuGestureRecognizer.state == UIGestureRecognizerState.Changed {
            
            let translation = secondMenuGestureRecognizer.translationInView(self.view)
            // note: 'view' is optional and need to be unwrapped
            secondMenuGestureRecognizer.view!.center = CGPointMake(secondMenuGestureRecognizer.view!.center.x + translation.x, secondMenuGestureRecognizer.view!.center.y)
            
            
            secondMenuGestureRecognizer.setTranslation(CGPointMake(0,0), inView: self.view)
        }
        
        if secondMenuGestureRecognizer.state == UIGestureRecognizerState.Ended{
            
            if secondMenuGestureRecognizer.view!.center.x <  UIScreen.mainScreen().bounds.width * 0.25{
                
                UIView.animateWithDuration(1, delay: 0.05 * Double(0), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
                    
                    self.secondMenuGestureRecognizer.view!.center.x -= 400
                    self.thirdMenuGestureRecognizer.view!.center = CGPointMake(UIScreen.mainScreen().bounds.maxX / 2 , self.thirdMenuGestureRecognizer.view!.center.y)
                    
                    
                    }, completion: nil)
                
            }
            if secondMenuGestureRecognizer.view!.center.x >  UIScreen.mainScreen().bounds.width * 0.25 && secondMenuGestureRecognizer.view!.center.x <  UIScreen.mainScreen().bounds.width * 0.75{
                
                UIView.animateWithDuration(1, delay: 0.05 * Double(0), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
                    
                    self.secondMenuGestureRecognizer.view!.center = CGPointMake(UIScreen.mainScreen().bounds.maxX / 2 , self.secondMenuGestureRecognizer.view!.center.y)
                    
                    
                    }, completion: nil)
                
                
            }
            
            if secondMenuGestureRecognizer.view!.center.x >  UIScreen.mainScreen().bounds.width * 0.75{
                
                UIView.animateWithDuration(1, delay: 0.05 * Double(0), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
                    
                    self.secondMenuGestureRecognizer.view!.center.x += 400
                    self.firstMenuGestureRecognizer.view!.center = CGPointMake(UIScreen.mainScreen().bounds.maxX / 2 , self.firstMenuGestureRecognizer.view!.center.y)
                    
                    
                    }, completion: nil)
                
            }
            
            
            
            
        }
        
        
    }
    
    func moveMenuesThree(){
        
        
        
        
        if thirdMenuGestureRecognizer.state == UIGestureRecognizerState.Began || thirdMenuGestureRecognizer.state == UIGestureRecognizerState.Changed {
            
            let translation = thirdMenuGestureRecognizer.translationInView(self.view)
            // note: 'view' is optional and need to be unwrapped
            thirdMenuGestureRecognizer.view!.center = CGPointMake(thirdMenuGestureRecognizer.view!.center.x + translation.x, thirdMenuGestureRecognizer.view!.center.y)
            
            
            thirdMenuGestureRecognizer.setTranslation(CGPointMake(0,0), inView: self.view)
        }
        
        if thirdMenuGestureRecognizer.state == UIGestureRecognizerState.Ended{
            
            if thirdMenuGestureRecognizer.view!.center.x <  UIScreen.mainScreen().bounds.width * 0.25{
                
                UIView.animateWithDuration(1, delay: 0.05 * Double(0), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
                    
                    
                    self.thirdMenuGestureRecognizer.view!.center = CGPointMake(UIScreen.mainScreen().bounds.maxX / 2 , self.thirdMenuGestureRecognizer.view!.center.y)
                    
                    
                    }, completion: nil)
                
            }
            if thirdMenuGestureRecognizer.view!.center.x >  UIScreen.mainScreen().bounds.width * 0.25 {
                
                UIView.animateWithDuration(1, delay: 0.05 * Double(0), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
                    
                    self.thirdMenuGestureRecognizer.view!.center.x += 400
                    self.secondMenuGestureRecognizer.view!.center = CGPointMake(UIScreen.mainScreen().bounds.maxX / 2 , self.secondMenuGestureRecognizer.view!.center.y)
                    
                    
                    
                    }, completion: nil)
                
                
            }
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // you can set this name in 'segue.embed' in storyboard
        if segue.identifier == "containerSegue" {
            let connectContainerViewController = segue.destinationViewController as! BasketInfoTableViewVC
            InfoContainerVIew = connectContainerViewController
        }
    }
    

    @IBAction func buyBtnClicked(sender: AnyObject) {
       
        
        name = InfoContainerVIew.nameLabel.text
        lastName = InfoContainerVIew.familyNameLabel.text
        number = InfoContainerVIew.numberLabel.text
        
//        workType = InfoContainerVIew.workTypeLabel.
        if InfoContainerVIew.paymentMethod.titleForSegmentAtIndex(InfoContainerVIew.paymentMethod.selectedSegmentIndex) == "آنلاین"{
            
            paymentMethod = PaymentMethod.ONLINE
        
        }else if InfoContainerVIew.paymentMethod.titleForSegmentAtIndex(InfoContainerVIew.paymentMethod.selectedSegmentIndex) == "نقدی"{
            
            paymentMethod = PaymentMethod.CASH
            
        }else if InfoContainerVIew.paymentMethod.titleForSegmentAtIndex(InfoContainerVIew.paymentMethod.selectedSegmentIndex) == "اعتباری"{
            
            paymentMethod = PaymentMethod.ACCOUNT
            
        }
        
        if number != nil && number != "" {
            
            if name != nil && name != ""{
                
                if lastName != nil && lastName != ""{
                
                }else{
                    
                    let alertController = UIAlertController(title: "نام وارد نشده است", message:
                        "نام خانوادگی خود را وارد کنید", preferredStyle: UIAlertControllerStyle.Alert)
                    alertController.addAction(UIAlertAction(title: "خارج کردن", style: UIAlertActionStyle.Default,handler: nil))
                    
                    self.presentViewController(alertController, animated: true, completion: nil)
                    
                }
            }else{
                
                let alertController = UIAlertController(title: "نام خانوادگی وارد نشده است", message:
                    "نام  خود را وارد کنید", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "خارج کردن", style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
                
            }
        
        }else{
            
            let alertController = UIAlertController(title: "شماره تماس وارد نشده است", message:
                "شماره تماس خود را وارد کنید", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "خارج کردن", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
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
    @IBAction func goToNextOption(sender: AnyObject) {
        
        UIView.animateWithDuration(1, delay: 0.05 * Double(0), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
            
            self.FirstOptionWindow.transform = CGAffineTransformMakeTranslation(-1000, 0)
            
            
            }, completion: nil)
        
    }

}
