//
//  DataBaseManager.swift
//  SanatSharif
//
//  Created by CyrusREfahi on 4/22/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

import Foundation
import SQLite

protocol DataManagerProtocol {
    associatedtype T
    static func createTable() throws -> Void
    static func insert(item: T) throws -> Int64
    static func delete(item: T) throws -> Void
    static func findAll() throws -> [T]?
}

enum DataAccessError: ErrorType {
    case Datastore_Connection_Error
    case Insert_Error
    case Delete_Error
    case Search_Error
    case Nil_In_Data
}

class DataBaseManager {
    
     static let Database = DataBaseManager()
    
   
//    static let sharedInstance = SQLiteDataStore()
    let BBDB: Connection?
    
    private init() {
        
        var path = "BaseballDB.sqlite"
        
        if let dirs: [NSString] =
            NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,
                                                NSSearchPathDomainMask.AllDomainsMask, true) as [NSString] {
            
            let dir = dirs[0]
            path = dir.stringByAppendingPathComponent("BaseballDB.sqlite");
            print(path)
        }
        
        do {
            BBDB = try Connection(path)
        } catch _ {
            BBDB = nil
        }
    }
    
    
    func createTables() throws{
        do {
            try UserManager.createTable()
            
        } catch {
            throw DataAccessError.Datastore_Connection_Error
        }
        
    }
    
    
    
    
    
    
    
    
    
    class UserManager: DataManagerProtocol {
        
        static let TABLE_NAME = "Users"
        
        static let table = Table(TABLE_NAME)
        static let userID = Expression<Int64>("userID")
        static let userName = Expression<String>("userName")
        static let userEmail = Expression<String>("userEmail")
        static let userLastName = Expression<String>("userLatName")
        static let userAddress = Expression<String>("userAddress")
        static let userCartID = Expression<Int64>("userCartID")
        static let userFamilyID = Expression<Int64>("userFamilyID")
        
        typealias T = Users
        
        static func createTable() throws {
         
            guard let DB = DataBaseManager.Database.BBDB else {
                throw DataAccessError.Datastore_Connection_Error
            }
            do {
                let _ = try DB.run( table.create(ifNotExists: true) {t in
                    t.column(userID, primaryKey: true)
                    t.column(userName)
                    t.column(userEmail , unique : true)
                    t.column(userLastName)
                    t.column(userAddress)
                    t.column(userCartID)
                    t.column(userFamilyID)
                    })

            } catch _ {

            // Error throw if table already exists
            }
            
        }
        
        static func insert(item: T) throws -> Int64 {
            
            guard let DB = DataBaseManager.Database.BBDB else {
                throw DataAccessError.Datastore_Connection_Error
            }
            if (item.userID != nil && item.userName != nil && item.userEmail != nil && item.userAddress != nil && item.userCartID != nil ) {
                if (item.userFamilyID != nil  && item.userLastName != nil && item.userCartID != nil) {
            
                let insert = table.insert(userID <- item.userID!, userName <- item.userName!, userEmail <- item.userEmail! , userLastName <- item.userLastName! , userAddress <- item.userAddress! , userCartID <- item.userCartID! , userFamilyID <- item.userFamilyID!)
                do {
                    let rowId = try DB.run(insert)
                    guard rowId > 0 else {
                        throw DataAccessError.Insert_Error
                    }
                    return rowId
                } catch _ {
                    throw DataAccessError.Insert_Error
                }
            }
            }
            throw DataAccessError.Nil_In_Data
            
            
        }
        
        static func delete(item: T) throws {
           
            guard let DB = DataBaseManager.Database.BBDB else {
                throw DataAccessError.Datastore_Connection_Error
            }
            if let id = item.userID {
                let query = table.filter(userID == id)
                do {
                    let tmp = try DB.run(query.delete())
                    guard tmp == 1 else {
                        throw DataAccessError.Delete_Error
                    }
                } catch _ {
                    throw DataAccessError.Delete_Error
                }
            }
            
            
        }
        
        
        static func find(id: Int64) throws -> T? {
            guard let DB = DataBaseManager.Database.BBDB else {
                throw DataAccessError.Datastore_Connection_Error
            }
            let query = table.filter(userID == id)
            let users = try DB.prepare(query)
            for user in users {
                return Users(userID : user[userID], userName : user[userName] , userLastName : user[userLastName] , userAddress : user[userAddress] , userEmail : user[userEmail] , userCartID : user[userCartID] , userFamilyID : user[userFamilyID])
            }
            
            return nil
            
        }
        
        static func findAll() throws -> [UserManager.T]? {
            
            guard let DB = DataBaseManager.Database.BBDB else {
                throw DataAccessError.Datastore_Connection_Error
            }
            var retArray = [T]()
            let users = try DB.prepare(table)
            for user in users {
                retArray.append(Users(userID : user[userID], userName : user[userName] , userLastName : user[userLastName] , userAddress : user[userAddress] , userEmail : user[userEmail] , userCartID : user[userCartID] , userFamilyID : user[userFamilyID]))
            }
            
            return retArray
            
        }
        
        
    
    }
    
    class FamilyManager : DataManagerProtocol {
        
        static let TABLE_NAME = "Family"
        
        static let table = Table(TABLE_NAME)
        static let userID = Expression<Int64>("familyID")
        static let userName = Expression<String>("userID")
        
        typealias T = Users
        
        
    }
    
    
    
    
    
    
}
