//
//  ViewController.swift
//  SideView
//
//  Created by BridgeLabz on 29/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    let logoarray = ["Notes","Reminders","Create new label","Archive","Deleted","Settings","Help & feedback"]
    let imagearray = ["ic_lightbulb_outline","ic_touch_app","ic_add","ic_archive","ic_delete","ic_settings","ic_help"]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagearray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell",for : indexPath) as! TableViewCell
        cell.commoninit(_imageName: imagearray[indexPath.item], label: logoarray[indexPath.item])
        return cell
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
//     addProfile(viewcontroller: self)
        tableView.delegate = self
        tableView.dataSource = self
    let profileViewController = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
        tableView.tableHeaderView = profileViewController.view
        let nibName = UINib(nibName : "TableViewCell",bundle : nil)
       tableView.register(nibName, forCellReuseIdentifier: "TableViewCell")
        
    }

//    func addProfile(viewcontroller : UIViewController){
//        let profileViewController = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
//        viewcontroller.view.addSubview(profileViewController.view)
//    viewcontroller.addChildViewController(profileViewController)
//
//    }
//
}

