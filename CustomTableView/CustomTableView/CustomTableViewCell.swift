//
//  CustomTableViewCell.swift
//  CustomTableView
//
//  Created by BridgeLabz on 07/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var imageField: UIImageView!
    @IBOutlet weak var labelField: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        labelField.sizeToFit()
        // Initialization code
    }


}
