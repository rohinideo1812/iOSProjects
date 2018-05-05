//
//  ViewController.swift
//  HomeDashBoard
//
//  Created by BridgeLabz on 22/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var viewField: UIView!
    @IBOutlet weak var trailing: NSLayoutConstraint!
    @IBOutlet weak var leading: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    var imageButton = false
    @IBAction func buttonPressed(_ sender: Any) {
        if !imageButton {
           
            UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn, animations : {
                self.leading.constant = 150
                self.trailing.constant = -150
               // self.viewField.layoutIfNeeded()
            }){(animationComplete) in
                print("Complete")
            }
            imageButton = true
        }
        else{
           
            UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn, animations : {
                self.leading.constant = 0
                self.trailing.constant = 0
            }){(animationComplete) in
                print("Complete")
            }
            imageButton = false
        }
        self.viewField.layoutIfNeeded()

       
    }
    
}

