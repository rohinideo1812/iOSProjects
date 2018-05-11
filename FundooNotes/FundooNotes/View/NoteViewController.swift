//
//  NoteViewController.swift
//  FundooNotes
//
//  Created by BridgeLabz on 05/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {

    @IBAction func toggleAction(_ sender: Any) {
        toggleSideMenuView()

    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func addNoteAction(_ sender: UIButton) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "AddNoteViewController") as! AddNoteViewController
        self.present(newViewController, animated: true, completion: nil)

    }
    
   

}
