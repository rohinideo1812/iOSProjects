//
//  ViewController.swift
//  MVPCoreData
//
//  Created by BridgeLabz on 07/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var secondName: UITextField!
    var presenter = Presenter()
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
    }

    @IBAction func okButtonPress(_ sender: UIButton) {
        let userdata = UserData(firstName: firstName.text, lastName: secondName.text)
    presenter.insertUsers(object: userdata)
        presenter.getUsers(firstName: firstName.text, callback:{ isAvailable,object in
            print(object?.firstName!)
            print(object?.lastName!)
            label.text = object?.firstName!
        })
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == firstName{
           firstName.resignFirstResponder()
            
        }else{
            secondName.resignFirstResponder()
        }
        return true
    }

}

