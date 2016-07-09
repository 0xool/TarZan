//
//  SubList.swift
//  SanatSharif
//
//  Created by CyrusREfahi on 4/12/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

import Foundation

class SubList {
    
    private var _ID : Int
    private var _Name : String
    private var _Products : [Product]
    private var _Slide : Slide
    
    var ID : Int{
        return self._ID
    }
    
    var Name : String{
        return self._Name
    }
    
    var Products : [Product]{
        return self._Products
    }
    
    var slide : Slide{
        return self._Slide
    }
    
    init(id : Int , name : String , product : [Product] , slide : Slide){
        
        self._ID = id
        self._Name = name
        self._Products = product
        self._Slide = slide
        
    }
    
    
}
