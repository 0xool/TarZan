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
        
        var path = "TarzanDB.sqlite"
        
        if let dirs: [NSString] =
            NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,
                                                NSSearchPathDomainMask.AllDomainsMask, true) as [NSString] {
            
            let dir = dirs[0]
            path = dir.stringByAppendingPathComponent("TarzanDB.sqlite");
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
        
        static let TABLE_NAME = "Familly"
        
        static let table = Table(TABLE_NAME)
        static let familyID = Expression<Int64>("familyID")
        static let userID = Expression<Int64>("userID")
        
        typealias T = Familly
        
        
        static func createTable() throws {
            
            guard let DB = DataBaseManager.Database.BBDB else {
                throw DataAccessError.Datastore_Connection_Error
            }
            do {
                let _ = try DB.run( table.create(ifNotExists: true) {t in
                    t.column(familyID , primaryKey: true)
                    t.column(userID)
                    })
                
            } catch _ {
                
                // Error throw if table already exists
            }
            
        }
        
        static func insert(item: T) throws -> Int64 {
            
            guard let DB = DataBaseManager.Database.BBDB else {
                throw DataAccessError.Datastore_Connection_Error
            }
            if (item.userID != nil && item.familyID != nil ) {
                    
                    let insert = table.insert(familyID <- item.familyID! )
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
            throw DataAccessError.Nil_In_Data
            
            
        }
        
        static func delete(item: T) throws {
            
            guard let DB = DataBaseManager.Database.BBDB else {
                throw DataAccessError.Datastore_Connection_Error
            }
            if let id = item.familyID {
                let query = table.filter(familyID == id)
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
            let query = table.filter(familyID == id)
            let Family = try DB.prepare(query)
            for f in Family {
                return Familly(familyID : f[familyID], userID : f[userID])
            }
            return nil
            
        }
        
        static func findAll() throws -> [FamilyManager.T]? {
            
            guard let DB = DataBaseManager.Database.BBDB else {
                throw DataAccessError.Datastore_Connection_Error
            }
            var retArray = [T]()
            let Family = try DB.prepare(table)
            for f in Family {
                retArray.append(Familly(userID : f[userID], familyID : f[familyID]))
            }
            
            return retArray
            
        }
        
        
        
    }
    
    class CartManager : DataManagerProtocol {
        
        static let TABLE_NAME = "NonPaidCarts"
        
        static let table = Table(TABLE_NAME)
        static let cartsID = Expression<Int64>("cartID")
        static let cartUserID = Expression<Int64>("cartUserID")
        static let cartTotal = Expression<Int64>("cartTotal")
        static let itemID = Expression<Int64>("itemID")
        
        typealias T = NonPaidCarts
        
        
        static func createTable() throws {
            
            guard let DB = DataBaseManager.Database.BBDB else {
                throw DataAccessError.Datastore_Connection_Error
            }
            do {
                let _ = try DB.run( table.create(ifNotExists: true) {t in
                    t.column(cartsID , primaryKey: true)
                    t.column(cartUserID)
                    t.column(itemID)
                    t.column(cartTotal)
                    })
                
            } catch _ {
                
                // Error throw if table already exists
            }
            
        }
        
        static func insert(item: T) throws -> Int64 {
            
            guard let DB = DataBaseManager.Database.BBDB else {
                throw DataAccessError.Datastore_Connection_Error
            }
            if (item.cartsID != nil && item.cartUserID != nil && item.cartTotal != nil && item.itemID != nil ) {
                
                let insert = table.insert(cartsID <- item.cartsID! , cartUserID <- item.cartUserID! , cartTotal <- item.cartTotal! , itemID <- item.itemID! )
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
            throw DataAccessError.Nil_In_Data
            
            
        }
        
        static func delete(item: T) throws {
            
            guard let DB = DataBaseManager.Database.BBDB else {
                throw DataAccessError.Datastore_Connection_Error
            }
            if let id = item.cartsID {
                let query = table.filter(cartsID == id)
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
            let query = table.filter(cartsID == id)
            let Cart = try DB.prepare(query)
            for cart in Cart {
                return NonPaidCarts(cartsID : cart[cartsID], cartUserID : cart[cartUserID] , cartTotal : cart [cartTotal] , itemID : cart[itemID])
            }
            return nil
            
        }
        
        static func findAll() throws -> [CartManager.T]? {
            
            guard let DB = DataBaseManager.Database.BBDB else {
                throw DataAccessError.Datastore_Connection_Error
            }
            var retArray = [T]()
            let Cart = try DB.prepare(table)
            for cart in Cart {
                retArray.append(NonPaidCarts(cartsID : cart[cartsID], cartUserID : cart[cartUserID] , cartTotal : cart [cartTotal] , itemID : cart[itemID]))
            }
            
            return retArray
            
        }
        
        
        
    }
    
    class ItemManager : DataManagerProtocol {
        
        static let TABLE_NAME = "Items"
        
        static let table = Table(TABLE_NAME)
        static let itemID = Expression<Int64>("itemID")
        static let productID = Expression<Int64>("productID")
        static let itemCount = Expression<Int64>("itemCount")
        static let itemTotalPrice = Expression<Int64>("itemTotalPrice")
        
        typealias T = Items
        
        
        static func createTable() throws {
            
            guard let DB = DataBaseManager.Database.BBDB else {
                throw DataAccessError.Datastore_Connection_Error
            }
            do {
                let _ = try DB.run( table.create(ifNotExists: true) {t in
                    t.column(itemID , primaryKey: true)
                    t.column(productID)
                    t.column(itemCount)
                    t.column(itemTotalPrice)
                    })
                
            } catch _ {
                
                // Error throw if table already exists
            }
            
        }
        
        static func insert(item: T) throws -> Int64 {
            
            guard let DB = DataBaseManager.Database.BBDB else {
                throw DataAccessError.Datastore_Connection_Error
            }
            if (item.itemID != nil && item.productID != nil && item.itemCount != nil && item.itemTotalPrice != nil ) {
                
                let insert = table.insert(itemID <- item.itemID! , productID <- item.productID! , itemCount <- item.itemCount! , itemTotalPrice <- item.itemTotalPrice! )
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
            throw DataAccessError.Nil_In_Data
            
            
        }
        
        static func delete(item: T) throws {
            
            guard let DB = DataBaseManager.Database.BBDB else {
                throw DataAccessError.Datastore_Connection_Error
            }
            if let id = item.itemID {
                let query = table.filter(itemID == id)
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
            let query = table.filter(itemID == id)
            let ItemQuery = try DB.prepare(query)
            for item in ItemQuery {
                return Items(itemID : item[itemID], productID : item[productID] , itemCount : item[itemCount] , itemTotalPrice : item[itemTotalPrice])
            }
            return nil
            
        }
        
        static func findAll() throws -> [ItemManager.T]? {
            
            guard let DB = DataBaseManager.Database.BBDB else {
                throw DataAccessError.Datastore_Connection_Error
            }
            var retArray = [T]()
            let ItemQuery = try DB.prepare(table)
            for item in  ItemQuery{
                retArray.append(Items(itemID : item[itemID], productID : item[productID] , itemCount : item[itemCount] , itemTotalPrice : item[itemTotalPrice]))
            }
            
            return retArray
            
        }
        
        
        
    }
    
    
    class ProductManager : DataManagerProtocol {
        
        static let TABLE_NAME = "Products"
        
        static let table = Table(TABLE_NAME)
        static let productID = Expression<Int64>("productID")
        static let productName = Expression<String>("productName")
        static let productPrice = Expression<Int64>("productPrice")
        static let productDate = Expression<Int64>("productDate")
        
        typealias T = Products
        
        
        static func createTable() throws {
            
            guard let DB = DataBaseManager.Database.BBDB else {
                throw DataAccessError.Datastore_Connection_Error
            }
            do {
                let _ = try DB.run( table.create(ifNotExists: true) {t in
                    t.column(productID , primaryKey: true)
                    t.column(productName)
                    t.column(productPrice)
                    t.column(productDate)
                    })
                
            } catch _ {
                
                // Error throw if table already exists
            }
            
        }
        
        static func insert(item: T) throws -> Int64 {
            
            guard let DB = DataBaseManager.Database.BBDB else {
                throw DataAccessError.Datastore_Connection_Error
            }
            if (item.productID != nil && item.productName != nil && item.productPrice != nil && item.productDate != nil ) {
                
                let insert = table.insert(productID <- item.productID! , productDate <- item.productDate! , productName <- item.productName! , productPrice <- item.productPrice! )
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
            throw DataAccessError.Nil_In_Data
            
            
        }
        
        static func delete(item: T) throws {
            
            guard let DB = DataBaseManager.Database.BBDB else {
                throw DataAccessError.Datastore_Connection_Error
            }
            if let id = item.productID {
                let query = table.filter(productID == id)
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
            let query = table.filter(productID == id)
            let productQuery = try DB.prepare(query)
            for product in productQuery  {
                return Products(productID : product[productID], productName : product[productName] , productPrice : product[productPrice] , productDate :product[productDate])
            }
            return nil
            
        }
        
        static func findAll() throws -> [ProductManager.T]? {
            
            guard let DB = DataBaseManager.Database.BBDB else {
                throw DataAccessError.Datastore_Connection_Error
            }
            var retArray = [T]()
            let productQuert = try DB.prepare(table)
            for product in productQuert {
                retArray.append(Products(productID : product[productID], productName : product[productName] , productPrice : product[productPrice] , productDate :product[productDate]))
            }
            
            return retArray
            
        }
        
        
        
    }
    
    
    
    
}
