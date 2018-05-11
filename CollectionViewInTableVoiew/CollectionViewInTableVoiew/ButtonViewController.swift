//
//  ButtonViewController.swift
//  CollectionViewInTableVoiew
//
//  Created by BridgeLabz on 10/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class ButtonViewController: UIViewController {

    @IBOutlet weak var width: NSLayoutConstraint!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var redView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func buttonPress(_ sender: UIButton) {
        print(redView.frame.size.width)
        print(greenView.frame.size.width)
        print(blueView.frame.size.width)
       
        
        self.width.constant = 0 
        
    }
    

}
