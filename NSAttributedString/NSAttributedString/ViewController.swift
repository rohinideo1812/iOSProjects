//
//  ViewController.swift
//  NSAttributedString
//
//  Created by BridgeLabz on 14/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var heightConstraintOfLabel: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var normalText = "dggdghtfhfhfhfhtfhtfhtfhtfhtfhtfhtfhtfjfhtcthrc"
        if normalText.isEmpty{
            
        }else{
            normalText.append("\n")
        }
        
        var boldText  = "And I am BOLD!fcgfcgfcgcgfcgfcghfchchchc"
        
        var attributedString = NSMutableAttributedString(string:normalText)
        
        var attrs = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 40)]
        var boldString = NSMutableAttributedString(string: boldText, attributes:attrs)
       
        attributedString.append(boldString)
        label.attributedText = attributedString
        label.sizeToFit()
        var initialHeight = label.frame.size.height
        heightConstraintOfLabel.constant = initialHeight
        

    }

    
}

