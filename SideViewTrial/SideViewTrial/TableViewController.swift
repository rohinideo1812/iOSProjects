//
//  TableViewController.swift
//  SideViewTrial
//
//  Created by BridgeLabz on 03/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var selectedMenuItem : Int = 0
  
    override func viewDidLoad() {
        super.viewDidLoad()
        var headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 200))
        headerView.backgroundColor = UIColor.white
        tableView.contentInset = UIEdgeInsetsMake(64.0, 0, 0, 0) //
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.clear
        tableView.tableHeaderView = headerView
        tableView.scrollsToTop = false
        self.clearsSelectionOnViewWillAppear = false
        tableView.selectRow(at: IndexPath(row: selectedMenuItem, section: 0), animated: false, scrollPosition: .middle)
    }
  
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

   
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "CELL")
        
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "CELL")
            cell!.backgroundColor = UIColor.clear
            cell!.textLabel?.textColor = UIColor.darkGray
            let selectedBackgroundView = UIView(frame: CGRect(x: 0, y: 0, width: cell!.frame.size.width, height: cell!.frame.size.height))
            selectedBackgroundView.backgroundColor = UIColor.gray.withAlphaComponent(0.2)
            cell!.selectedBackgroundView = selectedBackgroundView
        }
        
        cell!.textLabel?.text = "ViewController #\(indexPath.row+1)"
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("did select row: \(indexPath.row)")
        
        if (indexPath.row == selectedMenuItem) {
            return
        }
        
        selectedMenuItem = indexPath.row
        
        //Present new view controller
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
        var destViewController : UIViewController
        switch (indexPath.row) {
        case 0:
            destViewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController1")
            break
        case 1:
            destViewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController2")
            break
        case 2:
            destViewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController3")
            break
            
        default:
            destViewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController3")
            break
        }
        sideMenuController()?.setContentViewController(destViewController)
    }
    

}
