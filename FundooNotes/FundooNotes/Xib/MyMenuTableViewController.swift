//
//  MyMenuTableViewController.swift
//  SwiftSideMenu
//
//  Created by Evgeny Nazarov on 29.09.14.
//  Copyright (c) 2014 Evgeny Nazarov. All rights reserved.
//

import UIKit

class MyMenuTableViewController: UITableViewController {
    var selectedMenuItem : Int = 0
    
    let logoarray = ["Notes","Reminders","Create new label","Archive","Deleted","Settings","Help & feedback"]
    let imagearray = ["ic_lightbulb_outline","ic_touch_app","ic_add","ic_archive","ic_delete","ic_settings","ic_help"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset = UIEdgeInsetsMake(64.0, 0, 0, 0)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.white
        tableView.scrollsToTop = false
        self.clearsSelectionOnViewWillAppear = false
        let profileViewController = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
        tableView.tableHeaderView = profileViewController.view
        tableView.selectRow(at: IndexPath(row: selectedMenuItem, section: 0), animated: false, scrollPosition: .middle)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
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

        let logodata = logoarray[indexPath.row]
        let imagedata = imagearray[indexPath.row]
        cell!.textLabel?.text = logodata
        cell!.imageView?.image  = UIImage(named : imagedata)
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
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
        var destViewController : UIViewController
        switch (indexPath.row) {
        case 0:
            destViewController = mainStoryboard.instantiateViewController(withIdentifier: "vc1")
            break
        case 1:
            destViewController = mainStoryboard.instantiateViewController(withIdentifier: "vc2")
            break
        case 2:
            destViewController = mainStoryboard.instantiateViewController(withIdentifier: "vc3")
            break
        case 3:
            destViewController = mainStoryboard.instantiateViewController(withIdentifier: "vc4")
            break
        case 4:
            destViewController = mainStoryboard.instantiateViewController(withIdentifier: "vc5")
            break
        case 5:
            destViewController = mainStoryboard.instantiateViewController(withIdentifier: "vc6")
            break
        case 6:
            destViewController = mainStoryboard.instantiateViewController(withIdentifier: "vc7")
            break
            
        default:
            destViewController = mainStoryboard.instantiateViewController(withIdentifier: "vc7")
            break
        }
        sideMenuController()?.setContentViewController(destViewController)
    }
 
}
