//
//  MyNavigationController.swift
//  SideViewTrial
//
//  Created by BridgeLabz on 03/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class MyNavigationController: ENSideMenuNavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenu = ENSideMenu(sourceView: self.view, menuViewController: TableViewController() , menuPosition:.left)
        sideMenu?.menuWidth = (75 * self.view.frame.size.width) / 100 // optional, default is 160
        sideMenu?.bouncingEnabled = false
        view.bringSubview(toFront: navigationBar)

    }

}

    extension MyNavigationController: ENSideMenuDelegate {
        func sideMenuWillOpen() {
            print("sideMenuWillOpen")
        }
        
        func sideMenuWillClose() {
            print("sideMenuWillClose")
        }
        
        func sideMenuDidClose() {
            print("sideMenuDidClose")
        }
        
        func sideMenuDidOpen() {
            print("sideMenuDidOpen")
        }
        
        func sideMenuShouldOpenSideMenu() -> Bool {
            return true
        }
}


