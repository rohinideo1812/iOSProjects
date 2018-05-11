//
//  AddNoteViewController.swift
//  FundooNotes
//
//  Created by BridgeLabz on 05/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class AddNoteViewController: UIViewController {
    var note : NoteModel?
    @IBOutlet weak var noteTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
  
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == noteTextField{
            noteTextField.resignFirstResponder()
            
        }else{
            titleTextField.resignFirstResponder()
        }
        return true
    }

    @IBAction func reminderButtonPress(_ sender: UIBarButtonItem) {
        
    }
    @IBAction func backButtonPress(_ sender: UIBarButtonItem) {
        if noteTextField.text == nil && titleTextField.text == nil{
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "NoteViewController") as! NoteViewController
        self.present(newViewController, animated: true, completion: nil)
        }
        else{
            note = NoteModel(title: titleTextField.text, note: noteTextField.text)
            UserDataBase.sharedInstance.insertNoteData(object: note)
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "NoteViewController") as! NoteViewController
            self.present(newViewController, animated: true, completion: nil)
        }
    }
}
