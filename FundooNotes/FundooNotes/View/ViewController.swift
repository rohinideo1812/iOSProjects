//
//  ViewController.swift
//  LoginAndRegistration
//
//  Created by BridgeLabz on 19/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var viewutil = viewUtil()
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpButton.layer.cornerRadius = 5
        loginButton.layer.cornerRadius = 5
        facebookButton.alpha = 0
        googleButton.alpha = 0
        loginLabel.alpha = 0
        
        }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField{
        userNameTextField.resignFirstResponder()
            
        }else{
        passwordTextField.resignFirstResponder()
        }
        return true
    }

    @IBAction func loginButonAction(_ sender: UIButton) {
    UserDataBase.sharedInstance.fetchUserData(email: userNameTextField.text,callback: {isavailable,object in
            if isavailable{
            
         ApUtil.shareInstance.setDefaultValue(email: userNameTextField.text)
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "HomeDashBoard") as! HomeDashBoard
                newViewController.text = object?.firstName
                self.present(newViewController, animated: true, completion: nil)

            }else{
            viewutil.alertMessageDisplay(target: self, title: "Title ", message: "You have not registred\nPlease signup to register")
            }

        })
        
    }
    
    @IBAction func signUpButton(_ sender: UIButton) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "RegistrationViewController") as! RegistrationViewController
        self.present(newViewController, animated: true, completion: nil)
        
    }
    
}

