//
//  TableViewCell.swift
//  MultipleTableViewOnSingleViewController
//
//  Created by BridgeLabz on 11/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
