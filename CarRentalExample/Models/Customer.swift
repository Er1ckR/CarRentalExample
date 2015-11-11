//
//  Customer.swift
//  CarRentalExample
//
//  Created by Bob Pascazio on 11/5/15.
//  Copyright © 2015 PACE. All rights reserved.
//

import Foundation

class Customer: NSObject {
    var name:String?
    var photo:NSData?
    
    init(name:String) {
        self.name = name
    }
    
    init(name:String, photo:NSData) {
        self.name = name
        self.photo = photo
    }
}