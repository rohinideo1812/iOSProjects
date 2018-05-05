//
//  ViewController2.swift
//  SideViewTrial
//
//  Created by BridgeLabz on 03/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, ENSideMenuDelegate {
    func sideMenuWillOpen() {
        print("sideMenuWillOpen")
    }
    
    func sideMenuWillClose() {
    print("sideMenuWillClose")

    }
    
    func sideMenuShouldOpenSideMenu() -> Bool {
        print("sideMenuShouldOpenSideMenu")
        return true
    }
    
    func sideMenuDidOpen() {
        print("sideMenuDidOpen")

    }
    
    func sideMenuDidClose() {
        print("sideMenuDidClose")

    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.sideMenuController()?.sideMenu?.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
}
