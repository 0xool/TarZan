//
//  List.swift
//  SanatSharif
//
//  Created by CyrusREfahi on 4/12/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

import Foundation

class List {
    
    private var _ID : Int
    private var _Type : String
    private var _SubList : SubList
    
    var ID : Int{
        return self._ID
    }
    
    var Type : String{
        return self._Type
    }
    
    var subList : SubList{
        return self._SubList
    }
    
    init(id : Int , type : String , subList : SubList){

        self._ID = id
        self._SubList = subList
        self._Type = type
        
    }
    
    
}