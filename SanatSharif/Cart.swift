//
//  Cart.swift
//  SanatSharif
//
//  Created by CyrusREfahi on 4/12/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

import Foundation

class Cart {
    
    private var _User : User
    private var _Item : [Item]
    private var _Total : Int
    private var _ID : Int
    
    var user : User{
        return self._User
    }
    
    var ID : Int{
        return _ID
    }
    
    var Total : Int{
        return self._Total
    }
    
    var item : [Item]{
        return self._Item
    }
    
    init(id : Int , total : Int , user : User , item : [Item] ){
        
        self._ID = id
        self._Item = item
        self._Total = total
        self._User = user
        
        
    }
    
}

