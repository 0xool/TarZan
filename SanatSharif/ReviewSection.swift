//
//  ReviewSection.swift
//  SanatSharif
//
//  Created by cyrus refahi on 7/31/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit

class ReviewSection: UITableViewCell , UITableViewDelegate , UITableViewDataSource {
    
    var gray : Bool = true
    
    @IBOutlet weak var tableView : UITableView!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        if indexPath.row == 1 || indexPath.row == 0 {
            let cell = self.tableView.dequeueReusableCellWithIdentifier("ReviewTableViewCell") as! ReviewTableViewCell
        
            cell.configureCell(gray)
            
            gray = !gray
        
            return cell
        }
        
        if indexPath.row == 2 {
            
            let cell = self.tableView.dequeueReusableCellWithIdentifier("LoadMoreCell") as! LoadMoreCell
            
            return cell
            
        }
        
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.row == 1 || indexPath.row == 0 {
            return 250
        }else{
            return 60
        }
    }
    
    override func awakeFromNib() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

}
