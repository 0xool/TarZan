//
//  RecpieTableControl.swift
//  SanatSharif
//
//  Created by cyrus refahi on 7/25/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit
import expanding_collection

class RecpieTableControl: ExpandingTableViewController  , UIViewControllerTransitioningDelegate {

    private var unSelectedHeight : CGFloat = 250
    private var selectedHeight = UIScreen.mainScreen().bounds.height
    
    private var cellView : UIView!
    private let recpieDetailVCAnimation = RecpieDetailVCAnimation()
    private var rowZeroSelected : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerHeight = 236

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        let newBackButton = UIBarButtonItem(title: "Back", style: .Plain, target: self, action: #selector(back))
        self.navigationItem.leftBarButtonItem = newBackButton;
        
//        self.navigationItem.leftBarButtonItem?.image = UIImage(named: "")
        
        
        

    }
    
    func back(){
        
        popTransitionAnimation()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        rowZeroSelected = false
//        self.navigationController?.hidesBarsOnTap = true
        //self.navigationController?.hidesBarsOnSwipe = true
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }
    
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if (indexPath.row == 0 && rowZeroSelected){
            return selectedHeight
        }else{
            return unSelectedHeight
        }
    }
    

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RecipeCell", forIndexPath: indexPath)

        // Configure the cell...
        
        

        return cell
    }
    

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        UIView.animateWithDuration(0.5, delay: 0.5, options: UIViewAnimationOptions.AllowAnimatedContent, animations: {
        
        
        if indexPath.row == 0 {
            
         self.rowZeroSelected = !self.rowZeroSelected
            
        }else{
            
            self.rowZeroSelected = true
            
        }
        
        
        
        tableView.moveRowAtIndexPath(indexPath, toIndexPath: tableView.indexPathsForVisibleRows![0])
        
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
        tableView.setContentOffset(CGPoint(x: 0, y: 236), animated:true)
            
        self.getViewController()
//        self.presentViewController(getViewController(), animated: false, completion: nil)
        
            
            
            }) { (finished) in
                
                self.cellView = tableView.cellForRowAtIndexPath(indexPath)?.contentView
                
                if finished && self.rowZeroSelected == true {
                 //   self.navigationController?.pushViewController(self.getViewController(), animated: true)
                    //self.rowZeroSelected = false
                    self.performSegueWithIdentifier("showRecpieDetail", sender: nil )
                }

        }
        

        
    }
    
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        
    }
    
    private func getViewController() -> RecpieDetailVC {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("RecpieDetailVC") as! RecpieDetailVC
        
        return vc
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        recpieDetailVCAnimation.originFrame = self.view.frame
        return recpieDetailVCAnimation
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        recpieDetailVCAnimation.originFrame = self.view.frame
        return recpieDetailVCAnimation
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showRecpieDetail", let RD = segue.destinationViewController as? RecpieDetailVC {
            
            RD.transitioningDelegate = self
        
        }
    
    }
    

}
