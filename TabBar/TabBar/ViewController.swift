//
//  ViewController.swift
//  TabBar
//
//  Created by BridgeLabz on 11/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentViewController: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentViewController.layer.cornerRadius = 15
       segmentViewController.layer.masksToBounds = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func segmentPress(_ sender: UISegmentedControl) {
        if segmentViewController.selectedSegmentIndex == 0{
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let newViewController = storyBoard.instantiateViewController(withIdentifier: "OrangeViewController") as! OrangeViewController
            self.navigationController?.pushViewController(newViewController, animated: true)
        }else if segmentViewController.selectedSegmentIndex == 1{
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "BlueViewController") as! BlueViewController
            self.navigationController?.pushViewController(newViewController, animated: true)
        }
    }
    

}

