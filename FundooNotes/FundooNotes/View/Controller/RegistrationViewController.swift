import UIKit
import Foundation

class RegistrationViewController: UIViewController,SignUpView {
  
   
    //Mark: IBOutlet
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //Mark: Properties
    var defaults = UserDefaults.standard
    var user : UserModel?
    var signUpPresenter:SignUpPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpPresenter = SignUpPresenter(signUpService:SignUpService())
        signUpButton.layer.cornerRadius = 5
        passwordTextField.isSecureTextEntry = true
        signUpPresenter?.attachView(view: self)

    }
    
    
    func startLoading() {
        
    }
    
    func finishLoading() {
        
    }
    
    func showMessage(message: String) {
        ViewUtil.shareInstance.alertMessageDisplay(target: self, title: "Alert!", message: message)
    }
    
    func messageAfterRegistration(message:String) {
        let alert = UIAlertController(title: "Message", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as!  LoginViewController
        self.present(newViewController, animated: true, completion: nil)
        
        }))
        self.present(alert, animated: true)
    }
    
    
    //Mark: Action on SignUpButton Press
    @IBAction func loginButtonPress(_ sender: UIButton) {
    user = UserModel(firstName: firstNameTextField.text, lastName: lastNameTextField.text, email: emailTextField.text, password: passwordTextField.text)
//    signUpPresenter?.signUp(object:user )
        signUpPresenter?.signUpWith(userObject: user!, callback: {result,message in
            print(result)
            print(message)
            
        })
    }
    
    //Mark: Action on LoginButtonPress
    @IBAction func alreadySignedIn(_ sender: Any) {
         self.dismiss(animated: true, completion: nil)
        
    }
}
