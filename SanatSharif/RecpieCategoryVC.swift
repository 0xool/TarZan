//
//  RecpieCategoryVC.swift
//  SanatSharif
//
//  Created by cyrus refahi on 7/25/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit
import expanding_collection

@warn_unused_result
internal func Init<Type>(value : Type, @noescape block: (object: Type) -> Void) -> Type
{
    block(object: value)
    return value
}


class RecpieCategoryVC:  ExpandingViewController  {
    
    @IBOutlet weak var backGroundImage : UIImageView!
    @IBOutlet weak var backgroundBlurEffect: UIVisualEffectView!
    
    var lastIndex : Int = 0
    
    override func viewDidLoad() {
        itemSize = CGSize(width: 250 , height: 250)
        super.viewDidLoad()
        
        addGestureToView(collectionView!)

        // register cell
        let nib = UINib(nibName: String(RecpieCell), bundle: nil)
        collectionView?.registerNib(nib, forCellWithReuseIdentifier: String(RecpieCell))
        
        

    }
    
    override func viewDidAppear(animated: Bool) {
        let currentCell = self.collectionView?.cellForItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 0)) as! RecpieCell
        
        
        /*UIView.transitionWithView(self.backGroundImage,
                                  duration:5,
                                  options: UIViewAnimationOptions.TransitionCrossDissolve,
                                  animations: { self.backGroundImage.image = currentCell.imageView.image },
                                  completion: nil)
    
 */}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        guard let cell = collectionView.cellForItemAtIndexPath(indexPath) as? RecpieCell
            where currentIndex == indexPath.row else { return }
        
        
        
        if cell.isOpened == false {
            cell.cellIsOpen(true)
        } else {
            let vc: ExpandingTableViewController = getViewController()
                pushToViewController(vc)
        }
        
//        let open = sender.direction == .Up ? true : false
//        cell.cellIsOpen(open)
//        cellsIsOpen[indexPath.row] = cell.isOpened
    }
    
    private func getViewController() -> ExpandingTableViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("RecpieTableControl") as! ExpandingTableViewController

        return vc
    }
    
        
        override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 4
        }
        
        override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("RecpieCell", forIndexPath: indexPath)
            // configure cell
            return cell
        }
    

    private func addGestureToView(toView: UIView) {
        let gesutereUp = Init(UISwipeGestureRecognizer(target: self, action: #selector(RecpieCategoryVC.swipeHandler(_:)))) {
            $0.direction = .Up
        }
        
        let gesutereDown = Init(UISwipeGestureRecognizer(target: self, action: #selector(RecpieCategoryVC.swipeHandler(_:)))) {
            $0.direction = .Down
        }
        toView.addGestureRecognizer(gesutereUp)
        toView.addGestureRecognizer(gesutereDown)
    }
    
    func swipeHandler(sender: UISwipeGestureRecognizer) {
        let indexPath = NSIndexPath(forRow: currentIndex, inSection: 0)
        guard let cell  = collectionView?.cellForItemAtIndexPath(indexPath) as? RecpieCell else { return }
        // double swipe Up transition
        if cell.isOpened == true && sender.direction == .Up {
            pushToViewController(getViewController())
            
           
        }
        
        let open = sender.direction == .Up ? true : false
        cell.cellIsOpen(open)
    }
    
    override func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        super.collectionView(collectionView, willDisplayCell: cell, forItemAtIndexPath: indexPath)
        let cell  = self.collectionView?.cellForItemAtIndexPath(indexPath) as? RecpieCell
        cell?.cellIsOpen(true)
        print("OK What is worng? :D \(indexPath.row)")
        
    }
    
    override func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        super.scrollViewDidEndDecelerating(scrollView)
        let currentCell = self.collectionView?.cellForItemAtIndexPath(NSIndexPath(forItem: currentIndex, inSection: 0)) as! RecpieCell
        let previousCell = self.collectionView?.cellForItemAtIndexPath(NSIndexPath(forItem: lastIndex, inSection: 0)) as! RecpieCell
        
        previousCell.cellIsOpen(false)
        currentCell.cellIsOpen(true)
        
        lastIndex = currentIndex
        
        let transition : CATransition = CATransition()
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionFade
        
        self.backGroundImage.layer.addAnimation(transition, forKey: nil)
        
        self.backGroundImage.image = currentCell.imageView.image
        
//        CATransition *transition = [CATransition animation];
//        transition.duration = 1.0f;
//        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//        transition.type = kCATransitionFade;
//        
//        [imageView.layer addAnimation:transition forKey:nil];
//
        
        
        
        
    }
    

}
