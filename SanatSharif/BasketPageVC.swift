//
//  BasketPageVC.swift
//  SanatSharif
//
//  Created by CyrusREfahi on 4/15/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

import UIKit

class BasketPageVC: UIViewController  , UITableViewDelegate , UITableViewDataSource  {

    
    @IBOutlet weak var BasketTableView: UITableView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        
        BasketTableView.delegate = self
        BasketTableView.dataSource = self
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if(indexPath.row == 9 ){
            
            if let cell = tableView.dequeueReusableCellWithIdentifier("BuyOut") as? BuyOutCell {
                
                UIView.animateWithDuration(2, animations: { cell.alpha = 1 })

                
                return cell
                
            } else {
                
                return UITableViewCell()
            }
        
            
        }
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("BasketCell") as? BasketCell {
            
             UIView.animateWithDuration(2, animations: { cell.alpha = 1 })
            
            return cell
            
        } else {
            
            return UITableViewCell()
        }
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
    
    
    for cell in BasketTableView.visibleCells as! [UITableViewCell] {
    
    let point = BasketTableView.convertPoint(cell.center, toView: BasketTableView.superview)
    cell.alpha = ((point.y * 400) / BasketTableView.bounds.maxY) / 15
        if(point.y < 10){
//                cell.CellView.frame.size.height = cell.CellView.bounds.height - point.y
        }
    }
    }
    
    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        
//                    return tableView.estimatedRowHeight
//    }
//    
    
     func reloadData(){
        BasketTableView.reloadData()
    }
    
}
