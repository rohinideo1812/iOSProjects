//
//  ViewController.swift
//  Button
//
//  Created by BridgeLabz on 09/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var uiview: UIView!
    @IBOutlet weak var btn: UIButton!
    var newwidth : CGFloat?
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func btnPress(_ sender: Any) {
        
        print(blackView.bounds.width)
        print(blackView.frame.size.width)
    }
}

