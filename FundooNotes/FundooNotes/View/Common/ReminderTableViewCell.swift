//
//  ReminderTableViewCell.swift
//  FundooNotes
//
//  Created by BridgeLabz on 19/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class ReminderTableViewCell: UITableViewCell {

    //Mark: IBOutlet
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var labelField: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
