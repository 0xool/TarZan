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
    
    func calendar(calendar: JTAppleCalendarView, sectionHeaderSizeForDate date: (startDate: NSDate, endDate: NSDate)) -> CGSize{
        return CGSize (width: UIScreen.mainScreen().bounds.width , height: 100 )
    }
    func calendar(calendar: JTAppleCalendarView, isAboutToDisplaySectionHeader header: JTAppleHeaderView, date: (startDate: NSDate, endDate: NSDate), identifier: String){

        var label = "Unkown error"
        let date = NSDate()
        let calender = NSCalendar(calendarIdentifier: NSCalendarIdentifierPersian)
        let components = calender?.components(NSCalendarUnit(rawValue: UInt.max), fromDate: date)
        
        let year =  components!.year
        let month = components!.month
       // let day = components!.day
        
        switch month {
        case 1:
            label = "فروردین"
            break
        case 2:
            label = "اردیبهشت"
            break
        case 3:
            label = "خرداد"
            break
        case 4:
            label = "تیر"
            break
        case 5:
            label = "مرداد"
            break
        case 6:
            label = "شهریور"
            break
        case 7:
            label = "مهر"
            break
        case 8:
            label = "آبان"
            break
        case 9:
            label = "آذر"
            break
        case 10:
            label = "دی"
            break
        case 11:
            label = "بهمن"
            break
        case 12:
            label = "اسفند"
        default:
            break
        }
        
        
        
        (header as! DateHeaderCell).configureCell("\(String(label)) \n \(String(year))")

        
    }
    
    func updateCell(){
        
        self.calendarView.reloadData()
        
    }
    
    func configureCell()  {
        self.calendarView.dataSource = self
        self.calendarView.delegate = self
        self.calendarView.registerCellViewXib(fileName: "DateCell")
        self.calendarView.registerHeaderViewXibs(fileNames: ["DateHeaderCell"])
        
        
         calendarView.cellInset = CGPoint(x: 0, y: 0)
    }
    
}
