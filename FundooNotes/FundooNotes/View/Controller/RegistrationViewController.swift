//
//  RegistrationViewController.swift
//  LoginAndRegistration
//
//  Created by BridgeLabz on 20/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
   
    //Mark: IBOutlet
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var mobileTextField: UITextField!
    
    //Mark: Properties
    var defaults = UserDefaults.standard
    var obj  = HomeDashBoard()
    var validation : ValidationUtil?
    var viewutil : viewUtil?
    var user : UserModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpButton.layer.cornerRadius = 5
        passwordTextField.isSecureTextEntry = true
        
    }
    
    
    @IBAction func signUpButton(_ sender: UIButton) {
        validation = ValidationUtil()
        let providedEmailAddress = emailTextField.text
        let isEmailValid = validation?.isValidEmailAddress(emailAddressString: providedEmailAddress!)
        if isEmailValid == true {
            UserDataBase.sharedInstance.fetchUserData(email: emailTextField.text, callback: { isavailable,object   in
                print(object)
                if isavailable == false{
                    user = UserModel(firstName: firstNameTextField.text, lastName: lastNameTextField.text, email: emailTextField.text, password: passwordTextField.text)
                    UserDataBase.sharedInstance.insertUserData(object: user)
                }else{
                    viewutil = viewUtil()
                    viewutil?.alertMessageDisplay(target: self, title: "ALERT!", message:"Emailid with this name already exists" )
                }
                }
            )
   }
        else {
            viewutil = viewUtil()
            viewutil?.alertMessageDisplay(target: self, title: "ALERT!", message:"Enter the email with proper format" )
        }
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "HomeDashBoard") as!  HomeDashBoard
        self.present(newViewController, animated: true, completion: nil)
        
    }
    
    @IBAction func loginButton(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as!  ViewController
        self.present(newViewController, animated: true, completion: nil)
        
    }
}
