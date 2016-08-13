//
//  BasketVC.swift
//  SanatSharif
//
//  Created by cyrus refahi on 8/13/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import FoldingCell
import UIKit

class BasketVC: UIViewController , UITableViewDelegate , UITableViewDataSource{

    

    
    @IBOutlet weak var tableView  : UITableView!
    
    var cellHeights = [CGFloat]()
    let kCloseCellHeight: CGFloat = 110
    let kOpenCellHeight: CGFloat = 410
    
    let kRowsCount = 3

    
    override func viewDidLoad() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)

        
        super.viewDidLoad()
        
        for _ in 0...kRowsCount {
            cellHeights.append(kCloseCellHeight)
        }
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
         let cell = self.tableView.dequeueReusableCellWithIdentifier("FoldingCell") as? BasketFoldingCell
            cell?.configureCell()
        
            
           
            return cell!
        }
        
        
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return cellHeights[indexPath.row]
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! BasketFoldingCell
        
        var duration = 0.0
        if cellHeights[indexPath.row] == kCloseCellHeight { // open cell
            cellHeights[indexPath.row] = kOpenCellHeight
            
            cell.selectedAnimation(true, animated: true, completion: nil)
            duration = 0.5
        } else {// close cell
            cellHeights[indexPath.row] = kCloseCellHeight
            cell.selectedAnimation(false, animated: true, completion: nil)
            duration = 1.1
        }
        
        UIView.animateWithDuration(duration, delay: 0, options: .CurveEaseOut, animations: { () -> Void in
            tableView.beginUpdates()
            tableView.endUpdates()
            }, completion: nil)
    }
    
    
}
