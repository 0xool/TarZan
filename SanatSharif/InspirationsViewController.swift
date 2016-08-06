//
//  InspirationsViewController.swift
//  RWDevCon
//
//  Created by Mic Pringle on 02/03/2015.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit
import DKCamera
import CoreData
import RZTransitions

class InspirationsViewController: UIViewController  , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout , UITextFieldDelegate , UITextViewDelegate  {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var AddImageBtn: UIButton!
  
    @IBOutlet weak var BasketName: UITextField!
    @IBOutlet weak var addBasketView: MediumWindowViewMaterial!
    
    
    @IBOutlet weak var personName: UITextField!
    @IBOutlet weak var _description: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var addNewBasketBtn: UIBarButtonItem!
    
    let moContext = UserModelManager.sharedInstance._dataControler.managedObjectContext
    
    
    var imageSet :  Bool = false
    let colors = UIColor.palette()
    var saveImage : UIImage!
    
    
    
    var fullScreenCellIndexPaths : [NSIndexPath] = [NSIndexPath]()
  
  override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return UIStatusBarStyle.LightContent
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.BasketName.delegate = self
    self.personName.delegate = self
    self._description.delegate = self
    
   
    
    
    
    NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(InspirationsViewController.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
    NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(InspirationsViewController.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
    
   
    
    fetch()
    
    datePicker.calendar = NSCalendar(identifier: NSCalendarIdentifierPersian)
    datePicker.locale = NSLocale(localeIdentifier: "fa_IR")
    
    
        
    
    
    
    if let patternImage = UIImage(named: "Pattern") {
      view.backgroundColor = UIColor(patternImage: patternImage)
    }
    collectionView.delegate = self
    collectionView.dataSource = self
    
    self.collectionView!.backgroundColor = UIColor.clearColor()
    
//    let layout = collectionViewLayout as! UICollectionViewFlowLayout
//    layout.itemSize = CGSize(width: CGRectGetWidth(collectionView!.bounds), height: 100)
  }
    
    override func viewDidAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false
        self.collectionView.reloadData()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    
    
    @IBAction func addImageBtnClicked(sender: AnyObject) {
    
        
        let camera = DKCamera()
        
        camera.didCancel = { () in
            
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        camera.didFinishCapturingImage = {(image: UIImage) in
            
                self.AddImageBtn.setImage(image, forState:  .Normal)
                self.imageSet = true
                self.saveImage = image
            
            
            
            
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        self.presentViewController(camera, animated: true, completion: nil)
        
        
        //let croppingEnabled = true
        //let cameraViewController = CameraViewController(croppingEnabled: croppingEnabled) { image in
            // Do something with your image here.
            // If cropping is enabled this image will be the cropped version
            
          //  self.dismissViewControllerAnimated(true, completion: nil)
        //}
        
        //presentViewController(cameraViewController, animated: true, completion: nil)
    
    
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    @IBAction func addBasketBtnClicked(sender: AnyObject) {
        
        var formNotCompleted : Bool = false
        let basketEntity = NSEntityDescription.insertNewObjectForEntityForName("Basket", inManagedObjectContext: moContext) as! Basket
        
        if self.BasketName.text != nil && self.BasketName.text != "" {
            
            basketEntity.setValue(self.BasketName.text, forKey: "bName")
            
        }else{
            
            formNotCompleted = true
            
        }
        
        if self._description.text != nil && self._description.text != "" {
            
            
            basketEntity.setValue(self._description.text, forKey: "bDiscription")
            
        }else{
            
           formNotCompleted = true
            
        }
        
        
        if self.imageSet {
            
            let imageData = UIImageJPEGRepresentation(saveImage, 1)
            basketEntity.setValue(imageData, forKey: "bImage")
            
            
        }else{
            
            formNotCompleted = true
            
        }
        
        
        basketEntity.bDate = datePicker.date
        basketEntity.bNotif = true
       
        if !formNotCompleted {
        
        do {
            try moContext.save()
            
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        
    
        UIView.animateWithDuration(0.25, animations: {
            
            
            self.addBasketView.alpha = 0
            
        }) { (finished) in
            if finished {
                
                if basketEntity.bImage != nil {
                    let image = UIImage(data: basketEntity.bImage!)!
                    UserModelManager.sharedInstance._basketInfoImages.append(image.decompressedImage)
                }else{
                    UserModelManager.sharedInstance._basketInfoImages.append(UIImage())
                }
                
                UserModelManager.sharedInstance._basketInfo.append(basketEntity)
                self.collectionView.reloadData()
                self.addBasketView.hidden = true
                self.collectionView.userInteractionEnabled = true
                self.navigationController?.navigationBar.userInteractionEnabled = true
            }
        }
            
        }else{
            
            
            
        }
        
        
    }
    
    func fetch() {
        
        let userfetch = NSFetchRequest(entityName: "Basket")
        
        
        do {
            let fetchedEntity = try moContext.executeFetchRequest(userfetch) as! [Basket]
            for b in fetchedEntity {
                
                print("================================================\(b.bImage)")
                if b.bImage != nil{
                    let image = UIImage(data: b.bImage!)!
                    UserModelManager.sharedInstance._basketInfoImages.append(image.decompressedImage)
                }else{
                    UserModelManager.sharedInstance._basketInfoImages.append(UIImage())
                }
                
                UserModelManager.sharedInstance._basketInfo.append(b)
                
            }
        }catch {
            
        }
        
        
        self.collectionView.reloadData()
    }
    
    @IBAction func goBackToView(sender: AnyObject) {
   
        UIView.animateWithDuration(0.25, animations: {
            
            
            self.addBasketView.alpha = 0
            
        }) { (finished) in
            if finished {
                
                self.addBasketView.hidden = true
                self.collectionView.userInteractionEnabled = true
                self.navigationController?.navigationBar.userInteractionEnabled = true
            }
        }
        
    
    }
    
  
    
    @IBAction func addNewBasket(sender: AnyObject) {
        
        UIView.animateWithDuration(0.25, animations: {
            
            self.addBasketView.hidden = false
            self.addBasketView.alpha = 1
            
            }) { (finished) in
                if finished {
                    
                    self.collectionView.userInteractionEnabled = false
                    self.navigationController?.navigationBar.userInteractionEnabled = false
                }
        }
        
        
        
        
    }
    
    
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
   
     func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return UserModelManager.sharedInstance._basketInfo.count
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        
        if self.fullScreenCellIndexPaths.contains(indexPath) {
                return CGSize(width: UIScreen.mainScreen().bounds.width , height: UIScreen.mainScreen().bounds.height)
        }
        
        return CGSize(width: UIScreen.mainScreen().bounds.width , height: 280)
        
        
        
    
    
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        
        
        
        //        self.collectionView.setContentOffset(CGPoint(x : UIScreen.mainScreen().bounds.maxX , y : UIScreen.mainScreen().bounds.maxX), animated: true)
        let basketTemp = UserModelManager.sharedInstance._basketInfo[indexPath.row]
        
        performSegueWithIdentifier("basketDetailVC", sender: basketTemp)
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {

        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("BasketToBuyCell", forIndexPath: indexPath) as? BasketToBuyCell {
        
            let basket = UserModelManager.sharedInstance._basketInfo[indexPath.row]

        
            if basket.bImage != nil {
                
                
                
                cell.configureCell( UserModelManager.sharedInstance._basketInfoImages[indexPath.row] , title: basket.bName! , date: basket.bDate! , personName : "Cyrus" )
            }else{
                cell.configureCell(UIImage(named: "GroceryTemp3")! , title: basket.bName! , date: basket.bDate! , personName : "Cyrus")
            }
        
        
        //cell.contentView.backgroundColor = colors[indexPath.item]
            return cell
            
        }else{
            
            return UICollectionViewCell()
            
        }
    }
    
    func keyboardWillShow(notification: NSNotification) {
        
        if ((notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue()) != nil {
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
        if segue.identifier == "basketDetailVC" {
            if let basketDetailVC = segue.destinationViewController as? basketDetailVC {
                if let _basket = sender as? Basket {
                    basketDetailVC.basket = _basket
                }
            }
        }
    }

}

