import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var forgotPsswrdBtn: UIButton!
    @IBOutlet weak var passwordTxtFeld: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var lbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.forgotPsswrdBtn.setTitleColor(UIColor(hexString: "#ff8080"), for: UIControlState.normal)
        self.signUpBtn.setTitleColor(UIColor(hexString: "#ff8080"), for: UIControlState.normal)
        self.signInBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        self.signInBtn.backgroundColor = UIColor(hexString: "#ff8080")
        self.lbl.textColor = UIColor.lightGray
       
      
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.emailTxtField.useUnderline()
        self.passwordTxtFeld.useUnderline()
        self.emailTxtField.layer.borderColor = UIColor(hexString: "#ff8080").cgColor
        self.passwordTxtFeld.layer.borderColor = UIColor(hexString: "#ff8080").cgColor

    }
    
    
   
    
 }

