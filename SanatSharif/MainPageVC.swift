//
//  MainPageVC.swift
//  SanatSharif
//
//  Created by CyrusREfahi on 4/13/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//


import UIKit
import AVFoundation
import ImageSlideshow
import DynamicBlurView
import SABlurImageView

class MainPageVC: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate , UICollectionViewDelegateFlowLayout ,  UITableViewDelegate , UITableViewDataSource  , SWRevealViewControllerDelegate  {
    
    @IBOutlet weak var SliderPriceTag : UILabel!
    @IBOutlet weak var PriceSlider: UISlider!
    @IBOutlet weak var PriceSearchViewHeight: NSLayoutConstraint!
    @IBOutlet weak var PriceSearchView: UIView!
   
    @IBOutlet weak var topImageScroller: ImageSlideshow!
    @IBOutlet weak var RecentSearchTable: UITableView!
    @IBOutlet weak var NavigationBar: UINavigationItem!
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var ButtonSCrolingView : UIView!
    @IBOutlet weak var menuBTN: UIBarButtonItem!
    
    @IBOutlet weak var ExpandingHeight: NSLayoutConstraint!
    @IBOutlet weak var HeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var topImageHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var TopImage: UIImageView!
    
    @IBOutlet weak var ForceTouchView: UIView!
    @IBOutlet weak var MainView: UIView!
    @IBOutlet weak var searchBarView: UIView!
    
    @IBOutlet weak var SearchBar: UISearchBar!
    @IBOutlet weak var SearchBarStackView: UIStackView!
    @IBOutlet weak var dragView: UIView!
    
    @IBOutlet weak var graphView : UIView!
    @IBOutlet weak var searchContainerView: UIView!
    
    
    var scrollView: UIScrollView!
    var stackView: UIStackView!
    var lastScrolingOffset : CGFloat! = 0
    
    private var titleClicked : String!
    private var BtnClicked = false
    private var sidebarMenuOpen : Bool = false
    private var inSearchMode : Bool = false
    
    var searchList : [String] = [String]()
    var filterSlidesClicked : [String] = [String]()
    var Products : [Product]! = [Product]()
    
    
    var scrollContentSizeHeight : CGFloat!
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    var filteredProducts : [Product]! = [Product]()
    
    var animateNotDone : [Bool]! = [Bool]()
    var tabBarAnimationonGoing : Bool = false
    var isInSearchMode : Bool = false
    
    var force : CGFloat!
    var sliderButtons : [UIButton]! = [UIButton]()
    var prices : [Int] = [Int]()
    
    var transitionDelegate: ZoomAnimatedTransitioningDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        RecentSearchTable.delegate =  self
        RecentSearchTable.dataSource =  self
        SearchBar.delegate = self
        
        self.PriceSearchView.hidden = true
        self.PriceSearchViewHeight.constant = 0
        prices.append(1000)
        prices.append(10000)
        prices.append(100000)
        prices.append(1000000)
        prices.append(10000000)
        
        self.SliderPriceTag.text = "قیمت تا: \(String(self.prices[0]))"
        
        self.SearchBarStackView.hidden = true
        self.SearchBarStackView.transform = CGAffineTransformMakeTranslation(0, -1000)
        
        
        
        
        self.searchContainerView.transform = CGAffineTransformMakeTranslation(0, -1000)
        
        self.SearchBar.barTintColor = UIColor(red: 182 / 255, green: 194 / 255, blue: 150 / 255, alpha: 0.1)
//        self.SearchBar.backgroundImage = UIImage()
        self.SearchBar.translucent = true
        self.RecentSearchTable.backgroundColor = UIColor.clearColor()
        self.RecentSearchTable.alpha = 0;
        
        //for only once animation for each cell any cell added need an append true for that cell the rest are false so it wont change anythin any cell seen will not animate
        for _ in 1...9{
            animateNotDone.append(true)
        }
        
        sidebarMenuOpen = false
        self.revealViewController().delegate = self
        
        //test variables
        searchList.append("جستجو");
        searchList.append("گوشت");
        searchList.append("میوه");
        searchList.append("سبزی");
        searchList.append("نوشیدنی");
        searchList.append("شیرینی");
         setupScrollingBTN()
        
        if self.revealViewController() != nil{
            
            menuBTN.target = self.revealViewController()
            menuBTN.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }

        topImageScroller.contentScaleMode = .ScaleAspectFill
        topImageScroller.draggingEnabled = true
        topImageScroller.slideshowInterval = 5
        topImageScroller.userInteractionEnabled = false
        
        topImageScroller.setImageInputs([ImageSource(imageString: "FoodImageTemp")!, ImageSource(imageString: "GroceryTemp1")!, ImageSource(imageString: "GroceryTemp2")!, ImageSource(imageString: "GroceryTemp3")!])
        
//        topImageScroller.setImageInputs([AlamofireSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!, AlamofireSource(urlString: "https://images.unsplash.com/photo-1447746249824-4be4e1b76d66?w=1080")!, AlamofireSource(urlString: "https://images.unsplash.com/photo-1463595373836-6e0b0a8ee322?w=1080")!])
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(click))
        topImageScroller.addGestureRecognizer(recognizer)
        
        
        let longpress = UILongPressGestureRecognizer(target: self, action: #selector(MainPageVC.longPressGestureRecognized(_:)))
        collection.addGestureRecognizer(longpress)
        

    }
    
    override func viewDidAppear(animated: Bool) {
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
    func click() {
        let ctr = FullScreenSlideshowViewController()
        ctr.pageSelected = {(page: Int) in
            self.topImageScroller.setScrollViewPage(page, animated: false)
        }
        
        ctr.initialImageIndex = topImageScroller.scrollViewPage
        ctr.inputs = topImageScroller.images
        self.transitionDelegate = ZoomAnimatedTransitioningDelegate(slideshowView: topImageScroller, slideshowController: ctr)
        // Uncomment if you want disable the slide-to-dismiss feature
        // self.transitionDelegate?.slideToDismissEnabled = false
        ctr.transitioningDelegate = self.transitionDelegate
        self.presentViewController(ctr, animated: true, completion: nil)
    }
//=======================================================================================================
//Summary : in this section the buttonslider is implemented each button comes from server side and each has a bran new list for main page to show(search implementation of filtering the collectionView are connected to here )
//Implementation :
//=======================================================================================================
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
        scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[stackView]", options: NSLayoutFormatOptions.AlignAllLeading, metrics: nil, views: ["stackView": stackView]))
        
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        
       let margins = ButtonSCrolingView.layoutMarginsGuide
        stackView.topAnchor.constraintEqualToAnchor(margins.topAnchor, constant: 1).active = true

        var i : Int = 0
        for items in searchList {
            i += 1
            let vw = UIButton(type: UIButtonType.System)
            let widthConstraint = NSLayoutConstraint(item: vw, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 100)
            vw.addConstraint(widthConstraint)

            vw.backgroundColor = UIColor.clearColor()
            vw.layer.cornerRadius = 10
            vw.layer.borderWidth =  0.4
            
            vw.layer.borderColor = UIColor.grayColor().CGColor
            vw.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
            vw.setTitle(String(items), forState: .Normal)
            
            vw.addTarget(self, action: #selector(MainPageVC.slideButtonClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            vw.backgroundColor = UIColor(red: 237 / 255.0, green: 237 / 255.0, blue: 237 / 255.0, alpha: 1)
            sliderButtons.append(vw)
            stackView.addArrangedSubview(vw)
        }
        
    }
    
    func resetAllSliderButtonColor(){
        
        for button in sliderButtons{
            
            button.backgroundColor = UIColor(red: 237 / 255.0, green: 237 / 255.0, blue: 237 / 255.0, alpha: 1)
            button.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
            
        }
        
    }

    func slideButtonClicked(sender : UIButton!){

        resetAllSliderButtonColor()
        if titleClicked != sender.titleLabel?.text{
            titleClicked = sender.titleLabel?.text
            sender.backgroundColor = UIColor(red: 48 / 255.0, green: 185 / 255.0, blue: 82 / 255.0, alpha: 1)
            sender.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        }else{
            
            titleClicked = ""
        }
        
        slideBtnClickedHandler(titleClicked)
        //BtnClicked = true
        //filterSlidesClicked.append((sender.titleLabel?.text)!)
        
        
        
//        if titleClicked.contains((sender.titleLabel?.text)!){
//            titleClicked.removeAtIndex(titleClicked.indexOf((sender.titleLabel?.text)!)!)
//            sender.backgroundColor = UIColor(red: 237 / 255.0, green: 237 / 255.0, blue: 237 / 255.0, alpha: 1)
//            sender.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
//            BtnClicked = false
//            if(filterSlidesClicked.contains((sender.titleLabel?.text)!)){
//                filterSlidesClicked.removeAtIndex(filterSlidesClicked.indexOf((sender.titleLabel?.text)!)!)
//            }
//            
//        }else {
//            titleClicked.append((sender.titleLabel?.text)!)
//            sender.backgroundColor = UIColor(red: 48 / 255.0, green: 185 / 255.0, blue: 82 / 255.0, alpha: 1)
//            sender.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
//            BtnClicked = true
//            filterSlidesClicked.append((sender.titleLabel?.text)!)
//        }
//        
//        if filterSlidesClicked.count != 0 {
//            
//            inSearchMode = true
//        
//        }
//        
//        if filterSlidesClicked.count == 0 {
//            
//            inSearchMode = false
//            
//        }
//        
        collection.reloadData()
       
    }
    
    func slideBtnClickedHandler(let slideName : String){
        
        if(slideName == ""){
            
            
        }
        
        if(slideName == "جستجو"){
            
            self.PriceSearchView.hidden = false
            UIView.animateWithDuration(0.25, animations: { () -> Void in
            
                self.PriceSearchViewHeight.constant = 35
    
                
                
                }, completion: { (finished) -> Void in
                    if finished {
                       
                        
                    }
            })
        }
        
        if(slideName != "جستجو"){
            
            UIView.animateWithDuration(0.25, animations: { () -> Void in
                
                self.PriceSearchViewHeight.constant = 35
                
                
                
                }, completion: { (finished) -> Void in
                    if finished {
                        
                        self.PriceSearchView.hidden = true
                        
                    }
            })
            
        }
    }
    
    func filterTableByTags(){
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = CGSize(width: stackView.frame.width, height: stackView.frame.height)
    }
    
//=======================================================================================================
//Summary : here we have implemented the animation efect for loading each cell in collectionView for some beuty (these functions are utilities)
//Implementation :
//=======================================================================================================
func animateColllection(){
        
        collection.reloadData()
        
        let cells = collection.visibleCells()
        let collectionHeight : CGFloat = collection.bounds.size.height
        
        for c in cells{
            
            let cell : UICollectionViewCell = c as UICollectionViewCell
            cell.transform = CGAffineTransformMakeTranslation(0, collectionHeight)
            
        }
        
        var index = 0
        
        for a in cells {
            
            let cell : UICollectionViewCell = a as UICollectionViewCell
            UIView.animateWithDuration(0.25, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
                
                cell.transform = CGAffineTransformMakeTranslation(0, 0)
                
                }, completion: nil)
            
            index += 1
        }
        
        
    }
    
    func animateSingleCell(cell : UICollectionViewCell , index : Int){
        
        let collectionHeight : CGFloat = collection.bounds.size.height
        cell.transform = CGAffineTransformMakeTranslation(0, collectionHeight + 400)
        cell.transform = CGAffineTransformMakeScale(0.5, 0.5)
        
        UIView.animateWithDuration(0.25, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
            
            cell.transform = CGAffineTransformMakeTranslation(0, 0)
            cell.transform = CGAffineTransformMakeScale(1, 1)
            cell.alpha = 1
            
            
            }, completion: nil)
        
    }
//=======================================================================================================
//Summary : Here we implement the collectionView cell creaton we have 3 types of prototype cells each containing their own properties
//Implementation :
//=======================================================================================================
    //test function for showing
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if(indexPath.row == 6){
            if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("BannerCell", forIndexPath: indexPath) as? BannerCell {
                    
                    cell.configureCell("Simple Banner")
                
                
                if(animateNotDone[indexPath.row]){
                    animateSingleCell(cell, index: indexPath.row)
                    animateNotDone[indexPath.row] = false
                }
                
                return cell
                
            } else {
                return UICollectionViewCell()
            }
            
        }
        
        if(indexPath.row == 4){
            
            if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ImageCell", forIndexPath: indexPath) as? ImageCell {
                
                cell.configureCell("FoodImageTemp")
                
                if(animateNotDone[indexPath.row]){
                    cell.alpha = 0
                    animateSingleCell(cell, index: indexPath.row)
                    animateNotDone[indexPath.row] = false
                }
                
                return cell
                
            } else {
                return UICollectionViewCell()
            }
            
            
        }
        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FoodCell", forIndexPath: indexPath) as? MainPageFoodCell {
    
            cell.configureCell("۲۰۰۰", foodName: "گوجه و پیاز  ", foodImageName: "  ")
            
            if(animateNotDone[indexPath.row]){
                animateSingleCell(cell, index: indexPath.row)
                animateNotDone[indexPath.row] = false
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
//=======================================================================================================
//Summary : Here we implement the shrink efect of top slider animation when above a certain y axis in collectionview menu pops out and when under a certain y axis menu shrinks
//Implementation :
//=======================================================================================================
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
    if(!isInSearchMode){
        scrollContentSizeHeight =  scrollView.contentSize.height;
            if self.lastScrolingOffset < scrollView.contentOffset.y {
            
            if(HeightConstraint.constant > 70){
                HeightConstraint.constant -= 10
                print(HeightConstraint.constant)
            }else if ((scrollView.contentOffset.y + scrollView.frame.size.height > scrollContentSizeHeight / 4 + 250)){
                
                UIView.animateWithDuration(Double(0.25), animations: {
                    self.HeightConstraint.constant = 0
                   // self.topImageHeightConstraint.constant = 65
                    self.navigationController?.navigationBar.alpha = 1
                    
                    //self.topImageScroller.backgroundColor = UIColor.redColor()
                    self.view.layoutIfNeeded()
                   // self.TopImage.alpha = 0
                    self.topImageScroller.alpha = 0
                    self.graphView.alpha = 0
//                    self.navigationController?.navigationBar.barTintColor = UIColor.()    
                    //self.navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics: )
                    
                    self.navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics: .Default)
                    self.navigationController?.navigationBar.shadowImage = nil
                    self.navigationController?.navigationBar.translucent = false
                    self.navigationController?.navigationBar.backgroundColor  = UIColor(red: 0 / 255.0, green: 128 / 255.0, blue: 0 / 255.0, alpha: 1)
                    //self.navigationController!.navigationBar.layer.zPosition = -1;

                   // self.navigationController!.navigationBar.shadowImage = nil
                    self.view.layoutIfNeeded()
                })
                
            }
            
           
            
        } else {
            
        }

    if scrollView.contentOffset.y + scrollView.frame.size.height < scrollContentSizeHeight / 4 + 250{
        self.navigationController?.navigationBar.backgroundColor = UIColor.clearColor()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
        self.navigationController?.navigationBar.alpha = 1
        //self.navigationController!.navigationBar.layer.zPosition = -1;

    UIView.animateWithDuration(0.5, animations: {
    self.HeightConstraint.constant = 200
    //self.topImageHeightConstraint.constant = 200
    self.view.layoutIfNeeded()
    self.topImageScroller.alpha = 1
        self.graphView.alpha = 0.4
        
    
    //self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
    //self.navigationController!.navigationBar.shadowImage = UIImage()
        
    //self.topImageScroller.backgroundColor = UIColor.clearColor()
    self.view.layoutIfNeeded()
    })
        }
        self.lastScrolingOffset = scrollView.contentOffset.y
        }
}
    
//    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//       
//        if(!isInSearchMode){
//        
//        if ( scrollView.contentOffset.y == 0 || (scrollView.contentOffset.y + scrollView.frame.size.height < scrollContentSizeHeight / 4 + 250)){
//            
//            UIView.animateWithDuration(0.5, animations: {
//                self.HeightConstraint.constant = 200
//              //  self.topImageHeightConstraint.constant = 200
//                self.view.layoutIfNeeded()
//               // self.TopImage.alpha = 1
//                self.topImageScroller.alpha = 1
//                self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
//                self.navigationController!.navigationBar.shadowImage = UIImage()
//                
//                
//                self.view.layoutIfNeeded()
//            })
//            
//        }else if(HeightConstraint.constant < 120){
//            
//            UIView.animateWithDuration(0.25, animations: {
//                self.HeightConstraint.constant = 60
//               // self.topImageHeightConstraint.constant = 65
//                self.navigationController?.navigationBar.alpha = 1
//                self.topImageScroller.backgroundColor = UIColor.whiteColor()
//                self.view.layoutIfNeeded()
//                //self.TopImage.alpha = 0
//                self.topImageScroller.alpha = 0
//                self.navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
//                self.navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics: UIBarMetrics.Default)
//                self.navigationController!.navigationBar.shadowImage = nil
//                
//                self.view.layoutIfNeeded()
//            })
//        }
//      
//    }
//    
//    }
//=======================================================================================================
//Summary : collectionView delegate Implementation (nothing special here).Remember we have 3 prototype cell depending on type from server the view is created
//Implementation :
//=======================================================================================================
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        if(indexPath.row == 6){
            return CGSizeMake(screenSize.width , 125)
        }
        
        return CGSizeMake((collection.bounds.width - 8) / 2 , screenSize.width * 0.65)
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
//=======================================================================================================
//Summary : These functions are for controling the user interability when side menu has beed initialized(User must not be able to interact with frontView)
//Implementation :
//=======================================================================================================
    func revealController(revealController: SWRevealViewController!,  willMoveToPosition position: FrontViewPosition){
        if(position == FrontViewPosition.Left) {
             self.view.userInteractionEnabled = true
            sidebarMenuOpen = false
        } else {
             self.view.userInteractionEnabled = false
            sidebarMenuOpen = true
        }
    }
    
    func revealController(revealController: SWRevealViewController!,  didMoveToPosition position: FrontViewPosition){
        if(position == FrontViewPosition.Left) {
             self.view.userInteractionEnabled = true
            sidebarMenuOpen = false
        } else {
             self.view.userInteractionEnabled = false
            sidebarMenuOpen = true
        }
    }
//=======================================================================================================
//Summary : here we Implement the segue action for loading productDetail View
//Implementation :
//Details : we pop the view not show(we do not stack it!!!)
//=======================================================================================================
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetails" {
            if let productDetailVC = segue.destinationViewController as? ProductDetailVC {
                if let product = sender as? Product {
                    productDetailVC.product = product
                }
            }
        }
        
        if segue.identifier == "SearchResultView" {
            if let searchViewController = segue.destinationViewController as? SearchResultVC {
                if let textSearched = sender as? String {
                    searchViewController.textSearched = textSearched
                }
            }
        }
    }
//=======================================================================================================
//Summary : IBaction when clicking the search button in main view for animating the search view
//Implementation :
//=======================================================================================================
    @IBAction func SearchItemClicked(sender: AnyObject) {
        
        
      
        
        if(!isInSearchMode){
            

            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = self.MainView.bounds
            
            blurEffectView.alpha = 0
             // for supporting device rotation
            self.MainView.addSubview(blurEffectView)
            self.searchContainerView.hidden = false
            self.navigationController?.navigationBar.translucent = true
            
            
            
        UIView.animateWithDuration(0.5, animations: {
           
            self.SearchBar.becomeFirstResponder()

            for v in self.MainView.subviews{
                if v is UIVisualEffectView{
                    v.alpha = 0.8
                }
            }
            
            //self.SearchBarStackView.transform = CGAffineTransformMakeTranslation(0, 0)
            self.searchContainerView.transform = CGAffineTransformMakeTranslation(0, 0)
            
            self.MainView.alpha = 1
           // self.navigationController!.navigationBar.layer.zPosition = 0;
            
            
            }, completion: nil)
        
       // self.SearchBarStackView.hidden =  false
        self.MainView.userInteractionEnabled = false
            isInSearchMode = true
            
        }else {
                searchModeOff()
        }

   
    }
    
    func searchModeOff(){
        //self.SearchBar.resignFirstResponder()
        self.resignFirstResponder()
        UIView.animateWithDuration(0.25, animations: {
            
            for v in self.MainView.subviews{
                if v is UIVisualEffectView{
                    v.removeFromSuperview()
                }
            }
            
           // self.SearchBarStackView.transform = CGAffineTransformMakeTranslation(0, -1000)
            self.searchContainerView.transform = CGAffineTransformMakeTranslation(0, -1000)
            self.MainView.alpha = 1
            
            }, completion: nil)
        
        //            self.searchBarView.hidden =  true
        self.MainView.userInteractionEnabled = true
        isInSearchMode = false
    }
    
   
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {

        searchModeOff()
        performSegueWithIdentifier("SearchResultView", sender: searchBar.text)
        
    }
    
//=======================================================================================================
//Summary : Here we implement the table for searchView which contains the recent searches the user has made (implementation of DB is required to store and recieve the data)
//Implementation :
//=======================================================================================================
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        searchModeOff()
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! RecentSearchCell
        let searchedText : String = cell.TextSearched.text!
        performSegueWithIdentifier("SearchResultView", sender: searchedText)
        
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("RecentSearchCell") as? RecentSearchCell {
            
            cell.configureCell("WTF")
            cell.backgroundColor = UIColor(red: 230 / 255, green: 230 / 255 , blue: 230 / 255, alpha: 0.5)
//            cell.backgroundView = UIView()
            cell.alpha = 1
            
            return cell
            
        } else {
            
            return UITableViewCell()
        }
        
    }
//=======================================================================================================
//Summary : Here we implement the 3d touch component , when presure is more than 60% a simple info view of the product will be shown
//Implementation :
//=======================================================================================================
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if let touch = touches.first{
                if traitCollection.forceTouchCapability == UIForceTouchCapability.Available{
                //3D touch capable
                    let force = touch.force / touch.maximumPossibleForce
                    
                    print(force)
                    ForceTouchView.hidden = true
                    UIView.animateWithDuration(0.25, animations: {
                        
                        self.ForceTouchView.alpha = 1
                        self.MainView.alpha = 0.092
                         self.MainView.userInteractionEnabled = true
                        
                        
                    })
                    
                    
                }
                
            
            
            
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        force = 0
    }
    
//=======================================================================================================
//Summary : here we implement the drag and drop component which enables user to drop items to basket 
//Implementation :
//=======================================================================================================
    func snapshopOfCell(inputView: UIView) -> UIView {
        UIGraphicsBeginImageContextWithOptions(inputView.bounds.size, false, 0.0)
        inputView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext() as UIImage
        UIGraphicsEndImageContext()
        let cellSnapshot : UIView = UIImageView(image: image)
        cellSnapshot.layer.masksToBounds = false
        cellSnapshot.layer.cornerRadius = 0.0
        cellSnapshot.layer.shadowOffset = CGSizeMake(-5.0, 0.0)
        cellSnapshot.layer.shadowRadius = 5.0
        cellSnapshot.layer.shadowOpacity = 0.4
        return cellSnapshot
    }
    

    func longPressGestureRecognized(gestureRecognizer: UIGestureRecognizer) {
        
    
        let longPress = gestureRecognizer as! UILongPressGestureRecognizer
        let state = longPress.state
        let locationInView = longPress.locationInView(collection)
        let indexPath =  collection.indexPathForItemAtPoint(locationInView)

        
        struct My {
            static var cellSnapshot : UIView? = nil
        }
        struct Path {
            static var initialIndexPath : NSIndexPath? = nil
        }
        
        switch state {
        case UIGestureRecognizerState.Began:
            if indexPath != nil {
                Path.initialIndexPath = indexPath
                let cell = collection.cellForItemAtIndexPath(indexPath!) as UICollectionViewCell!
                My.cellSnapshot  = snapshopOfCell(cell)
                _ = cell.center
                
                //My.cellSnapshot!.center = center
                //My.cellSnapshot!.transform = CGAffineTransformMakeTranslation(longPress.locationInView(self.view).x, longPress.locationInView(self.view).y)
                My.cellSnapshot!.alpha = 0.0
                self.view.addSubview(My.cellSnapshot!)
                My.cellSnapshot!.center = CGPointMake(longPress.locationInView(self.view).x, longPress.locationInView(self.view).y)
                
                UIView.animateWithDuration(0.25, animations: { () -> Void in
                    //center.y = locationInView.y
                   // center.x = locationInView.x
                    My.cellSnapshot!.center = CGPointMake(longPress.locationInView(self.view).x, longPress.locationInView(self.view).y)
                    My.cellSnapshot!.transform = CGAffineTransformMakeScale(0.6, 0.6)
                    
                    My.cellSnapshot!.alpha = 0.98
                    cell.alpha = 1
                    self.dragView.hidden = false
                    self.dragView.alpha = 0.7
                    
                    }, completion: { (finished) -> Void in
                        if finished {
                            cell.hidden = false
                        }
                })
            }
            
        case UIGestureRecognizerState.Changed:
            if My.cellSnapshot != nil{
            var center = My.cellSnapshot!.center
            center.y = longPress.locationInView(self.view).y
            center.x = longPress.locationInView(self.view).x
            My.cellSnapshot!.center = center
            if ((indexPath != nil) && (indexPath != Path.initialIndexPath)) {
             //swap(&itemsArray[indexPath!.row], &itemsArray[Path.initialIndexPath!.row])
                //collection.moveItemAtIndexPath(Path.initialIndexPath!, toIndexPath: indexPath!)
                Path.initialIndexPath = indexPath
            }
            }
            
            
        default:

            if My.cellSnapshot != nil{
                if(longPress.locationInView(self.view).y > 470){
                    
                    print("add to kart :D")
                
                }
                let cell = collection.cellForItemAtIndexPath(Path.initialIndexPath!) as UICollectionViewCell!
                UIView.animateWithDuration(0.25, animations: { () -> Void in
                    
                    My.cellSnapshot!.center = cell.center
                    My.cellSnapshot!.transform = CGAffineTransformIdentity
                    My.cellSnapshot!.alpha = 0.0
                    self.dragView.alpha = 0
                    
                    }, completion: { (finished) -> Void in
                        if finished {
                            Path.initialIndexPath = nil
                            My.cellSnapshot!.removeFromSuperview()
                            My.cellSnapshot = nil
                            self.dragView.hidden = true

                        }
                })
    
            }
        }
}
    

    @IBAction func priceSliderHandler(sender: UISlider) {
        
        let currentValue = Int(sender.value)
        if(currentValue < 25){
            
            if(currentValue <= 12){
                
                
                UIView.animateWithDuration(0.25, animations: { () -> Void in
                    self.PriceSlider.value = 0
                    self.SliderPriceTag.text = "قیمت تا: \(String(self.prices[0]))"
                })
                
            }else{
                
                UIView.animateWithDuration(0.25, animations: { () -> Void in
                    self.PriceSlider.value = 25
                    self.SliderPriceTag.text = "قیمت تا: \(String(self.prices[1]))"
                })
            }
            
            
        }
        
        if(currentValue > 25 && currentValue < 50){
            
            if  currentValue <= 37{
            
                UIView.animateWithDuration(0.25, animations: { () -> Void in
                    self.PriceSlider.value = 25
                    self.SliderPriceTag.text = "قیمت تا: \(String(self.prices[1]))"
                })
                
            }else{
                
                UIView.animateWithDuration(0.25, animations: { () -> Void in
                    self.PriceSlider.value = 50
                    self.SliderPriceTag.text = "قیمت تا: \(String(self.prices[2]))"
                })
                
            }
            
            
            
        }
        
        if (currentValue > 50) && (currentValue < 75){
            
            if currentValue <= 62 {
                
                UIView.animateWithDuration(0.25, animations: { () -> Void in
                    self.PriceSlider.value = 50
                    self.SliderPriceTag.text = "قیمت تا: \(String(self.prices[2]))"
                })
                
            }else{
                
                UIView.animateWithDuration(0.25, animations: { () -> Void in
                    self.PriceSlider.value = 75
                    self.SliderPriceTag.text = "قیمت تا: \(String(self.prices[3]))"
                })
                
            }
            
        }
        
        if(currentValue > 75) && (currentValue <= 100){
            
            if currentValue <= 87{
                
                UIView.animateWithDuration(0.25, animations: { () -> Void in
                    self.PriceSlider.value = 75
                    self.SliderPriceTag.text = "قیمت تا: \(String(self.prices[3]))"
                })
                
            }else{
                
                UIView.animateWithDuration(0.25, animations: { () -> Void in
                    self.PriceSlider.value = 100
                    self.SliderPriceTag.text = "قیمت تا: \(String(self.prices[4]))"
                })
                
            }
            
        }
        
    }
    
    
    

}
