//
//  FileManager.swift
//  SanatSharif
//
//  Created by cyrus refahi on 8/6/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import Foundation


class FileManager {
    
    
    func getDocumentsDirectory() -> NSString {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    func writeImagetoFile(imageNamed : String , image :  UIImage){
        
        if let data = UIImagePNGRepresentation(image) {
            let filename = getDocumentsDirectory().stringByAppendingPathComponent(imageNamed)
            data.writeToFile(filename, atomically: true)
        }
        
    }
    
    func readImageFromFile(imageNamed : String) -> UIImage{
        
        //        let path: String? = NSBundle.mainBundle().pathForResource(imageNamed, ofType: "png", inDirectory: getDocumentsDirectory() as String)
        let path = getDocumentsDirectory().stringByAppendingPathComponent(imageNamed)
        
        let imageFromPath = UIImage(contentsOfFile: path)!
        return imageFromPath
        
    }
    
}
