//
//  DateCell.swift
//  SanatSharif
//
//  Created by cyrus refahi on 8/6/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit
import JTAppleCalendar 

class DateCell: JTAppleDayCellView {

    @IBOutlet var selectedView : RoundViewWithShadowMaterial!
    @IBOutlet var dayLabel: UILabel!
    var normalDayColor = UIColor.blackColor()
    var weekendDayColor = UIColor.grayColor()
    
    
    func setupCellBeforeDisplay(cellState: CellState, date: NSDate , selected : Bool) {
        // Setup Cell text
        dayLabel.text =  cellState.text
        
        // Setup text color
        configureTextColor(cellState)
        
        if selected {
            
            self.selectedView.animateView()
            
        }
    }
    
    func cellCicked(){
        
        self.selectedView.animateView()
        
    }
    
    func configureTextColor(cellState: CellState) {
        if cellState.dateBelongsTo == .ThisMonth {
            dayLabel.textColor = normalDayColor
        } else {
            dayLabel.textColor = weekendDayColor
        }
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
}

extension UIColor {
//    convenience init(colorWithHexValue value: Int, alpha:CGFloat = 1.0){
//        self.init(
//            red: CGFloat((value & 0xFF0000) >> 16) / 255.0,
//            green: CGFloat((value & 0x00FF00) >> 8) / 255.0,
//            blue: CGFloat(value & 0x0000FF) / 255.0,
//            alpha: alpha
//        )
//    }
}
