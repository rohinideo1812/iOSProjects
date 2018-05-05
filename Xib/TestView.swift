//
//  TestView.swift
//  Xib
//
//  Created by BridgeLabz on 17/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class TestView: UIView {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet var contentView: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()

    }
    private func commonInit(){
        Bundle.main.loadNibNamed("TestView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth,.flexibleWidth]
    }

}
