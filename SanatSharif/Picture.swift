//
//  Picture.swift
//  SanatSharif
//
//  Created by CyrusREfahi on 4/12/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

import Foundation

class Picture {
    
    private var _Src : String!
    private var _Height : Int!
    private var _Weight : Int!
    
    var Src : String{
        return self._Src
    }
    
    var Height : Int{
        return self._Height
    }
    
    var Weight : Int{
        return self._Weight
    }
    
    init(src : String , height : Int , weight : Int){
        
        self._Weight = weight
        self._Height = height
        self._Src = src
        
    }
    
    init(){
        
    }
    
}