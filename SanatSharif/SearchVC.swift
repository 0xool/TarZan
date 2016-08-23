//
//  SearchVC.swift
//  SanatSharif
//
//  Created by cyrus refahi on 8/20/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit
import CoreData

class SearchVC: UIViewController , UITableViewDelegate , UITableViewDataSource ,  UISearchBarDelegate{

    @IBOutlet weak var RecentSearchTable : UITableView!
    @IBOutlet weak var searchBarView: UIView!
    @IBOutlet weak var SearchBar: UISearchBar!
    @IBOutlet weak var SearchBarStackView: UIStackView!
    
    let moContext = UserModelManager.sharedInstance._recentSearchController.managedObjectContext
    var searchedTexts : [RecentSearchEntity]! = [RecentSearchEntity]()
    var delegate: switchViewProtocol?

    
    
    override func viewDidLoad() {
        
        RecentSearchTable.delegate = self
        RecentSearchTable.dataSource = self
        SearchBar.delegate = self
        
        
    }
    
    func  setFirstResponder (){
    
        self.SearchBar.becomeFirstResponder()
    }
    
    func resignAllResponder(){
        self.SearchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        
        if (searchBar.text != nil && searchBar.text != ""){
            addSearchToCoreData(searchBar.text!)
            self.SearchBar.resignFirstResponder()
            self.delegate?.swtchViewToSearched(self.SearchBar.text!)
        }

        
    }
    
    func setViewtoLoad(){
        
        self.RecentSearchTable.alpha = 0.8
        
    }
    
    func setViewToUnload(){
        self.RecentSearchTable.alpha = 0
    }
    
    func searchedResult(){

        let userfetch = NSFetchRequest(entityName: "RecentSearchEntity")
        searchedTexts.removeAll()

        
        
        do {
            let fetchedEntity = try moContext.executeFetchRequest(userfetch) as! [RecentSearchEntity]
            for b in fetchedEntity {
                self.searchedTexts.append(b)
            }
        }catch {
            
        }
        
        
        self.RecentSearchTable.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        
       
        self.SearchBar.barTintColor = UIColor(red: 182 / 255, green: 194 / 255, blue: 150 / 255, alpha: 0.1)
        //        self.SearchBar.backgroundImage = UIImage()
        self.SearchBar.translucent = true
       // self.RecentSearchTable.backgroundColor = UIColor.clearColor()
        //self.SearchBar.becomeFirstResponder()
        //self.RecentSearchTable.alpha = 0.3
        self.RecentSearchTable.alpha = 0
        searchedResult()
    }
    
    func addSearchToCoreData(searchedText : String){
        
        if searchedTexts.count == 10 {
            moContext.deleteObject(searchedTexts.first!)
            searchedTexts.removeFirst()
        }
       
        let searchEntiity = NSEntityDescription.insertNewObjectForEntityForName("RecentSearchEntity", inManagedObjectContext: moContext) as! RecentSearchEntity
        searchEntiity.recentSearchText = searchedText
        
        do {
            try moContext.save()
            
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }


        
    }
    
    
    //=======================================================================================================
    //Summary : Here we implement the table for searchView which contains the recent searches the user has made (implementation of DB is required to store and recieve the data)
    //Implementation :
    //=======================================================================================================
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedTexts.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! RecentSearchCell
        let searchedText : String = cell.TextSearched.text!
        self.SearchBar.resignFirstResponder()
        self.delegate?.swtchViewToSearched(searchedText)
        
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("RecentSearchCell") as? RecentSearchCell {
            
            cell.configureCell(self.searchedTexts[searchedTexts.count - indexPath.row - 1].recentSearchText!)
            cell.backgroundColor = UIColor.clearColor()//UIColor(red: 230 / 255, green: 230 / 255 , blue: 230 / 255, alpha: 0.5)
            
            cell.alpha = 1
            
            return cell
            
        } else {
            
            return UITableViewCell()
        }
        
    }
    
    @IBAction func QRItemClicked(){
        
        self.SearchBar.resignFirstResponder()
        self.delegate?.switchViewToQR()
        
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


protocol switchViewProtocol {
    func swtchViewToSearched(search : String)
    func switchViewToQR()
}
