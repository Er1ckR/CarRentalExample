//
//  CustomerCell.swift
//  CarRentalExample
//
//  Created by Bob Pascazio on 11/5/15.
//  Copyright © 2015 PACE. All rights reserved.
//

import UIKit

class CustomerCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(customer:CustomerDB) {
        self.textLabel!.text = customer.name
        self.detailTextLabel!.text = customer.age?.stringValue
        
        if let imageData_ = customer.image {
            let image = UIImage(data: imageData_)
            self.imageView!.image = image
        }
    }

}
