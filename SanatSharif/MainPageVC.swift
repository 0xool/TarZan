//
//  MainPageVC.swift
//  SanatSharif
//
//  Created by CyrusREfahi on 4/13/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//


import UIKit
import AVFoundation

class MainPageVC: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate , UICollectionViewDelegateFlowLayout ,  SWRevealViewControllerDelegate  {
    
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var ButtonSCrolingView : UIView!
    @IBOutlet weak var menuBTN: UIBarButtonItem!
    
    var scrollView: UIScrollView!
    var stackView: UIStackView!
    
    private var titleClicked : [String] = []
    private var BtnClicked = false
    private var sidebarMenuOpen : Bool = false
    private var inSearchMode : Bool = false
    
    var searchList : [String] = [String]()
    var filterSlidesClicked : [String] = [String]()
    var Products : [Product]! = [Product]()
    
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    var filteredProducts : [Product]! = [Product]()
    
    
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        
        
        
        sidebarMenuOpen = false
        self.revealViewController().delegate = self
        
        //test variables
        searchList.append("مرغ");
        searchList.append("گوشت");
        searchList.append("میوه");
        searchList.append("سبزی");
        searchList.append("نوشیدنی");
        searchList.append("شیرینی");
        
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
        for items in searchList {
            i++
            let vw = UIButton(type: UIButtonType.System)
            let widthConstraint = NSLayoutConstraint(item: vw, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 100)
            vw.addConstraint(widthConstraint)

            vw.backgroundColor = UIColor.clearColor()
            vw.layer.cornerRadius = 15
            vw.layer.borderWidth =  0.4
            vw.layer.borderColor = UIColor.grayColor().CGColor
            vw.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
            vw.setTitle(String(items), forState: .Normal)
            vw.addTarget(self, action: "slideButtonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
            vw.backgroundColor = UIColor(red: 237 / 255.0, green: 237 / 255.0, blue: 237 / 255.0, alpha: 1)
            stackView.addArrangedSubview(vw)
        }
        
    }
    
    func slideButtonClicked(sender : UIButton!){
        

        
        if titleClicked.contains((sender.titleLabel?.text)!){
            titleClicked.removeAtIndex(titleClicked.indexOf((sender.titleLabel?.text)!)!)
            sender.backgroundColor = UIColor(red: 237 / 255.0, green: 237 / 255.0, blue: 237 / 255.0, alpha: 1)
            sender.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
            BtnClicked = false
            if(filterSlidesClicked.contains((sender.titleLabel?.text)!)){
                filterSlidesClicked.removeAtIndex(filterSlidesClicked.indexOf((sender.titleLabel?.text)!)!)
            }
            
        }else {
            titleClicked.append((sender.titleLabel?.text)!)
            sender.backgroundColor = UIColor(red: 48 / 255.0, green: 185 / 255.0, blue: 82 / 255.0, alpha: 1)
            sender.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            BtnClicked = true
            filterSlidesClicked.append((sender.titleLabel?.text)!)
        }
        
        if filterSlidesClicked.count != 0 {
            
            inSearchMode = true
            
            
        }
        
        if filterSlidesClicked.count == 0 {
            
            inSearchMode = false
            
        }
        
        collection.reloadData()
       
    }
    
    func filterTableByTags(){
        
        
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = CGSize(width: stackView.frame.width, height: stackView.frame.height)
    }
    
    //test function for showing
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if(indexPath.row == 6){
            if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("BannerCell", forIndexPath: indexPath) as? BannerCell {
                if(inSearchMode){
                    cell.configureCell("FilteredBanner")
                }else{
                    
                    cell.configureCell("Simple Banner")
                }
                return cell
                
            } else {
                return UICollectionViewCell()
            }
            
        }
        
        if(indexPath.row == 4){
            
            if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ImageCell", forIndexPath: indexPath) as? ImageCell {
                if(inSearchMode){
                    cell.configureCell("FoodImageTemp")
                }else{
                    cell.configureCell("FoodImageTemp")

                }
                return cell
                
            } else {
                return UICollectionViewCell()
            }
            
            
        }
        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FoodCell", forIndexPath: indexPath) as? MainPageFoodCell {
            if(inSearchMode){
                    cell.configureCell("۲۰۰۰", foodName: "گوجه و پیاز  ", foodImageName: "  ")
                }else{
                
                    cell.configureCell("۲۰۰۰", foodName: "گوجه و پیاز  ", foodImageName: "  ")
                }
                return cell
            
            } else {
                return UICollectionViewCell()
            }
        }
        
        

   /* func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        
        
        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("BannerCell", forIndexPath: indexPath) as? BannerCell {
         
            
            
            return cell
            
        } else {
            return UICollectionViewCell()
        }
    
    
        
        
        
    }*/
    
    
    
 
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        if(indexPath.row == 6){
            return CGSizeMake(screenSize.width , 125)
        }
        
        return CGSizeMake(screenSize.width * 0.45   , 250)
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        //count of products
        if inSearchMode{
            
            return filteredProducts.count
            
        }else{
        return 8
        }

    }
    

    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    
        //here is a test functionality
        
        if(indexPath.row != 6){
        
            if(!sidebarMenuOpen){
                let product = Product(id: 0, name: "پیاز جعفری", price: 0, expDate: 0)
                performSegueWithIdentifier("showDetails", sender: product)
            }else{
            
            
            }
        }
    
    }
    
    
    
    
    func revealController(revealController: SWRevealViewController!,  willMoveToPosition position: FrontViewPosition){
        if(position == FrontViewPosition.Left) {
            // self.view.userInteractionEnabled = true
            sidebarMenuOpen = false
        } else {
            // self.view.userInteractionEnabled = false
            sidebarMenuOpen = true
        }
    }
    
    func revealController(revealController: SWRevealViewController!,  didMoveToPosition position: FrontViewPosition){
        if(position == FrontViewPosition.Left) {
            // self.view.userInteractionEnabled = true
            sidebarMenuOpen = false
        } else {
            // self.view.userInteractionEnabled = false
            sidebarMenuOpen = true
        }
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
