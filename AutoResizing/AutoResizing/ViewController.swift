//
//  ViewController.swift
//  AutoResizing
//
//  Created by BridgeLabz on 08/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    var textarray = ["Google LLC is an American multinational technology company that specializes in Internet-related services and products,","Google LLC is an American multinational technology company that specializes in Internet-related services and products, which include online advertising technologies, search engine, cloud computing, software, and hardware. Google was founded in 1998 by Larry Page and Sergey Brin while they were Ph.D. students at ...","Google, Inc (NASDAQ: GOOG), is a U.S. public corporation, first estaiblisht as a privately-hauden corporation in 1998, that designed an guidit the Internet Google sairch ingine. Google is heidit at the Googleplex in Muntain View, Californie an haes owre 4,000 wankers in its employ. Dr. Eric Schmidt, ance CEO o Novell, wis ...","","earch engine, cloud computing, software, and hardware. Google was founded in","Search engine, cloud computing, software, and hardware. Google was founded in","Rohini","","earch engine, cloud computing, software, and hardware. Google was founded in"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
    cell.label.text = textarray[indexPath.row]
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 96
        tableView.rowHeight = UITableViewAutomaticDimension
    
        // Do any additional setup after loading the view, typically from a nib.
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        // optionally, return an calculated estimate for the cell heights
        return tableView.estimatedRowHeight
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

