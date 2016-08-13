//
//  BasketFoldingCell.swift
//  SanatSharif
//
//  Created by cyrus refahi on 8/13/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit
import FoldingCell

class BasketFoldingCell: FoldingCell , UITableViewDataSource , UITableViewDelegate {

    @IBOutlet weak var containerHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerTableView : UITableView!
    
    private let extraHeight : CGFloat = 100
    var height : CGFloat!{
        
        get{
            self.containerHeightConstraint.constant = self.containerTableView.contentSize.height + extraHeight
            print(self.containerTableView.contentSize.height + extraHeight)
            let tempHeight = self.containerTableView.contentSize.height + extraHeight
            itemCount = Int(round( tempHeight / 100.0)) // Decides number of folds for cell
            return self.containerTableView.contentSize.height + extraHeight
        }
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = containerTableView.dequeueReusableCellWithIdentifier("BasketItemCell")
        
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    
    override func animationDuration(itemIndex: NSInteger, type: AnimationType) -> NSTimeInterval {
        var durations = [0.26]
        for _ in 1...itemCount {
            durations.append(0.2)
        }
        return durations[itemIndex]
    }
    
    override func awakeFromNib() {
        
        foregroundView.layer.cornerRadius = 15
        foregroundView.layer.masksToBounds = true
        
        containerView.layer.cornerRadius = 15
        containerView.layer.masksToBounds = true
        
        containerTableView.delegate = self
        containerTableView.dataSource = self
        
        
        super.awakeFromNib()
    }
    
    func configureCell()  {
        
        //height = self.containerTableView.contentSize.height
        
        
    }
    
    
    
}
