//
//  ViewController.swift
//  FundooNotes
//
//  Created by BridgeLabz on 21/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var googleButton: UIView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        facebookButton.alpha = 0
        googleButton.alpha = 0
        loginLabel.alpha = 0
        passwordTextField.isSecureTextEntry = true
        loginButton.layer.cornerRadius = 5
        signUpButton.layer.cornerRadius = 5
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField{
            userNameTextField.resignFirstResponder()
            
        }else{
            passwordTextField.resignFirstResponder()
        }
        return true
    }

    @IBAction func loginButton(_ sender: UIButton) {
        
    }
    
    @IBAction func signUpButton(_ sender: UIButton) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "RegistrationViewController") as! RegistrationViewController
         self.present(newViewController, animated: true, completion: nil)
 
    }
}

