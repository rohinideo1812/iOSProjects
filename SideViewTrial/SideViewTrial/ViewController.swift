//
//  ViewController.swift
//  SideViewTrial
//
//  Created by BridgeLabz on 03/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class ViewController: UIViewController,ENSideMenuDelegate {
    func sideMenuWillOpen() {
        print("Side Menu Will Opened")
    }
    
    func sideMenuWillClose() {
        print("Side Menu Will Closed")

    }
    
    func sideMenuShouldOpenSideMenu() -> Bool {
        print("Opening")
        return true
    }
    
    func sideMenuDidOpen() {
        print("Side Menu Opened")

    }
    
    func sideMenuDidClose() {
        print("Side Menu Closed")

    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         self.sideMenuController()?.sideMenu?.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func toggleAction(_ sender: UIBarButtonItem) {
        toggleSideMenuView()

    }
    
}

