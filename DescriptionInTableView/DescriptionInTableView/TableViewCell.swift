//
//  TableViewCell.swift
//  DescriptionInTableView
//
//  Created by BridgeLabz on 02/06/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit
protocol tableViewSetDelegate {
    func didBtnSelect(indexPath : IndexPath)
}


class TableViewCell: UITableViewCell {

    @IBOutlet weak var labelField: UILabel!
    
    @IBOutlet weak var btn: UIButton!
    var delegate : tableViewSetDelegate! = nil
    var indexpath : IndexPath?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func btnPress(_ sender: UIButton) {
        delegate.didBtnSelect(indexPath: indexpath!)
        
    }
    

}
