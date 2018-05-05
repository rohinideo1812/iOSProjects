//
//  WelcomeDisplayViewController.swift
//  LoginAndRegistration
//
//  Created by BridgeLabz on 20/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class HomeDashBoard: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var backButton: UIButton!

    var text:String?
    
        override func viewDidLoad() {
        super.viewDidLoad()
        backButton.layer.cornerRadius = 5
        label.text = text

    }

    @IBAction func navigationAction(_ sender: UIBarButtonItem) {
        toggleSideMenuView()

    }
    
    @IBAction func backButton(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.present(newViewController, animated: true, completion: nil)
    }

}
