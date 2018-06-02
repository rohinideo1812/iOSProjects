//
//  ViewController.swift
//  DynamicAutoLayout
//
//  Created by BridgeLabz on 02/06/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet  var downConstraint: NSLayoutConstraint!
    @IBOutlet weak var blackLabel: UILabel!
    @IBOutlet  var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var redLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        redLabel.text = "ghkjfbgjkfbgkjdbfgkjdfbgkjdfbgkdjfbgkdfjbgkdfjbgdfkjgbdfkjgbdfkjgbkdfbgkdfjbgkdjfbgdkjfbgdkfbgdfkjbgdkfjbgdfgdfg"
        redLabel.numberOfLines = 0
        blackLabel.text = "hjbdfjgbfdjhbgdfjhbgdjfhbgjdfhbgjdhfbgjdhfbgjdhfbgdjfhbgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdbgjdfbgjhdfbgjhdfbjhgbjhbgjhfdbgjhdfbgjhdfbjhdbfjhbjhbdfgjhbdfgjhbdfgdfgfdgfdg"
        blackLabel.numberOfLines = 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    @IBAction func voiletBtnPrss(_ sender: UIButton) {
        UIView.animate(withDuration: 1) {
            self.heightConstraint.isActive = !self.heightConstraint.isActive
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func greenBtnPrss(_ sender: UIButton) {
        UIView.animate(withDuration: 1) {
            self.heightConstraint.isActive = !self.heightConstraint.isActive
            self.view.layoutIfNeeded()
        }
}
}
