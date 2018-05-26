//
//  AddNoteBottomView.swift
//  FundooNotes
//
//  Created by BridgeLabz on 25/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class AddNoteBottomView: UIView {

    //Mark: IBOutlet
    @IBOutlet weak var rightBottomMenuButton: UIButton!
    @IBOutlet weak var leftBottomMenuButton: UIButton!
    @IBOutlet var contentView: UIView!
    
    
    override init(frame : CGRect){
        super.init(frame: frame)
        commonInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    private  func commonInit(){
        Bundle.main.loadNibNamed("AddNoteBottomView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth,.flexibleWidth]
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 1
        contentView.layer.shadowOffset = CGSize.zero
        contentView.layer.shadowRadius = 10
}
}
