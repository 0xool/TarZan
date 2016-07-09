//
//  Family.swift
//  SanatSharif
//
//  Created by CyrusREfahi on 4/12/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

import Foundation

class Family {
    
    private var _ID : Int
    private var _Users : [User]
    
    var ID : Int{
        return self._ID
    }
    
    var Users : [User]{
        return self._Users
    }
    
    init(id : Int , users : [User] ){
        
        self._ID = id
        self._Users = users
        
    }
    
}