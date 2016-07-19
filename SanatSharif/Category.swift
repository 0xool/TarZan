//
//  Category.swift
//  SanatSharif
//
//  Created by CyrusREfahi on 4/12/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

import Foundation

class Category{
 
    private var _ID : Int
    private var _Name : String
    private var _Picture : Picture
    private var _link : String
    
    var Link : String {
        return self._link
    }
    
    var ID : Int{
        return self._ID
    }
    
    var Name : String{
        return self._Name
    }
    
    var picture : Picture{
        return self._Picture
    }
    
    
    init(id : Int , name : String , picture : Picture , link : String){

        self._ID = id
        self._link = link
        self._Name = name
        self._Picture = picture
        
    }

}