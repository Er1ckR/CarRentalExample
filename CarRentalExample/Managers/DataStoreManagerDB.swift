//
//  DataStoreManagerDB.swift
//  CarRentalExample
//
//  Created by Bob Pascazio on 11/12/15.
//  Copyright © 2015 PACE. All rights reserved.
//

import UIKit
import CoreData

class DataStoreManagerDB: NSObject {
   
    var customers:[CustomerDB]? = [CustomerDB]()
    var cars:[CarDB]? = [CarDB]()
    var reservations:[ReservationDB]? = [ReservationDB]()

    class var sharedInstance: DataStoreManagerDB {
        struct Singleton {
            static let instance = DataStoreManagerDB()
        }
        return Singleton.instance
    }
    
    override init() {
        
        super.init()
  
        self.refreshManagedObjects()
        
    }
    
    func refreshManagedObjects() {

        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        do {
            
            // Fetch Customers
            
            let fetchRequest = NSFetchRequest(entityName: "CustomerDB")
            
            let fetchedResults = try managedContext.executeFetchRequest(fetchRequest) as? [CustomerDB]
            
            if let results = fetchedResults {
                customers = results
            } else {
                print("error fetching from database")
            }
            
            // Fetch Cars
            
            let fetchRequestCars = NSFetchRequest(entityName: "CarDB")
            
            let fetchedResultsCars = try managedContext.executeFetchRequest(fetchRequestCars) as? [CarDB]
            
            if let results = fetchedResultsCars {
                cars = results
            } else {
                print("error fetching from database")
            }
            
            // Fetch Reservations
            
            let fetchRequestRes = NSFetchRequest(entityName: "ReservationDB")
            
            let fetchedResultsRes = try managedContext.executeFetchRequest(fetchRequestRes) as? [ReservationDB]
            
            if let results = fetchedResultsRes {
                reservations = results
            } else {
                print("error fetching from database")
            }
            
        } catch let error as NSError {
            
            print("Fetch failed: \(error.localizedDescription)")
            
        }

    }
    
    func getCustomerList() -> [CustomerDB]? {
        
        return customers
    }
    
    func getCarsList() -> [CarDB]? {
        
        return cars
    }
    
    func getReservationsList() -> [ReservationDB]? {
        
        return reservations
    }
    
    func createReservation() -> ReservationDB? {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let entity = NSEntityDescription.entityForName("ReservationDB", inManagedObjectContext: managedContext)
        
        let res:ReservationDB? = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext:managedContext) as? ReservationDB
        
        return res
        
    }
    
    func createCustomer() -> CustomerDB? {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
            
        let entity = NSEntityDescription.entityForName("CustomerDB", inManagedObjectContext: managedContext)
            
        let customer:CustomerDB? = NSManagedObject(entity: entity!,
                insertIntoManagedObjectContext:managedContext) as? CustomerDB
        
        return customer
        
    }
    
    func createCar() -> CarDB? {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let entity = NSEntityDescription.entityForName("CarDB", inManagedObjectContext: managedContext)
        
        let car:CarDB? = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext:managedContext) as? CarDB
        
        return car
    }
    
    func saveContext() {

        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        do {

            try managedContext.save()
            
        } catch let error as NSError {
            
            print("save failed: \(error.localizedDescription)")
            
        }
        
        self.refreshManagedObjects()
    }

}