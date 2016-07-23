//
//  InspirationsViewController.swift
//  RWDevCon
//
//  Created by Mic Pringle on 02/03/2015.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit
import ALCameraViewController
import CoreData


class InspirationsViewController: UIViewController  , UICollectionViewDelegate , UICollectionViewDataSource {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var AddImageBtn: UIButton!
  
    @IBOutlet weak var BasketName: UITextField!
    @IBOutlet weak var addBasketView: MediumWindowViewMaterial!
    
    
    @IBOutlet weak var personName: UITextField!
    @IBOutlet weak var _description: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var addNewBasketBtn: UIBarButtonItem!
    
    let moContext = DataController().managedObjectContext
    
    var imageSet :  Bool = false
    let colors = UIColor.palette()
    var saveImage : UIImage!
    var basketInfo : [Basket] = [Basket]()
    var basketInfoImages : [UIImage] = [UIImage]()
  
  override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return UIStatusBarStyle.LightContent
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
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
    
    
    @IBAction func addImageBtnClicked(sender: AnyObject) {
    
        let croppingEnabled = true
        let cameraViewController = CameraViewController(croppingEnabled: croppingEnabled) { image in
            // Do something with your image here.
            // If cropping is enabled this image will be the cropped version
            if image.0 != nil {
                self.AddImageBtn.setImage(image.0, forState:  .Normal)
                self.imageSet = true
                self.saveImage = image.0
            }
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        presentViewController(cameraViewController, animated: true, completion: nil)
    
    
    }
    
    
    @IBAction func addBasketBtnClicked(sender: AnyObject) {
        
        let basketEntity = NSEntityDescription.insertNewObjectForEntityForName("Basket", inManagedObjectContext: moContext) as! Basket
        
        if self.BasketName.text != nil && self.BasketName.text != "" {
            
            basketEntity.setValue(self.BasketName.text, forKey: "bName")
            
        }else{
            
        }
        
        if self._description.text != nil && self._description.text != "" {
            
            
            basketEntity.setValue(self.BasketName.text, forKey: "bDiscription")
            
        }else{
            
            
            
        }
        
        
        if self.imageSet {
            
            let imageData = UIImageJPEGRepresentation(saveImage, 1)
            basketEntity.setValue(imageData, forKey: "bImage")
            
            
        }else{
            
        }
        
        
        basketEntity.bDate = datePicker.date
        
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
                    self.basketInfoImages.append(image.decompressedImage)
                }else{
                    self.basketInfoImages.append(UIImage())
                }
                
                self.basketInfo.append(basketEntity)
                self.collectionView.reloadData()
                self.addBasketView.hidden = true
                self.collectionView.userInteractionEnabled = true
                self.navigationController?.navigationBar.userInteractionEnabled = true
            }
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
                    self.basketInfoImages.append(image.decompressedImage)
                }else{
                    self.basketInfoImages.append(UIImage())
                }
                
                basketInfo.append(b)
                print(basketInfo.count)
            }
        }catch {
            print("FUCK YOU")
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
        return basketInfo.count
    }
    
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {

        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("BasketToBuyCell", forIndexPath: indexPath) as? BasketToBuyCell {
        
            let basket = basketInfo[indexPath.row]

        
            if basket.bImage != nil {
                
                
                
                cell.configureCell(basketInfoImages[indexPath.row] , title: basket.bName! , date: basket.bDate! , personName : "Cyrus" )
            }else{
                cell.configureCell(UIImage(named: "GroceryTemp3")! , title: basket.bName! , date: basket.bDate! , personName : "Cyrus")
            }
        
        
        //cell.contentView.backgroundColor = colors[indexPath.item]
            return cell
            
        }else{
            
            return UICollectionViewCell()
            
        }
    }

}

