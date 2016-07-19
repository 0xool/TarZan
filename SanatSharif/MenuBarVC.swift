//
//  MenuBarVC.swift
//  SanatSharif
//
//  Created by CyrusREfahi on 4/13/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

import UIKit



class MenuBarVC: UITableViewController , UIPopoverPresentationControllerDelegate {

    
    @IBOutlet weak var UserImage: RoundImageMaterial!
    @IBOutlet weak var UserName: UILabel!
    
    
    @IBOutlet weak var FirstRowNotifView: RoundImageMaterial!
    @IBOutlet weak var FirstRowNotifNumber: UILabel!
    
    
    @IBAction func unwindFromSecondVC(segue: UIStoryboardSegue) {
        // Here you can receive the parameter(s) from secondVC

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "popoverSegue" {
            let popoverViewController = segue.destinationViewController 
            popoverViewController.modalPresentationStyle = UIModalPresentationStyle.Popover
            popoverViewController.popoverPresentationController!.delegate = self
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }

    
}
