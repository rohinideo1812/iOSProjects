//
//  RegistrationViewController.swift
//  FundooNotes
//
//  Created by BridgeLabz on 21/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController{

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpButton.layer.cornerRadius = 5
        passwordTextField.isSecureTextEntry = true
    }
//    func checkData()->Bool{
//        var user = [User]()
//        user = DatabaseHelper.shareInstance.getData()
//        for obj in user{
//            if emailTextField.text == obj.email && mobileTextField.text == obj.mobile {
//                return false
//            }
//        }
//        return true
//    }
    
    func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
    @IBAction func signUpButton(_ sender: UIButton) {
        let providedEmailAddress = emailTextField.text
        let isEmailValid = isValidEmailAddress(emailAddressString: providedEmailAddress!)
        if isEmailValid == true{
           var checkedData = true //checkData()
            if checkedData == true{
            var dict = ["firstName" :firstNameTextField.text,"lastName" :lastNameTextField.text,"email" :emailTextField.text,"password" :passwordTextField.text,"mobile" :mobileTextField.text]
            DatabaseHelper.shareInstance.save(object: dict as! [String : String])
            }else{
                alertmessage(title: "ALERT!", message: "User with this username or password field already exists")
                
            }
        }
        else{
            alertmessage(title: "ALERT!", message: "Please enter emailaddress in proper format")
        }
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as!  ViewController
        self.present(newViewController, animated: true, completion: nil)
        
    }
    
    func alertmessage(title : String,message : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
        
    }
}
