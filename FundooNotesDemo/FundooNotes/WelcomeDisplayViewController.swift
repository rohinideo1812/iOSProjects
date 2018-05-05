//
//  WelcomeDisplayViewController.swift
//  FundooNotes
//
//  Created by BridgeLabz on 21/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class WelcomeDisplayViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.layer.cornerRadius = 5
    }

   
    @IBAction func backButton(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.present(newViewController, animated: true, completion: nil)

    }
}
