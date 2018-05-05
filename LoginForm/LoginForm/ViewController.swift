//
//  ViewController.swift
//  LoginForm
//
//  Created by BridgeLabz on 06/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
//MARK: Properties
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var labelField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField{
            emailTextField.resignFirstResponder()
            
        }else{
          passwordTextField.resignFirstResponder()
        }
    return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
    }

    //MARK: Actions
   
    @IBAction func signinAction(_ sender: UIButton) {
        let string1 = emailTextField.text
        let string2 = passwordTextField.text
        
        if string1 == "deorohini1812@gmail.com" && string2 == "1234"{
            labelField.text = "Successfull"
        }
        else{
            labelField.text = "UnSuccessfull"
        }
}
}

