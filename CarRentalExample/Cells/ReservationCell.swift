//
//  ReservationCell.swift
//  CarRentalExample
//
//  Created by Bob Pascazio on 11/24/15.
//  Copyright © 2015 PACE. All rights reserved.
//

import UIKit

class ReservationCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(res:ReservationDB) {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd"
        let date = dateFormatter.stringFromDate(res.datetime!)
        let name = res.customer?.name
        let make = res.car?.make
        self.textLabel!.text = "\(date) \(name!) \(make!)"
    }
    
}
