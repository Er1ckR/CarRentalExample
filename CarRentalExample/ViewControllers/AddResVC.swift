//
//  AddResVC.swift
//  CarRentalExample
//
//  Created by Bob Pascazio on 11/24/15.
//  Copyright © 2015 PACE. All rights reserved.
//

import UIKit

class AddResVC: UITableViewController {

    let DSMDB = DataStoreManagerDB.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        tableView.registerNib(UINib(nibName: "CustomerCell", bundle: nil), forCellReuseIdentifier: "customerCellID")
        tableView.registerNib(UINib(nibName: "CarsCell", bundle: nil), forCellReuseIdentifier: "carCellID")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // #warning Incomplete implementation, return the number of rows
        var rows = 0
        if section == 0 {
            rows = DSMDB.getCarsList()!.count
        } else if section == 1 {
            rows = DSMDB.getCustomerList()!.count
        }
        return rows
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell?
        
        if indexPath.section == 0 {

            let carCell = tableView.dequeueReusableCellWithIdentifier("carCellID", forIndexPath: indexPath) as! CarsCell
            
            // Configure the cell...
            let carsList = DSMDB.getCarsList()
            
            if let carsList_:[CarDB] = carsList {
                let car = carsList_[indexPath.row]
                carCell.configure(car)
            }
            cell = carCell
        } else {
            
            let custCell = tableView.dequeueReusableCellWithIdentifier("customerCellID", forIndexPath: indexPath) as! CustomerCell
            
            // Configure the cell...
            let customerList = DSMDB.getCustomerList()
            
            if let customerList_:[CustomerDB] = customerList {
                let customer = customerList_[indexPath.row]
                custCell.configure(customer)
            }
            cell = custCell
        }
        
        return cell!
    }
    
    override func viewWillDisappear(animated: Bool) {
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
