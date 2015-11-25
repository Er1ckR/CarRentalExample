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
        dateFormatter.dateFormat = "yyyy-MM-dd 'at' h:mm a"
        let str = dateFormatter.stringFromDate(res.datetime!)
        
        self.textLabel!.text = str
    }
    
}
