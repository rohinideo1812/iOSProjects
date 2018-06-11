import UIKit

class LoginViewController: UIViewController,LoginView {
    
    
    //Mark : IBOutlet
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    
    //Mark: Properties
    var loginPresenter:LoginPresenter?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginPresenter = LoginPresenter(loginService:LoginService())
        loginPresenter?.attachView(view: self)
        signUpButton.layer.cornerRadius = 5
        loginButton.layer.cornerRadius = 5
        facebookButton.alpha = 0
        googleButton.alpha = 0
        loginLabel.alpha = 0
    }
   
    
    func openDashBoard() {
        self.present(AppUtil.shareInstance.getMainVC(), animated: true, completion: nil)
    }
    
    func startLoading() {
        
    }
    
    func finishLoading() {
        
    }
    
    func showMessage(message: String) {
        ViewUtil.shareInstance.alertMessageDisplay(target: self, title: "Alert!", message: message)
    }
    
    func messageAfterRegistration(message: String) {
        let alert = UIAlertController(title: "Message", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
            let myNavVC = AppUtil.shareInstance.getMainVC()
            self.present(myNavVC, animated: true, completion: nil)
        }))
        self.present(alert, animated: true)
    }
    
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField{
        userNameTextField.resignFirstResponder()
            
        }else{
        passwordTextField.resignFirstResponder()
        }
        return true
    }

    
    //Mark : Action on loginButonPress
    @IBAction func loginButonAction(_ sender: UIButton) {
        loginPresenter?.loginWith(email: userNameTextField.text!, password: passwordTextField.text!, callback: {result,message in
            print(result)
            print(message)
            
        })
        
        
//        loginPresenter?.login(email: userNameTextField.text!, password: passwordTextField.text!)
    }
    
    
    //Mark : Action on signUpButonPress
    @IBAction func signUpButton(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "RegistrationViewController") as! RegistrationViewController
        self.present(newViewController, animated: true, completion: nil)
        
    }
    
}

