//
//  DataStoreManagerDB.swift
//  CarRentalExample
//
//  Created by Bob Pascazio on 11/12/15.
//  Copyright © 2015 PACE. All rights reserved.
//

import UIKit
import CoreData

protocol DataStoreOperationCompleted {
    func completed()
}

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
            
            //fetchRequest.predicate = NSPredicate(format: "name like 'b?b'")
            
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
            
            let bobpredicate = NSPredicate(format: "customer.name like 'b?b'")
            let janepredicate = NSPredicate(format: "customer.name like 'jane'")
            let compoundpredicate = NSCompoundPredicate(orPredicateWithSubpredicates: [bobpredicate, janepredicate])
            
            // fetchRequestRes.predicate = compoundpredicate
            fetchRequestRes.fetchLimit = 10
            
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
    
    func saveContext(delegate:DataStoreOperationCompleted?) {

        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
            
            dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)) {
                do {
                
                    try managedContext.save()
                    
                } catch let error as NSError {
                    
                    print("save failed: \(error.localizedDescription)")
                    
                }
                self.refreshManagedObjects()
            NSNotificationCenter.defaultCenter().postNotificationName("ContextUpdated", object: nil)

                dispatch_async(dispatch_get_main_queue()) {
                    if let delegate_ = delegate {
                        delegate_.completed()
                    }
                }
            }
       
    }
    
    func clearReservations() {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        do {
            
            // Fetch Reservations
            
            let fetchRequestRes = NSFetchRequest(entityName: "ReservationDB")
            
            let fetchedResultsRes = try managedContext.executeFetchRequest(fetchRequestRes) as? [ReservationDB]
            
            if let results = fetchedResultsRes {
                
                for reservation in results {
                    
                    managedContext.deleteObject(reservation)
                }
                
                try managedContext.save()
                
                reservations = [ReservationDB]()
                
            } else {
                print("error fetching from database")
            }
            
        } catch let error as NSError {
        
            print("Fetch failed: \(error.localizedDescription)")
        
        }
    
    }

}