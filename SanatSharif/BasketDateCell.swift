//
//  BasketDateCell.swift
//  SanatSharif
//
//  Created by cyrus refahi on 8/6/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit
import JTAppleCalendar

class BasketDateCell: UICollectionViewCell , JTAppleCalendarViewDataSource , JTAppleCalendarViewDelegate {
    
    @IBOutlet weak var calendarView: JTAppleCalendarView!

    
    func configureCalendar(calendar: JTAppleCalendarView) -> (startDate: NSDate, endDate: NSDate, numberOfRows: Int, calendar: NSCalendar){
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        
        let firstDate = NSDate() //formatter.dateFromString("2014 01 05")
        let secondDate = NSDate()
        let numberOfRows = 6
        let aCalendar = NSCalendar.currentCalendar() // Properly configure your calendar to your time zone here
        
        return (startDate: firstDate, endDate: secondDate, numberOfRows: numberOfRows, calendar: aCalendar)
        
    }
    
    func calendar(calendar: JTAppleCalendarView, isAboutToDisplayCell cell: JTAppleDayCellView, date: NSDate, cellState: CellState) {
        (cell as! DateCell).setupCellBeforeDisplay(cellState, date: date , selected:  false)
    }
    
    func calendar(calendar: JTAppleCalendarView, didSelectDate date: NSDate, cell: JTAppleDayCellView?, cellState: CellState) {
        (cell as! DateCell).cellCicked()
    }
    
    func calendar(calendar: JTAppleCalendarView, didDeselectDate date: NSDate, cell: JTAppleDayCellView?, cellState: CellState) {
        (cell as! DateCell).cellUnClicked()
    }
    
    
    func configureCell()  {
        self.calendarView.dataSource = self
        self.calendarView.delegate = self
        self.calendarView.registerCellViewXib(fileName: "DateCell")
        
         calendarView.cellInset = CGPoint(x: 0, y: 0)
    }
    
}
