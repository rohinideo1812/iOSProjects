//
//  TableViewCell.swift
//  SideView
//
//  Created by BridgeLabz on 30/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class TableViewCell1: UITableViewCell {

    //Mark : IBOutlet
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var logoLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func commoninit(_imageName : String,label : String){
        logoImage.image = UIImage(named : _imageName)
        logoLabel.text = label
    }
}
