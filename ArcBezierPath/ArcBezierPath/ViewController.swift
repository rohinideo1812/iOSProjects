//
//  ViewController.swift
//  ArcBezierPath
//
//  Created by BridgeLabz on 24/07/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
                let demoView = DemoView(frame: CGRect(x: 0,
                                              y: 0,
                                              width: self.view.frame.size.width,
                                              height: self.view.frame.size.height/2))

        self.view.addSubview(demoView)
    }

}

