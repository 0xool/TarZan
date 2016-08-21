//
//  SearchVC.swift
//  SanatSharif
//
//  Created by cyrus refahi on 8/20/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit

class SearchVC: UIViewController , UITableViewDelegate , UITableViewDataSource{

    @IBOutlet weak var RecentSearchTable : UITableView!
    @IBOutlet weak var searchBarView: UIView!
    @IBOutlet weak var SearchBar: UISearchBar!
    @IBOutlet weak var SearchBarStackView: UIStackView!
    
    
    override func viewDidLoad() {
        
        RecentSearchTable.delegate = self
        RecentSearchTable.dataSource = self
        // self.SearchBarStackView.transform = CGAffineTransformMakeTranslation(0, -1000)
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
       
        self.SearchBar.barTintColor = UIColor(red: 182 / 255, green: 194 / 255, blue: 150 / 255, alpha: 0.1)
        //        self.SearchBar.backgroundImage = UIImage()
        self.SearchBar.translucent = true
        self.RecentSearchTable.backgroundColor = UIColor.clearColor()
        //self.SearchBar.becomeFirstResponder()
        self.RecentSearchTable.alpha = 0.3
        
        
        
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
    //Summary : here we Implement the segue action for loading productDetail View
    //Implementation :
    //Details : we pop the view not show(we do not stack it!!!)
    //=======================================================================================================
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SearchResultView" {
            if let searchViewController = segue.destinationViewController as? SearchResultVC {
                if let textSearched = sender as? String {
                    searchViewController.textSearched = textSearched
                }
            }
        }
    }
    
    
}
