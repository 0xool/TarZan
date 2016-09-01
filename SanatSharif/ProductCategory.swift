//
//  ProductCategory.swift
//  SanatSharif
//
//  Created by cyrus refahi on 9/1/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import Foundation

class ProductCategory : NSObject {
    
    private var _count : Int!
    private var _desc : String!
    private var _display : String!
    
    private var _id : Int!
    private var _imageSRC : String!
    private var _name : String!
    
    private var _parent : Int!
    private var _slug : String!
    
    
    var ID : Int {
        get{
            return _id
        }set{
            _id = newValue
        }
    }
    
    var count : Int {
        get{
            return _count
        }
        set{
            _count = newValue
        }
    }
    
    var desc : String{
        get {
            return _desc
        }
        set
        {
            _desc  = newValue
        }
    }
    
    var dispaly : String {
        get{
           return _display
        }
        set{
            _display = newValue
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
    
    var name : String{
        get{
            return _name
        }
        set{
           _name = newValue
        }
    }
    
    var parent : Int {
        get{
           return _parent
        }
        set{
            _parent = newValue
        }
    }
    
    var slug : String{
    
        get{
           return _slug
        }
        set{
            _slug = newValue
        }
        
    }
    
    
    
    
    
    
    
}
