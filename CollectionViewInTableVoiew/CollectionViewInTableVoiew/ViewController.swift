//
//  ViewController.swift
//  CollectionViewInTableVoiew
//
//  Created by BridgeLabz on 09/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource ,TableViewCell3Delegate{
    @IBOutlet weak var tableView: UITableView!
//    var obj : TableViewCell3Delegate?
    func tapped(_ index:Int) {
        print("index = \(index)")
    }
    var textarray = ["Google LLC is an American multinational technology company that specializes in Internet-related services and products,","Google LLC is an American multinational technology company that specializes in Internet-related services and products, which include online advertising technologies, search engine, cloud computing, software, and hardware. Google was founded in 1998 by Larry Page and Sergey Brin while they were Ph.D. students at ...","Google, Inc (NASDAQ: GOOG), is a U.S. public corporation, first estaiblisht as a privately-hauden corporation in 1998, that designed an guidit the Internet Google sairch ingine. Google is heidit at the Googleplex in Muntain View, Californie an haes owre 4,000 wankers in its employ. Dr. Eric Schmidt, ance CEO o Novell, wis ...","","earch engine, cloud computing, software, and hardware. Google was founded in","Search engine, cloud computing, software, and hardware. Google was founded in","Rohini","","earch engine, cloud computing, software, and hardware. Google was founded in"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return textarray.count
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
     if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell3") as! TableViewCell3
           cell.delegate = self
           return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
            cell.cell1Label.text = textarray[indexPath.row]
            return cell
        }
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension
    }

   

}

