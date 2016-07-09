//
//  MainPageVC.swift
//  SanatSharif
//
//  Created by CyrusREfahi on 4/13/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//


import UIKit
import AVFoundation

class MainPageVC: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate  {
    
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var ButtonSCrolingView : UIView!
    @IBOutlet weak var menuBTN: UIBarButtonItem!
    var scrollView: UIScrollView!
    var stackView: UIStackView!
    private var titleClicked : [String] = []
    private var BtnClicked = false
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        
        
        if self.revealViewController() != nil{
            
            menuBTN.target = self.revealViewController()
            menuBTN.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        setupScrollingBTN()
    
    }
    
    
    
    func setupScrollingBTN(){
        
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        ButtonSCrolingView.addSubview(scrollView)
        
        ButtonSCrolingView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[scrollView]|", options: .AlignAllCenterX, metrics: nil, views: ["scrollView": scrollView]))
        ButtonSCrolingView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[scrollView]|", options: .AlignAllCenterX, metrics: nil, views: ["scrollView": scrollView]))
        
        
        stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .Horizontal
        stackView.alignment = .Fill
        stackView.distribution = .EqualSpacing
        stackView.spacing = 10
        

        scrollView.addSubview(stackView)
        
        scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[stackView]|", options: NSLayoutFormatOptions.AlignAllCenterX, metrics: nil, views: ["stackView": stackView]))
        scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[stackView]", options: NSLayoutFormatOptions.AlignAllCenterX, metrics: nil, views: ["stackView": stackView]))
        
        let margins = ButtonSCrolingView.layoutMarginsGuide
        stackView.topAnchor.constraintEqualToAnchor(margins.topAnchor, constant: 1).active = true
        var i : Int = 0
        for _ in 1 ..< 100 {
            i++
            let vw = UIButton(type: UIButtonType.System)
            let widthConstraint = NSLayoutConstraint(item: vw, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 100)
            vw.addConstraint(widthConstraint)

            vw.backgroundColor = UIColor.clearColor()
            vw.layer.cornerRadius = 15
            vw.layer.borderWidth =  0.4
            vw.layer.borderColor = UIColor.grayColor().CGColor
            vw.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
            vw.setTitle(String(i), forState: .Normal)
            vw.addTarget(self, action: "slideButtonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
            vw.backgroundColor = UIColor(red: 237 / 255.0, green: 237 / 255.0, blue: 237 / 255.0, alpha: 1)
            stackView.addArrangedSubview(vw)
        }
        
    }
    
    func slideButtonClicked(sender : UIButton!){
        

        
        if titleClicked.contains((sender.titleLabel?.text)!){
            titleClicked.removeAtIndex(titleClicked.indexOf((sender.titleLabel?.text)!)!)
            sender.backgroundColor = UIColor.whiteColor()
            sender.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
            print(titleClicked)
            BtnClicked = false
        }else {
            titleClicked.append((sender.titleLabel?.text)!)
            sender.backgroundColor = UIColor(red: 48 / 255.0, green: 185 / 255.0, blue: 82 / 255.0, alpha: 1)
            sender.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            BtnClicked = true
            print(titleClicked)
        }
       
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = CGSize(width: stackView.frame.width, height: stackView.frame.height)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FoodCell", forIndexPath: indexPath) as? MainPageFoodCell {
            
            
            //here we use product to create cell
            
            cell.configureCell("۲۰۰۰", foodName: "گوجه و پیاز  ", foodImageName: "  ")
            return cell
            
        } else {
            return UICollectionViewCell()
        }
        
        
    }
 
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(170   , 250)
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        //count of products
        
        return 8
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    
        //here is a test functionality
        
        let product = Product(id: 0, name: "پیاز جعفری", price: 0, expDate: 0)
        performSegueWithIdentifier("showDetails", sender: product)
    
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetails" {
            if let productDetailVC = segue.destinationViewController as? ProductDetailVC {
                if let product = sender as? Product {
                    productDetailVC.product = product
                }
            }
        }
    }
    
    
    
    
    
    
    
    
    

}
