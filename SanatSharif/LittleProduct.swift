//
//  LittleProduct.swift
//  SanatSharif
//
//  Created by CyrusREfahi on 4/12/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

import Foundation

class LittleProduct : Product{
    

    
    private var _Picture : Picture

    var Sinlepicture : Picture{
        
        return self._Picture
        
    }
    
    init(picture : Picture , id : Int , name : String , price : Int , expDate : Int , demention : Demention  , category : Category , pictures : [Picture]) {
        self._Picture = picture
        super.init(id: id, name: name, price: price, expDate: expDate)
    }
    
    
    
    
    
}
