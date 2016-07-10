//
//  BasketInfoTableViewVC.swift
//  SanatSharif
//
//  Created by CyrusREfahi on 4/19/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

import UIKit

class BasketInfoTableViewVC: UITableViewController , UIPickerViewDelegate, UIPickerViewDataSource  {

    @IBOutlet weak var workTypePicker : UIPickerView!
    
    var pickerData : [String] = [String]()
    
    override func viewDidLoad() {
        
        workTypePicker.delegate = self
        workTypePicker.dataSource = self
        
         pickerData = ["منزل", "شرکت", "ویلا"]
        
        
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont(name: "AvenirNext-Regular", size: 14.0)
        header.textLabel?.textAlignment = NSTextAlignment.Right
        
    }
    

    
    // The number of columns of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        pickerLabel.textColor = UIColor.blackColor()
        pickerLabel.text = pickerData[row]
        // pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 15)
        pickerLabel.font = UIFont(name: "Arial-BoldMT", size: 15) // In this use your custom font
        pickerLabel.textAlignment = NSTextAlignment.Center
        return pickerLabel
    }
    
    
    
    
    
    
    
}
