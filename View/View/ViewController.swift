//
//  ViewController.swift
//  View
//
//  Created by BridgeLabz on 09/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIBezierPath()
        //change the CGPoint values to get the triangle of the shape you want
        button.move(to: CGPoint(x: 0, y: 0))
        button.addLine(to: CGPoint(x: 100, y: 50))
        button.addLine(to: CGPoint(x: 0, y: 100))
        button.addLine(to: CGPoint(x: 0, y: 0))
        
        button.path = button.cgPath
        button.fillColor = UIColor.black.cgColor
        
        view.layer.addSublayer(triangleLayer)
//      let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
       button.backgroundColor = UIColor.red
        view.addSubview(button)
    }
}
//
//let trianglePath = UIBezierPath()
//let triangleLayer = CAShapeLayer()
////change the CGPoint values to get the triangle of the shape you want
//trianglePath.move(to: CGPoint(x: 0, y: 0))
//trianglePath.addLine(to: CGPoint(x: 100, y: 50))
//trianglePath.addLine(to: CGPoint(x: 0, y: 100))
//trianglePath.addLine(to: CGPoint(x: 0, y: 0))
//
//triangleLayer.path = trianglePath.cgPath
//triangleLayer.fillColor = UIColor.black.cgColor
//
//btn.layer.addSublayer(triangleLayer)

