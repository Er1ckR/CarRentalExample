//
//  CustomerDB+CoreDataProperties.swift
//  CarRentalExample
//
//  Created by Bob Pascazio on 11/12/15.
//  Copyright © 2015 PACE. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension CustomerDB {

    @NSManaged var name: String?
    @NSManaged var image: NSData?

}
