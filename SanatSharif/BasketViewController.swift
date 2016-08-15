//
//  BasketContainerViewController.swift
//  SanatSharif
//
//  Created by cyrus refahi on 8/13/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit

class BasketViewController: UIViewController , UITableViewDelegate , UITableViewDataSource  {
    
    @IBOutlet weak var tableView : UITableView!
    
    private var sizes : [Int]! = [Int]()
    private var selectedSection : Int! = -1
    
    
    override func viewDidLoad() {
     
        self.tableView.delegate = self
        self.tableView.dataSource = self
        

        
        sizes.append(20)
        sizes.append(20)
        sizes.append(20)
        sizes.append(20)
        
        let headerNib = UINib(nibName: "BasketHeaderView", bundle: NSBundle.mainBundle())
        self.tableView.registerNib(headerNib, forHeaderFooterViewReuseIdentifier: "BasketHeaderView")
        
        let footerNib = UINib(nibName: "BasketFooterView", bundle: NSBundle.mainBundle())
        self.tableView.registerNib(footerNib, forHeaderFooterViewReuseIdentifier: "BasketFooterView")

        
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == selectedSection {
            
            return sizes[section]
            
        }
        
        return 0
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("BasketItemCell") as! BasketItemCell
        
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
            return 61.0
        
        
        
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
            return 50
        
        
        
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = self.tableView.dequeueReusableHeaderFooterViewWithIdentifier("BasketHeaderView") as! BasketHeaderView
        
        cell.configureHeader(section, tableViewClass: self)
        
        cell.contentView.backgroundColor = UIColor.darkGrayColor()
        
        return cell
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let cell = self.tableView.dequeueReusableHeaderFooterViewWithIdentifier("BasketFooterView") as! BasketFooterView
        
        cell.contentView.backgroundColor = UIColor.darkGrayColor()
        
        
        return cell
    }
    
    
    
    
    func openSection (section : Int){
        
        if self.selectedSection != section{
            
            
            if self.selectedSection != -1 {
                let previousSection = self.selectedSection
                self.selectedSection = -1
                self.tableView.reloadSections(NSIndexSet(index : previousSection), withRowAnimation: .Fade)
            }
            
            
        
            self.selectedSection = section
        
            print(self.selectedSection)
            
            
            UIView.animateWithDuration(0.1) {
                
                self.tableView.beginUpdates()
                self.tableView.reloadSections(NSIndexSet(index : self.selectedSection), withRowAnimation: .Fade)
                //self.tableView.headerViewForSection(self.selectedSection)?.layoutSubviews()
                self.tableView.endUpdates()
                
            }
            
           
        }else{
            self.selectedSection = -1
            self.tableView.reloadData()
        }
    
        
       
        
        

      
        

    }
    
    
    

}
