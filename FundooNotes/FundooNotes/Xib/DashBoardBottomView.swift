//
//  DashBoardBottomView.swift
//  FundooNotes
//
//  Created by BridgeLabz on 24/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class DashBoardBottomView: UIView {
   
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var addNoteBtn: UIButton!
    
    override init(frame : CGRect){
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private  func commonInit(){
      Bundle.main.loadNibNamed("DashBoardBottomView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth,.flexibleWidth]
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.5
        contentView.layer.shadowOffset = CGSize.zero
        contentView.layer.shadowRadius = 10
    }
    
}
