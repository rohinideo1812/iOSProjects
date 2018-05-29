//
//  NoteAddUIView.swift
//  FundooNotes
//
//  Created by BridgeLabz on 18/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class NoteAddUIView: UIView{
  
    //Mark : IBOutlet
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var noteTextView: UITextView!
    @IBOutlet weak var titleTextView: UITextView!
    @IBOutlet weak var heightConstraintOfNoteTextView: NSLayoutConstraint!
    @IBOutlet weak var heightConstraintOftitleTextView: NSLayoutConstraint!
    @IBOutlet weak var heightConstraintOfImageView: NSLayoutConstraint!
    
    override init(frame : CGRect){
        super.init(frame: frame)
        commonInit()
    //        UIColor(hexString: "")

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
   private  func commonInit(){
        Bundle.main.loadNibNamed("NoteAddUIView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth,.flexibleWidth]
    
    }
    
}
