//
//  PointerUIView.swift
//  SOSCare
//
//  Created by BridgeLabz on 27/07/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class PointerUIView: UIView {

    @IBOutlet var contentView: UIView!
    var path: UIBezierPath!

    override init(frame : CGRect){
        super.init(frame: frame)
        commonInit()

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()

    }
    
    override func draw(_ rect: CGRect) {
        self.createTriangle()
        self.contentView.backgroundColor = UIColor.clear
        let csl = CAShapeLayer()
        csl.path = path.cgPath
        csl.fillColor = UIColor(hexString: "#3498DB").cgColor
        self.contentView.layer.addSublayer(csl)
//        self.contentView.layer.mask = csl
    }
    
    private  func commonInit(){
        Bundle.main.loadNibNamed("PointerUIView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth,.flexibleWidth]
   }
    
   func createTriangle() {
        path = UIBezierPath()
        path.move(to: CGPoint(x: 0.0, y: self.contentView.frame.size.height/2))
        path.addLine(to: CGPoint(x: self.contentView.frame.size.width, y: self.contentView.frame.size.height))
        path.addLine(to: CGPoint(x: self.contentView.frame.size.width, y: 0.0))
        path.close()

    }
    
}
