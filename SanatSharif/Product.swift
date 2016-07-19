//
//  Product.swift
//  SanatSharif
//
//  Created by CyrusREfahi on 4/12/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

import Foundation

class Product {
    
    private var _ID : Int!
    private var _Name : String!
    private var _Price : Int!
    private var _ExpDate : Int!
    
//    private var _Demention : Demention!
//    private var _Picture : [Picture]!
//    private var _Category : Category!

    var ID : Int{
        return self._ID
    }
    
    var Name : String{
        return _Name
    }
    
    var Price : Int{
        return self._Price
    }
    
    var ExpDate : Int{
        return self._ExpDate
    }
    
//    var demention : Demention{
//        return self._Demention
//    }
//    
//    var picture : [Picture] {
//        return self._Picture
//    }
//    
//    var category : Category{
//        return self._Category
//    }
//    
    
    init(id : Int , name : String , price : Int , expDate : Int ){
        
        self._Price = price
        self._ID = id
        self._Name = name
        self._ExpDate = expDate
//        self._Category = category
//        self._Picture = picture
//        self._Demention = demention
        
        
    }
    

    

}
