//
//  DataStoreManagerMem.swift
//  CarRentalExample
//
//  Created by Bob Pascazio on 11/5/15.
//  Copyright © 2015 PACE. All rights reserved.
//

import Foundation

class DataStoreManagerMem: NSObject {
    
    class var sharedInstance: DataStoreManagerMem {
        struct Singleton {
            static let instance = DataStoreManagerMem()
        }
        return Singleton.instance
    }
    
    override init() {
        
        super.init()
        addCustomer(Customer(name:"Bob"))
        addCustomer(Customer(name:"Joe"))
        
    }
    
    var customerList = [Customer]()
    
    func getCustomerList() -> [Customer]? {
        
        return customerList
    }
    
    func addCustomer(name:Customer) {
        
        customerList.append(name)
    }
    
}