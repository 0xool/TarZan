//
//  basketDetailVC.swift
//  SanatSharif
//
//  Created by cyrus refahi on 7/24/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit
import CoreData
import IOStickyHeader


class basketDetailVC: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource   {

    
    
    //@IBOutlet weak var backgroundImage: UIImageView!
//    @IBOutlet weak var descTextField: UITextView!
//    @IBOutlet weak var dateLabel: UILabel!
    
//    @IBOutlet weak var notifLabel: UILabel!
//    @IBOutlet weak var notifSwitch: UISwitch!
   // @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView : UICollectionView!
    @IBOutlet weak var bottomView : UIView!
//    @IBOutlet weak var deleteBTN: UIButton!
//    @IBOutlet weak var editBTN: UIButton!
//    @IBOutlet weak var notifView : UIView!
    
    var dateNotifIsOn : Bool = true
 
   
    let headerNib = UINib(nibName: "BasketDetailHeaderCell", bundle: NSBundle.mainBundle())
    let moContext = UserModelManager.sharedInstance._dataControler.managedObjectContext
    var basket : Basket!
    
    
    override func viewDidLoad() {
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        bottomView.transform = CGAffineTransformMakeTranslation(0, -100)
        
        self.navigationController?.navigationBar.tintColor  = UIColor.whiteColor()
        self.tabBarController?.tabBar.hidden = true
        self.navigationController?.navigationItem.title = "بازگشت"
        
        if let layout: IOStickyHeaderFlowLayout = self.collectionView.collectionViewLayout as? IOStickyHeaderFlowLayout {
            layout.parallaxHeaderReferenceSize = CGSizeMake(UIScreen.mainScreen().bounds.size.width, 274)
            layout.parallaxHeaderMinimumReferenceSize = CGSizeMake(UIScreen.mainScreen().bounds.size.width, 180)
            layout.itemSize = CGSizeMake(UIScreen.mainScreen().bounds.size.width, layout.itemSize.height)
            layout.parallaxHeaderAlwaysOnTop = true
            layout.disableStickyHeaders = true
            self.collectionView.collectionViewLayout = layout
        }
        
        self.collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, 0)
        
        self.collectionView.registerNib(self.headerNib, forSupplementaryViewOfKind: IOStickyHeaderParallaxHeader, withReuseIdentifier: "header")
        

        
//        self.titleLabel.text = basket.bName
//        
//        if basket.bImage != nil{
//            self.backgroundImage.image = UIImage(data: basket.bImage!)
//        }else{
//            self.backgroundImage.image = UIImage(named: "GroceryTemp3")
//        }
//        
//        self.dateLabel.text =  "تاریخ :" + basket.bDate!.datatypeValue
//       
//        
//        if basket.bDiscription != nil {
//            self.descTextField.text =  "توضیحات : " + basket.bDiscription!
//            print(basket.bDiscription)
//        }else {
//            self.descTextField.text = "توضیحاتی در این مورد داده نشده است."
//        }
//        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
       UIView.animateWithDuration(0.25) { 
            self.bottomView.transform = CGAffineTransformMakeTranslation(0, 0)
        }
        
        self.navigationController?.navigationBarHidden = false
        
        print("this is the notif core data number  \(basket.bNotif)")
        
        if basket.bNotif! == 1 {
            
           
            
        }else{
            
            
            self.collectionView.performBatchUpdates({
                
                self.dateNotifIsOn = false
                self.collectionView.reloadData()
                
                //cell.frame.size.height = size.height
                
                
                }, completion: { (finished) in
                    if finished {
                        
                        
                        
                        
                        let collectionViewContentHeight = self.collectionView.contentSize.height;
                        let collectionViewFrameHeightAfterInserts = self.collectionView.frame.size.height - (self.collectionView.contentInset.top + self.collectionView.contentInset.bottom);
                        
                        
                        if(collectionViewContentHeight > collectionViewFrameHeightAfterInserts) {
                            
                            //   self.collectionView.setContentOffset(CGPointMake(0, self.collectionView.contentSize.height - self.collectionView.frame.size.height), animated: true)
                            //
                            
                        }
                    }
            })
           
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 1 {
        
            let cell = self.collectionView.dequeueReusableCellWithReuseIdentifier("RemindMeCell", forIndexPath:     indexPath) as! RemindMeCell
            print(self.basket.bNotif!)
            if self.basket.bNotif == 1{
            
                cell.configureCell(true , _basketDetailVC: self)
            
            }else{
            
                cell.configureCell(false , _basketDetailVC: self)
            
            }
            
            return cell
        }
        
        if indexPath.row == 0 {
            
            let cell = self.collectionView.dequeueReusableCellWithReuseIdentifier("BasketDescCell", forIndexPath:     indexPath) as! BasketDescCell
            cell.configureCell()
            return cell
            
        }
        
        if indexPath.row == 2 {
            
            let cell = self.collectionView.dequeueReusableCellWithReuseIdentifier("BasketDateCell", forIndexPath: indexPath) as! BasketDateCell
                cell.configureCell()
            return cell
            
        }
        
        return UICollectionViewCell()
        
    
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        switch kind {
        case IOStickyHeaderParallaxHeader:
            let cell = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "header", forIndexPath: indexPath) as! BasketDetailHeaderCell
            
            if basket.bImage != nil{
                            cell.configureCell(self.basket.bName!, image: FileManager().readImageFromFile(self.basket.bImage!))
                        }else{
                            cell.configureCell(self.basket.bName!, image: UIImage(named: "GroceryTemp3")!)
                        }
            
            return cell
        default:
            assert(false, "Unexpected element kind")
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSizeMake(UIScreen.mainScreen().bounds.size.width, 150);
        }
        
        if indexPath.row == 1 {
            
            return CGSizeMake(UIScreen.mainScreen().bounds.size.width - 16, 80);

            
        }
        
        if indexPath.row == 2 {
            
            if dateNotifIsOn {
               

        
                return CGSizeMake(UIScreen.mainScreen().bounds.size.width, 300);

            }else{
                
                return CGSizeMake(UIScreen.mainScreen().bounds.size.width, 0);
                
            }
            
        }
        
        return CGSizeMake(UIScreen.mainScreen().bounds.size.width, 300);
    }

    
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        cell.layer.borderWidth = 1.0
        cell.layer.cornerRadius = 4.0
        cell.layer.shadowOffset = CGSize(width: 2, height: 2)
        cell.layer.shadowOpacity = 0.8
        
        cell.layer.shadowRadius = 2
        cell.layer.shadowColor = UIColor.darkGrayColor().CGColor
        cell.layer.borderColor = UIColor.whiteColor().CGColor
        
    }

    
    @IBAction func deleteBasket(sender: AnyObject) {
        
//        let person = result[0] as! NSManagedObject
        
        moContext.deleteObject(basket)
        UserModelManager.sharedInstance._basketInfo.removeAtIndex(UserModelManager.sharedInstance._basketInfo.indexOf(basket)!)
        
        do {
            try moContext.save()
        } catch {
            let saveError = error as NSError
            print(saveError)
        }

        self.navigationController?.popViewControllerAnimated(true)

    }
    
    func notifSwitchChangedValue() {
        
        if basket.bNotif == 0 {
            basket.bNotif = 1
        }else{
            basket.bNotif = 0
        }
        
        UIView.animateWithDuration(0.25, animations: { 
            if self.dateNotifIsOn {
                
               // self.collectionView.setContentOffset(CGPointMake(0, 100), animated: true)
               // self.collectionView.scrollToItemAtIndexPath(self.collectionView.indexPathForItemAtPoint(CGPoint(x: 0, y: 0))!, atScrollPosition: UICollectionViewScrollPosition.Top, animated: true)
                
            }
            
            }) { (finished) in
                if finished{
                    self.collectionView.performBatchUpdates({
                        
                        
                        
                        self.dateNotifIsOn = !self.dateNotifIsOn
                        self.collectionView.reloadData()
                        
                        //cell.frame.size.height = size.height
                        
                        
                        }, completion: { (finished) in
                            if finished {
                                
                                
                                
                                
                                let collectionViewContentHeight = self.collectionView.contentSize.height;
                                let collectionViewFrameHeightAfterInserts = self.collectionView.frame.size.height - (self.collectionView.contentInset.top + self.collectionView.contentInset.bottom);
                                
                                
                                if((collectionViewContentHeight > collectionViewFrameHeightAfterInserts) && self.dateNotifIsOn) {
                                    
                                    self.collectionView.setContentOffset(CGPointMake(0, self.collectionView.contentSize.height - self.collectionView.frame.size.height), animated: true)
                                    
                                    
                                }
                            }
                    })
                }
        }
        
        
        
       
        
        
        
    }
    
    @IBAction func editInfo(sender: AnyObject) {
        
        UserModelManager.sharedInstance._basketInfo[UserModelManager.sharedInstance._basketInfo.indexOf(basket)!] = self.basket
        
        do {
            try moContext.save()
        } catch {
            let saveError = error as NSError
            print(saveError)
        }

        
        
        
    }
    
    
    
    
    
    
    
    
    
    
}
