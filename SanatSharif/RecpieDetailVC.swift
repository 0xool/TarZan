//
//  RecpieDetailVC.swift
//  SanatSharif
//
//  Created by cyrus refahi on 7/26/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit
import DOFavoriteButton




extension UIPanGestureRecognizer {
    
    func isUp(theViewYouArePassing: UIView) -> Bool {
        let velocity : CGPoint = velocityInView(theViewYouArePassing)
        if velocity.y > 0 {
            return false
        } else {
            return true
        }
    }
}

class RecpieDetailVC: UIViewController , UITableViewDelegate , UITableViewDataSource    {
    
    
    
    @IBOutlet weak var shareBtn : UIButton!
    @IBOutlet weak var likeBtn : UIButton!
    @IBOutlet weak var favBtn : UIButton!
    
    @IBOutlet weak var infoPanelView: UIView!
//    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tableViewTopContraint: NSLayoutConstraint!
    @IBOutlet weak var picViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var picView: UIView!
    @IBOutlet weak var backBtnView: RoundViewMaterial!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var infoPanelHeightConstraint: NSLayoutConstraint!
    
    var swipeUpGesture : UIPanGestureRecognizer!
    var lastLocation:CGPoint = CGPointMake(0, 0)
    var againScrolledToTop : Bool = false
    
    var dissmissAnimation : Bool = false
    
    var mainImageIsShrinked : Bool = false
    private var IngredientItemCollor : Bool = false
    
    override func viewDidLoad() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.favBtn.addTarget(self, action: #selector(RecpieDetailVC.favBtnClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.likeBtn.addTarget(self, action: #selector(RecpieDetailVC.likeBtnClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.shareBtn.addTarget(self, action: #selector(RecpieDetailVC.shareBtnClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.infoPanelHeightConstraint.constant = 0
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        swipeUpGesture = UIPanGestureRecognizer(target: self, action: #selector(RecpieDetailVC.shrinkImageViewOnSwipe))
        
        self.picView.addGestureRecognizer(swipeUpGesture)


        self.picViewHeightConstraint.constant = UIScreen.mainScreen().bounds.height
        
//        let nib = UINib(nibName: "ingredientSectionHeader", bundle: nil)
       // tableView.registerNib(nib, forHeaderFooterViewReuseIdentifier: "ingredientSectionHeader")
        
//        let nib = UINib(nibName: "IngredientSectionHeaderCell", bundle: nil)
//        self.tableView.registerNib(nib, forCellReuseIdentifier: "ingredientSectionHeaderCell")
        

        
        backBtnView.transform = CGAffineTransformMakeTranslation(0, -100)
        favBtn.transform = CGAffineTransformMakeTranslation(0, -100)
        likeBtn.transform = CGAffineTransformMakeTranslation(0, -100)
        shareBtn.transform = CGAffineTransformMakeTranslation(0, -100)
        
        
            }
    
    

    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
       // lastLocation = self.center
        
    }
    
    func shrinkImageViewOnSwipe (gesture: UIPanGestureRecognizer){
       
        if !mainImageIsShrinked {
        
        if ( gesture.state == UIGestureRecognizerState.Began || gesture.state ==  UIGestureRecognizerState.Changed ) &&  self.picViewHeightConstraint.constant > 100 {
        
            print(gesture.translationInView(self.picView).y)
        
            self.picViewHeightConstraint.constant = UIScreen.mainScreen().bounds.height +  gesture.translationInView(self.picView).y
            
        }
        
        if gesture.state == UIGestureRecognizerState.Ended {
            
            if self.picViewHeightConstraint.constant < UIScreen.mainScreen().bounds.height * 0.9{
                
                mainImageIsShrinked = true
                self.picViewHeightConstraint.constant = UIScreen.mainScreen().bounds.height * 0.25
                UIView.animateWithDuration(0.25, animations: {
                    
                    self.view.layoutIfNeeded()
                    
                    }, completion: { (Finished) in
                        if Finished {
                            
                        }
                })
                
            }else{
                self.picViewHeightConstraint.constant = UIScreen.mainScreen().bounds.height
                UIView.animateWithDuration(0.25, animations: {
                    
                    self.view.layoutIfNeeded()
                    
                    }, completion: { (Finished) in
                        if Finished {
                            
                        }
                })
            }
            
        }
        
        }
        
        
       
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
            if !dissmissAnimation{
            
        
            if scrollView.contentOffset.y < -50 && mainImageIsShrinked{
            
                if againScrolledToTop{
                
                self.picViewHeightConstraint.constant =     UIScreen.mainScreen().bounds.height
                    UIView.animateWithDuration(0.5, animations: {
                    
                        self.view.layoutIfNeeded()
                    
                        }, completion: { (Finished) in
                            if Finished {
                            
                            }
                    })
                
                
                
                    mainImageIsShrinked = false
                
                }
                againScrolledToTop = !againScrolledToTop

            }
        
            if scrollView.contentOffset.y < 0 {
            
                if self.tableViewTopContraint.constant == -40{
                    self.tableViewTopContraint.constant = 0
                    UIView.animateWithDuration(0.5, animations: {
                    
                        self.view.layoutIfNeeded()
                        self.infoPanelView.alpha = 1
                    
                        }, completion: { (Finished) in
                            if Finished {
                            
                            }
                    })
                }
            }
            
            if scrollView.contentOffset.y > 20 {
            
            
                if self.tableViewTopContraint.constant == 0{
                    self.tableViewTopContraint.constant = -40
                UIView.animateWithDuration(0.5, animations: {
                
                        self.infoPanelView.alpha = 0
                        self.view.layoutIfNeeded()
                
                        }, completion: { (Finished) in
                            if Finished {
                        
                            }
                    })
                }
        
        
            }
        }
    }
    
    
    func scrollViewDidScrollToTop(scrollView: UIScrollView) {
        
        
        
       
        
    }
    
    
    override func viewDidAppear(animated: Bool) {
        animateBtnLoadView()
        self.infoPanelHeightConstraint.constant = 40
        UIView.animateWithDuration(0.2, animations: {
                self.view.layoutIfNeeded()
        })
    }
    
    func animateBtnLoadView(){
        
        UIView.animateWithDuration(0.2, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
            self.backBtnView.transform = CGAffineTransformMakeTranslation(0, 0)
            self.favBtn.transform = CGAffineTransformMakeTranslation(0, 0)
            self.likeBtn.transform = CGAffineTransformMakeTranslation(0, 0)
            self.shareBtn.transform = CGAffineTransformMakeTranslation(0, 0)
            }, completion: nil)
      
    }
    
    func animateBtnDissmissView(completion : (Bool) -> Void){
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
            self.backBtnView.transform = CGAffineTransformMakeTranslation(0, -100)
            self.favBtn.transform = CGAffineTransformMakeTranslation(0, -100)
            self.likeBtn.transform = CGAffineTransformMakeTranslation(0, -100)
            self.shareBtn.transform = CGAffineTransformMakeTranslation(0, -100)
            self.tableView.setContentOffset(CGPoint(x: 0, y: 0), animated:true)

            }, completion: completion)
        
    }
    
    func favBtnClicked(sender : DOFavoriteButton)  {
        
        if sender.selected {
            sender.deselect()
        } else {
            sender.select()
        }
    }
    
    func likeBtnClicked(sender : DOFavoriteButton)  {
        
        if sender.selected {
            sender.deselect()
        } else {
            sender.select()
        }
    }
    
    func shareBtnClicked(sender : DOFavoriteButton)  {
        
        if sender.selected {
            sender.deselect()
        } else {
            sender.select()
        }
    }
    
    
    func tableView(tableView: UITableView,
                              heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
       
        
        if indexPath.section == 1 {
            return 250
        }
        
        if indexPath.section == 2 {
            return 250 * 2
        }
        
        if indexPath.section == 3 {
            return 150
        }
        
        return 40
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 4
        }
        
        if section == 1{
            return 1
        }
        
        if section == 2 {
            return 1
        }
        
        if section == 3 {
            return 1
        }
        
        
        return 1
    }
    
//    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//    
////        if section == 1 {
//        
//        let cell = self.tableView.dequeueReusableHeaderFooterViewWithIdentifier("ingredientSectionHeader")
//        let header = cell as! ingredientSectionHeader
//        return header
////        }
//        
////        return nil
//    
//    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("IngredientSectionHeaderCell")
            return cell
            
        }
        
        if section == 1 {
            
            let cell = self.tableView.dequeueReusableCellWithIdentifier("CookInstrunctionsHeader")
            return cell
            
        }
        
        if section == 2 {
            
            let cell = self.tableView.dequeueReusableCellWithIdentifier("reviewSectionHeader")
            return cell
            
        }
        
        if section == 3 {
            
            let cell = self.tableView.dequeueReusableCellWithIdentifier("RelatedSectionHeader")
            return cell
            
        }
        
        
        
        return UITableViewCell()
        
        
        
        
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
       
        
        return 50
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5
    }
    

    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
         if indexPath.section == 0 {
            
            
            let cell = tableView.dequeueReusableCellWithIdentifier("IngredientItemCell", forIndexPath: indexPath) as! IngredientItemCell
            
            cell.configureCell(IngredientItemCollor)
            IngredientItemCollor = !IngredientItemCollor
            
            // Configure the cell...
            return cell
            
        }else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCellWithIdentifier("CookInstrunctions" , forIndexPath: indexPath)
            
            return cell
        }else if indexPath.section == 2 {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("reviewSection" , forIndexPath: indexPath)
            
            return cell
                
        }else if indexPath.section == 3 {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("RelatedSection" , forIndexPath: indexPath)
            
            return cell
            
            }else{
            return UITableViewCell()
            
        }
        
        
    }
    
    
    
    
    
    @IBAction func backBtnClicked(sender: AnyObject) {
        
        dissmissAnimation = true
        
        CATransaction.begin()
        
        CATransaction.setCompletionBlock {
            
            CATransaction.begin()
            CATransaction.setCompletionBlock({
                self.dismissViewControllerAnimated(true, completion: nil)

            })
            self.picViewHeightConstraint.constant = UIScreen.mainScreen().bounds.height
            self.tableViewTopContraint.constant = 0
            UIView.animateWithDuration(0.5, animations: {
                self.view.layoutIfNeeded()
            })
            CATransaction.commit()
            
        }
        
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
        self.tableView.setContentOffset(CGPoint(x: 0, y: 0), animated:true)
        
        UIView.animateWithDuration(0.4, animations: {
            
            self.backBtnView.transform = CGAffineTransformMakeTranslation(0, -100)
            self.favBtn.transform = CGAffineTransformMakeTranslation(0, -100)
            self.likeBtn.transform = CGAffineTransformMakeTranslation(0, -100)
            self.shareBtn.transform = CGAffineTransformMakeTranslation(0, -100)
        })
        
     CATransaction.commit()
        
        
    }
    
    
    
    

}
