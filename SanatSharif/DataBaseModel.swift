//
//  DataBaseDataModel.swift
//  SanatSharif
//
//  Created by cyrus refahi on 7/20/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import Foundation

    typealias Users = (
    
        userID : Int64?,
        userName : String?,
        userLastName : String? ,
        userAddress : String? ,
        userEmail : String? ,
        userCartID : Int64? ,
        userFamilyID : Int64?
        
    )
    
    typealias Familly = (
    
        familyID : Int64?,
        userID : Int64?
        
    )
    
    typealias NonPaidCarts = (
    
        cartsID : Int64? ,
        cartUserID : Int64? ,
        cartTotal : Int64? ,
        itemID : Int64?
        
    )
    
    typealias Items = (
    
        itemID : Int64? ,
        productID : Int64? ,
        itemCount : Int64? ,
        itemTotalPrice : Int64?
    
    
    )
    
    typealias Products = (
        
        productID : Int64? ,
        productName : String? ,
        productPrice : Int64? ,
        productDate : Int64?
        
    )
    
    
    
    
