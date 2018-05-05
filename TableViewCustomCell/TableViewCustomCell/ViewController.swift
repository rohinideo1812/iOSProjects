//
//  ViewController.swift
//  TableViewCustomCell
//
//  Created by BridgeLabz on 06/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let cellIdentifier = "CellIdentifier"
      var tableData: [String] = []
    var arrImageName: [String] = []
     let cellSpacingHeight: CGFloat = 4
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as UITableViewCell
        
        // Fetch Fruit
        let tabledata = tableData[indexPath.row]
        let imageData = arrImageName[indexPath.row]
        // Configure Cell
        cell.textLabel?.text = tabledata
        cell.imageView?.image = UIImage(named : imageData)
        return cell
    }
    
    

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
  tableData = ["Christ Redeemer", "Great Wall of China", "Machu Picchu","Petra","Pyramid at Chichén Itzá","Roman Colosseum","Taj Mahal"]
  arrImageName = ["ChristRedeemer", "GreatWallOfChina", "MachuPicchu","Petra","PyramidChichenItza","RomanColosseum","TajMahal"]
   
    }

    


}

