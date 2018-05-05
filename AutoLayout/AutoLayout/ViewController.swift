//
//  ViewController.swift
//  AutoLayout
//
//  Created by BridgeLabz on 16/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

   
    @IBAction func buttonPressedx(_ sender: UIButton) {
        if sender.title(for: .normal) == "X" {
            sender.setTitle("A very long title for this button", for: .normal)
        } else {
            sender.setTitle("X", for: .normal)
        }
    
    }
}

