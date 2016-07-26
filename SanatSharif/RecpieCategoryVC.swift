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

    override func viewDidLoad() {
        itemSize = CGSize(width: 210, height: 211)
        super.viewDidLoad()
        
        addGestureToView(collectionView!)

        // register cell
        let nib = UINib(nibName: String(RecpieCell), bundle: nil)
        collectionView?.registerNib(nib, forCellWithReuseIdentifier: String(RecpieCell))

    }

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
