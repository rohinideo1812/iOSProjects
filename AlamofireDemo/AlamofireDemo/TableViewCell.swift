//
//  TableViewCell.swift
//  AlamofireDemo
//
//  Created by BridgeLabz on 25/06/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit


class TableViewCell: UITableViewCell {

    @IBOutlet weak var firstName: UILabel!
    
    @IBOutlet weak var secondName: UILabel!
    
    @IBOutlet weak var city: UILabel!
    
    @IBOutlet weak var mobileNo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
