//
//  User.swift
//  SanatSharif
//
//  Created by CyrusREfahi on 4/12/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

import Foundation

class User {
    
    private var _ID : Int!
    private var _FName : String!
    private var _LName : String!
    
    private var _Address : [Address]!
    private var _Family : Family!
    private var _Cart : [Cart]!
    
    var ID : Int{
        return self._ID
    }
    
    var FName : String{
        return self._FName
    }
    
    var LName : String{
        return self._LName
    }
    
    var address : [Address]{
        return self._Address
    }
    
    var famlily : Family{
        return self._Family
    }
    
    var cart : [Cart]{
        return self._Cart
    }
    
    init(id : Int , Fname : String , Lname : String , address : [Address] , family : Family , cart : [Cart]){
        
        self._Address = address
        self._Cart = cart
        self._Family = family
        self._FName = Fname
        self._ID = id
        self._LName = Lname
        
        
    }
    
    init(){
        
        
    }
    
    
}
