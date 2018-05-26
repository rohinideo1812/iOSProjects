//
//  WelcomeDisplayViewController.swift
//  LoginAndRegistration
//
//  Created by BridgeLabz on 20/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class HomeDashBoard: UIViewController {
    
    //Mark : IBOutlet
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var backButton: UIButton!

    //Mark : Properties
    var text:String?
    
        override func viewDidLoad() {
        super.viewDidLoad()
        backButton.layer.cornerRadius = 5
        label.text = text

    }

    //Mark : Action on menuButtonPress
    @IBAction func navigationAction(_ sender: UIBarButtonItem) {
        toggleSideMenuView()

    }
    
    //Mark : Action on backButtonPress
    @IBAction func backButton(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.present(newViewController, animated: true, completion: nil)
    }

}
