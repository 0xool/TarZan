//
//  Slider.swift
//  SanatSharif
//
//  Created by CyrusREfahi on 4/12/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

import Foundation

class Slider {
    
    private var _ID : Int
    private var _Slide : [Slide]
    
    var ID : Int{
        return self._ID
    }
    
    var slide : [Slide] {
        return self._Slide
    }
    
    init(id : Int , slide : [Slide]){
        
        self._Slide = slide
        self._ID = id
        
    }
    
}
