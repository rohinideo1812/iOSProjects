import UIKit
import EasyTipView
import SnapKit

class LoginViewController: UIViewController{
    
    @IBOutlet weak var loginPointerView: UIView!
    
    @IBOutlet weak var signUpPointerView: UIView!
    
    @IBOutlet weak var popUpView: UIView!

    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var signUpBtn: UIButton!
    
    @IBOutlet weak var googleBtn: UIButton!
    
    @IBOutlet weak var facebookBtn: UIButton!
    
    @IBOutlet weak var twitterBtn: UIButton!
    
    var isLoginBtnPressed = false
    var isSignUpBtnPress = false
    var preferences = EasyTipView.Preferences()
    let phoneTextField = UITextField()
    let otpTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        EasyTipView.globalPreferences = preferences
//        preferences.drawing.backgroundColor = UIColor(hue:0.46, saturation:0.99, brightness:0.6, alpha:1)
//        preferences.drawing.arrowPosition = EasyTipView.ArrowPosition.right
       
        self.signUpPointerView.isHidden = true
        self.popUpView.isHidden = true
        self.loginPointerView.isHidden = true
        
       }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.loginBtn.roundCornersWithLayerMask(cornerRadii:10, corners: [.topRight,.bottomRight])
        self.signUpBtn.roundCornersWithLayerMask(cornerRadii:10, corners: [.topRight,.bottomRight])
        self.popUpView.roundCornersWithLayer(cornerRadii: 40, corners: [.topLeft,.bottomLeft])
        self.twitterBtn.layer.cornerRadius = self.twitterBtn.frame.size.height/2
        self.googleBtn.layer.cornerRadius = self.googleBtn.frame.size.height/2
        self.facebookBtn.layer.cornerRadius = self.facebookBtn.frame.size.height/2
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = popUpView.bounds
        gradientLayer.colors = [UIColor(hexString: "#3498DB").cgColor,UIColor(hexString:"#2ECC71").cgColor]
        gradientLayer.startPoint = CGPoint(x : 0.0,y : 0.5)
        gradientLayer.endPoint = CGPoint(x : 1.0,y : 0.5)
        self.popUpView.layer.addSublayer(gradientLayer)
    }
   
    
    @IBAction func loginBtnPress(_ sender: UIButton) {
        if self.isLoginBtnPressed == false{
            self.loginBtn.layer.backgroundColor = UIColor(hexString: "#E511C8").cgColor
            self.isLoginBtnPressed = true
            self.signUpPointerView.isHidden = true
            self.popUpView.isHidden = false
            self.loginPointerView.isHidden = false
            self.isSignUpBtnPress = false
            self.signUpBtn.layer.backgroundColor = UIColor.clear.cgColor
//            EasyTipView.show(forView: loginBtn,
//                             withinSuperview: mainView,
//                             text: "",
//                             preferences: preferences)
        }else{
            self.loginBtn.layer.backgroundColor = UIColor.clear.cgColor
            self.isLoginBtnPressed = false
            self.signUpPointerView.isHidden = true
            self.popUpView.isHidden = true
            self.loginPointerView.isHidden = true
        }

    }
   
    
    @IBAction func signupBtnPress(_ sender: UIButton) {
        if self.isSignUpBtnPress == false{
            self.signUpBtn.layer.backgroundColor = UIColor(hexString: "#E511C8").cgColor
            self.isSignUpBtnPress = true
            self.signUpPointerView.isHidden = false
            self.popUpView.isHidden = false
            self.loginPointerView.isHidden = true
            self.isLoginBtnPressed = false
            self.loginBtn.layer.backgroundColor = UIColor.clear.cgColor
            self.view.addSubview(phoneTextField)
            phoneTextField.snp.makeConstraints{(make)-> Void in
                make.top.equalTo(popUpView.snp.top).offset(8)
                make.left.equalTo(popUpView.snp.right).offset(8)
                make.right.equalTo(popUpView.snp.right).offset(-8)
                make.height.equalTo(35)
            }
            phoneTextField.attributedPlaceholder = NSAttributedString(string: "Phone number",
                                                                      attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
            phoneTextField.textColor = UIColor.white

//                        EasyTipView.show(forView: loginBtn,
//                                         withinSuperview: mainView,
//                                         text: "",
//                                         preferences: preferences)
            
        }else{
            self.signUpBtn.layer.backgroundColor = UIColor.clear.cgColor
            self.isSignUpBtnPress = false
            self.signUpPointerView.isHidden = true
            self.popUpView.isHidden = true
            self.loginPointerView.isHidden = true
            
        }
    }
    
    
}
