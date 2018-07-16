import UIKit
import FBSDKLoginKit
import FirebaseAuth
import SKActivityIndicatorView

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
        facebookButton.alpha = 1
        googleButton.alpha = 0
        loginLabel.alpha = 0
    }
   
    
    func openDashBoard() {
        (UIApplication.shared.delegate as! AppDelegate).setRootViewController(vcType: .dashboard)
        //self.present(AppUtil.shareInstance.getMainVC(), animated: true, completion: nil)
    }
    
    func startLoading() {
        SKActivityIndicator.show()
        SKActivityIndicator.show("Loading...")
        SKActivityIndicator.spinnerStyle(.defaultSpinner)
        SKActivityIndicator.show("Loading...", userInteractionStatus: true)

    }
    
    func finishLoading() {
        SKActivityIndicator.dismiss()

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
    //        loginPresenter?.login(email: userNameTextField.text!, password: passwordTextField.text!)
        
        loginPresenter?.loginWith(email: userNameTextField.text!, password: passwordTextField.text!)
        
        }
        
    
    //Mark : Action on signUpButonPress
    @IBAction func signUpButton(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "RegistrationViewController") as! RegistrationViewController
        self.present(newViewController, animated: true, completion: nil)
        
    }
    
    @IBAction func faceBookButtonPress(_ sender: UIButton) {
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["email"], from: self) { (result, error) -> Void in
            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                if(fbloginresult.grantedPermissions.contains("email"))
                {
                    //self.getFBUserData()
                }
                //new
                guard let accessToken = FBSDKAccessToken.current() else {
                    print("Failed to get access token")
                    return
                }
                let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
                Auth.auth().signInAndRetrieveData(with: credential, completion: { (user,error) in
                    if error == nil {
                        if((FBSDKAccessToken.current()) != nil){
                            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                                if (error == nil){
                                    //everything works print the user data
                                    if (user?.additionalUserInfo?.isNewUser)!{
                                        guard let userJson = result as? JSONObject else{
                                            return
                                        }
                                        let firUserObj = self.getFIRUserObj(json: userJson)
                                AppUtil.shareInstance.setFIRUserCredential(firUser: firUserObj)
                                        
                                        self.convertUserObjectToJSONObject(object:firUserObj, callback:{ userDict in
                                        
                                            DataManager.shared.storeFIRUserData(firUser: userDict, callback: {result,message in
                                                print(result)
                                                print(message)
                                                self.openDashBoard()
                                            })
                                        })
                                        
                                    }else{
                                        
                                    }
                                    
                                }
                            })
                        }
                    }else{
                        debugPrint(error.debugDescription)
                    }
                })
                //end
            }
        }
    }
    
    func convertUserObjectToJSONObject(object:FIRUserModel?,callback:@escaping (_ userDict:[String:Any]) -> Void){
        let userInfo:[String:Any] = [
            "firstName" : object?.firstName ?? "",
            "lastName" : object?.lastName ?? "",
            "email" : object?.email ?? "",
            "imageUrl" : object?.imageUrl ?? ""
        ]
        callback(userInfo)
    }
    
    
    func getFIRUserObj(json:JSONObject) -> FIRUserModel{
        var firUserObj = FIRUserModel()
        if let firstName = json["first_name"] as? String{
            firUserObj.firstName = firstName
        }
        if let email = json["email"] as? String{
            firUserObj.email = email
        }
        if let lastName = json["last_name"] as? String{
            firUserObj.lastName = lastName
        }
        if let pictureJson = json["picture"] as? JSONObject{
            firUserObj.imageUrl = self.getImageUrl(json: pictureJson)
        }
        return firUserObj
    }
    
    
    func getImageUrl(json:JSONObject) -> String{
        var urlStr = ""
        if let data = json["data"] as? JSONObject{
            if let url = data["url"] as? String{
                urlStr = url
            }
        }
        return urlStr
    }
    
    
    

}
