//
//  ViewController.swift
//  CustomTableView
//
//  Created by BridgeLabz on 07/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let cellIdentifier = "CellIdentifier"
    var tableData: [String] = []
    var arrImageName: [String] = []
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CustomTableViewCell =
        tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as! CustomTableViewCell
        cell.imageView?.image = UIImage(named:self.arrImageName[indexPath.row])
        
        cell.labelField.text = self.tableData[indexPath.row]
        return cell

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableData = ["Christ Redeemer", "Great Wall of China", "Machu Picchu","Petra","Pyramid at Chichén Itzá","Roman Colosseum","Taj Mahal"]
        arrImageName = ["ChristRedeemer", "GreatWallOfChina", "MachuPicchu","Petra","PyramidChichenItza","RomanColosseum","TajMahal"]
        
    }


}

