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
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("ReviewTableViewCell") as! ReviewTableViewCell
        
        cell.configureCell(gray)
        
        gray = !gray
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 250
    }
    
    override func awakeFromNib() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

}
