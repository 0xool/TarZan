//
//  Item.swift
//  SanatSharif
//
//  Created by CyrusREfahi on 4/12/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

import Foundation

class Item {
    
    private var _Product : Product!
    private var _Count : Int!
    private var _TotalPrice : Int!
    
    var product : Product{
        return self._Product
    }
    
    var Count : Int{
        return self._Count
    }
    
    var TotalPrice : Int{
        return self._TotalPrice
    }
    
    init(product : Product , count : Int , totalPrice : Int){
        
        self._Product = product
        self._TotalPrice = totalPrice
        self._Count = count
        
    }
    
    init(){
        
        
    }
    
    func increaseCount(){
        
        _Count = _Count + 1
        
    }
    
    func decreaseCount(){
        
        _Count = _Count - 1
        
    }
    
    
}