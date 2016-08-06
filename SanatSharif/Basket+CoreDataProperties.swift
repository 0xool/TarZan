//
//  Basket+CoreDataProperties.swift
//  
//
//  Created by cyrus refahi on 8/6/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Basket {

    @NSManaged var bDate: NSDate?
    @NSManaged var bDiscription: String?
    @NSManaged var bImage: String?
    @NSManaged var bName: String?
    @NSManaged var bNotif: NSNumber?
    @NSManaged var relationship: NSManagedObject?

}
