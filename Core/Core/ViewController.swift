//
//  ViewController.swift
//  Core
//
//  Created by BridgeLabz on 12/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentCont
//    let user = User(context: context)
//    let note = Notes(context : context)
        
//     user.fName = "sHAHABAZ"
//        user.lName = "Shaikh"
        appDelegate.saveContext()

//        appDelegate.saveContext()

    }
}

