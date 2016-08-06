//
//  BasketPageVC.swift
//  SanatSharif
//
//  Created by CyrusREfahi on 4/15/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

import RZTransitions
import UIKit


class BasketPageVC: UIViewController  , UITableViewDelegate , UITableViewDataSource , RZTransitionInteractionControllerDelegate {

    var pushPopInteractionController: RZTransitionInteractionController?

    
    @IBOutlet weak var ButtomBuyView: UIView!
    @IBOutlet weak var BasketTableView: UITableView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var ButtomViewOutlet: LoginButtonView!
    
    var basket : Cart!
    var itemTemp : Item!
    var BuyButtonInView : Bool = false
    var startCheking : Bool = false
    
    var lastTouchPosition : CGFloat!
    var lastTouchPositionForDirection : CGFloat!
    var goinDown : Bool = true
    
    var currentSection : Int = 0
    private var lastContentOffset: CGFloat = 0
    

    
    override func viewDidLoad() {
        
        
        BasketTableView.delegate = self
        BasketTableView.dataSource = self
        
        //let navigationController = UINavigationController()
        self.navigationController!.delegate = RZTransitionsManager.shared()
        
//        snippets()
//        
//        pushPopInteractionController = RZHorizontalInteractionController()
//        if let vc = pushPopInteractionController as? RZHorizontalInteractionController {
//            vc.nextViewControllerDelegate = self
//            vc.attachViewController(self, withAction: .PushPop)
//            RZTransitionsManager.shared().setInteractionController( vc, fromViewController:self.dynamicType, toViewController:nil, forAction: .PushPop);
//        }
//        
//        pushPopInteractionController = RZHorizontalInteractionController()
//        if let vc = pushPopInteractionController as? RZHorizontalInteractionController {
//            vc.nextViewControllerDelegate = self
//            vc.attachViewController(self, withAction: .PushPop)
//            RZTransitionsManager.shared().setInteractionController( vc, fromViewController:self.dynamicType, toViewController:nil, forAction: .PushPop);
//        }
//        RZTransitionsManager.shared().setAnimationController( RZCardSlideAnimationController(),
//                                                              fromViewController:self.dynamicType,
//                                                              forAction:.PushPop);
//        
//        RZTransitionsManager.shared().setAnimationController( RZZoomPushAnimationController(),
//                                                              fromViewController:self.dynamicType,
//                                                              toViewController:LoginControlVC.self,
//                                                              forAction:.PushPop);
//        
        
    
        
        RZTransitionsManager.shared().setAnimationController( RZCardSlideAnimationController(),
                                                              fromViewController:self.dynamicType,
                                                              forAction:.PushPop);
        
    

//        self.navigationController?.pushViewController(UIViewController(), animated: true)
        
       
      
        
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
     
        
    }
    
    override func viewWillAppear(animated: Bool) {
     
//        RZTransitionsManager.shared().setInteractionController( pushPopInteractionController,
//                                                                fromViewController:self.dynamicType,
//                                                                toViewController:LoginControlVC,
//                                                                forAction:.PushPop);
    
        
    }
    
    override func viewDidAppear(animated: Bool) {
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.row == 0{
            
            return 50
            
        }
        
        
        
        if indexPath.row == 9{
            
            return 50
            
        }
        
        return 100
    }
    
        
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        currentSection = indexPath.section
        print(currentSection)
        
        if(indexPath.row == 0 ){
            
            
            if let cell = tableView.dequeueReusableCellWithIdentifier("infoCell") as? infoCell {
                
                //UIView.animateWithDuration(2, animations: { cell.alpha = 1 })
                
                
                return cell
                
            } else {
                
                return UITableViewCell()
            }
            
            
        }
        
        if(indexPath.row == 9 ){
            

            
            if let cell = tableView.dequeueReusableCellWithIdentifier("BuyOut") as? BuyOutCell {
                
                //UIView.animateWithDuration(2, animations: { cell.alpha = 1 })

                BuyButtonInView = true
                return cell
                
            } else {
                
                return UITableViewCell()
            }
        
            
        }
        
        
        if indexPath.row == 2 && goinDown{
            
            if self.ButtomBuyView.hidden == false{
                
                BuyButtonInView = false
                
            }
            
            
            
            self.ButtomBuyView.transform = CGAffineTransformMakeTranslation( 1000 , 0)
            self.ButtomBuyView.hidden = false
            
            UIView.animateWithDuration(0.5, delay: 0.05 * Double(0), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
                
                self.ButtomBuyView.transform = CGAffineTransformMakeTranslation(0, 0)
                
                
                }, completion: nil)
            
            
            
            
            
        }
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("BasketCell") as? BasketCell {
            
             //UIView.animateWithDuration(2, animations: { cell.alpha = 1 })
            
            return cell
            
        } else {
            
            return UITableViewCell()
        }
        
    }
    
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
    
        if (scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height)) {
         
        }
        
        
        if  BuyButtonInView{
            
            self.lastTouchPosition = scrollView.contentOffset.y
            print("this is inside the fucking if    \(lastTouchPosition)")
            self.BuyButtonInView = false
            startCheking = true
            
        }
        
        
        print("this is NOT    \(scrollView.contentOffset.y) + \(scrollView.bounds)")
        
        if startCheking  {
            if scrollView.contentOffset.y - self.lastTouchPosition > 35 {
                self.ButtomBuyView.hidden = true
                startCheking = false
            }
    }
        
        if goinDown {
          //  print("going down")
        }
        if !goinDown{
            //print ("Going up")
        }
        
        if (self.lastContentOffset > scrollView.contentOffset.y) {
            goinDown = false
        }
        else if (self.lastContentOffset < scrollView.contentOffset.y){
            // move down
            if !goinDown && self.ButtomBuyView.hidden == true {
                
                self.ButtomBuyView.transform = CGAffineTransformMakeTranslation(1000, 0)
                self.ButtomBuyView.hidden = false
                
                UIView.animateWithDuration(0.5, delay: 0.05 * Double(0), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
                    
                    self.ButtomBuyView.transform = CGAffineTransformMakeTranslation(0, 0)
                    
                    
                    }, completion: nil)
            }
            goinDown = true
        }
        
        // update the new position acquired
        self.lastContentOffset = scrollView.contentOffset.y
        
}
    
    func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if(indexPath.row == 9 && !goinDown){
            self.ButtomBuyView.transform = CGAffineTransformMakeTranslation(1000, 0)
            self.ButtomBuyView.hidden = false
            UIView.animateWithDuration(0.5, delay: 0.05 * Double(0), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
                
                self.ButtomBuyView.transform = CGAffineTransformMakeTranslation(0, 0)
                
                
                }, completion: nil)
            
        }
        
        if indexPath.row == 1 && currentSection != indexPath.section{
            
            UIView.animateWithDuration(0.25, delay: 0.05 * Double(0), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
                
                self.ButtomBuyView.transform = CGAffineTransformMakeTranslation(0, 100)
                
                
                }, completion: nil)
            
        }
        
        
    }
    
   
    

    
     func reloadData(){
        BasketTableView.reloadData()
    }
    
}
