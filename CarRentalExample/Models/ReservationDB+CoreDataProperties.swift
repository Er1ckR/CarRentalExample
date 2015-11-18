//
//  ReservationDB+CoreDataProperties.swift
//  CarRentalExample
//
//  Created by Bob Pascazio on 11/17/15.
//  Copyright © 2015 PACE. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension ReservationDB {

    @NSManaged var datetime: NSDate?
    @NSManaged var pickedup: NSNumber?
    @NSManaged var car: CarDB?
    @NSManaged var customer: CustomerDB?

}
