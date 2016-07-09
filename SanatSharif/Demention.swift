//
//  Demention.swift
//  SanatSharif
//
//  Created by CyrusREfahi on 4/12/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

import Foundation

class Demention {
    
    private var _ID : Int!
    private var _Name : String!
    private var _Amount : Int!
    
    var ID : Int{
        return self._ID
    }
    
    var Name : String{
        return self._Name
    }
    
    var Amount : Int{
        return self._Amount
    }
    
    init(id : Int , name : String , amount : Int){
        
        self._ID = id
        self._Amount = amount
        self._Name = name
        
    }
    
    
}
