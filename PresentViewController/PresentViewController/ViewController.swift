//
//  ViewController.swift
//  PresentViewController
//
//  Created by BridgeLabz on 10/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPrss(_ sender: UIButton) {
        if let presentedViewController = self.storyboard?.instantiateViewController(withIdentifier: "NextViewController")  {
            presentedViewController.providesPresentationContextTransitionStyle = true
            presentedViewController.definesPresentationContext = true
            presentedViewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext;
            presentedViewController.view.backgroundColor = UIColor.init(white: 0.4, alpha: 0.8)
            self.present(presentedViewController, animated: true, completion: nil)
        }
        
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let newViewController = storyBoard.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
//        self.navigationController?.present(newViewController, animated: true, completion: nil)
//        self.navigationController?.pushViewController(mapViewControllerObj!, animated: true)

    }
    
}

