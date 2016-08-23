//
//  UserModelManager.swift
//  SanatSharif
//
//  Created by CyrusREfahi on 4/19/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

import Foundation

class UserModelManager {
    
    static let sharedInstance = UserModelManager()
    
    
    var _User : User = User ()
    var _Cart : Cart = Cart()
    var _dataControler : DataController = DataController()
    var _recentSearchController : CoreDataRecentSearchManager = CoreDataRecentSearchManager()
    var _basketInfo : [Basket] = [Basket]()
    
    func createNewCart(cart : Cart){
        
        
        
    }
    
    
    
    
    
}
