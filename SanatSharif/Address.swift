//
//  Address.swift
//  SanatSharif
//
//  Created by CyrusREfahi on 4/12/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

import Foundation

class Address {
    
    private var _ID : Int
    private var _Street : String
    private var _Phone : Int
    private var _Label : String
    private var _Area : String
    
    var ID : Int{
        return self._ID
    }
    
    var Street : String{
        return self._Street
    }
    
    var Phone : Int {
        return self._Phone
    }
    
    var Label : String{
        return self._Label
    }
    
    var Area : String {
        return self._Area
    }
    
    init(id : Int , street : String , phone : Int , label : String , area : String){
        
        self._Area = area
        self._ID = id
        self._Label = label
        self._Phone = phone
        self._Street = street
        
    }
    
}