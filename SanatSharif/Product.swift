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
    private var _imageSRC : String!
    
//    private var _Demention : Demention!
//    private var _Picture : [Picture]!
//    private var _Category : Category!

    var ID : Int{
        get{
            return self._ID
        }
        set{
            _ID = newValue
        }
    }
    
    var Name : String{
        get{
            return _Name
        }
        set{
            _Name = newValue
        }
    }
    
    var Price : Int{
        get{
            return self._Price
        }
        set{
            _Price = newValue
        }
    }
    
    var ExpDate : Int{
        get{
            return self._ExpDate
        }
        set{
            _ExpDate = newValue
        }
    }
    
    var imageSRC : String{
        get{
            return _imageSRC
        }
        set{
            _imageSRC = newValue
        }
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
    
    init(){
        
        
        
        
    }
    

    

}
