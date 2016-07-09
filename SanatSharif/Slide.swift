//
//  Slide.swift
//  SanatSharif
//
//  Created by CyrusREfahi on 4/12/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

import Foundation

class Slide {
    
    private var _ID : Int
    private var _Picture : Picture
    private var _Link : String
    private var _Type : String
    
    var ID : Int{
        return self._ID
    }
    
    var picture : Picture{
        return self._Picture
    }
    
    var Link : String{
        return self._Link
    }
    
    var Type : String{
        return self._Type
    }
    
    init(id : Int , picture : Picture , link : String , type : String){
        
        self._ID = id
        self._Link = link
        self._Type = type
        self._Picture = picture
        
    }
    
}