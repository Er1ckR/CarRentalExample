//
//  AddCarVC.swift
//  CarRentalExample
//
//  Created by Bob Pascazio on 11/17/15.
//  Copyright © 2015 PACE. All rights reserved.
//

import UIKit

class AddCarVC: UIViewController, DataStoreOperationCompleted {

    @IBOutlet weak var carMakeField: UITextField!

    let DSMDB = DataStoreManagerDB.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveHit(sender: AnyObject) {
        
        let car = DSMDB.createCar()
        car?.make = self.carMakeField.text
        DSMDB.saveContext(self)
        
    }

    @IBAction func cancelHit(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
 
    // MARK: - DataStoreOperationCompleted

    func completed() {

        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
