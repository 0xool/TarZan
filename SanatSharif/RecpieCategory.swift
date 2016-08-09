//
//  RecpieCategory.swift
//  SanatSharif
//
//  Created by cyrus refahi on 8/9/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import Foundation

class RecpieCategory {
    
    
    private var _categoryImage : UIImage!
    private var _categoryName : String!
    private var _categoryDesc : String!
    
    
    var categoryImage : UIImage {
        get{
            return _categoryImage
        }
        
        set{
            _categoryImage = newValue
        }
    }
    
    var categoryName : String{
        get{
            return _categoryName
        }set{
            _categoryName = newValue
        }
    }
    
    var categoryDesc : String {
        get{
            return _categoryDesc
        }set{
            _categoryDesc = newValue
        }
    }
    
    
    
    
    
    
    
}
