/*********************************************************************
 *  Purpose: Login And SignUp VC.
 *
 *  @author Rohini
 *  @version 4.0
 *  @since   06-07-2018
 *
 *********************************************************************/
import UIKit

class LoginAndSignUpViewController: UIViewController {

    //Mark:Properties
    @IBOutlet weak var dontHaveAccountBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var logInBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBtns()

    }

    //Mark:Configure Btns
    func configureBtns(){
        
        self.logInBtn.layer.cornerRadius = 15
        self.logInBtn.backgroundColor = UIColor.orange
        self.logInBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        self.signUpBtn.layer.borderColor = UIColor.orange.cgColor
        self.signUpBtn.layer.cornerRadius = 15
        self.signUpBtn.setTitleColor(UIColor.orange, for: UIControlState.normal)
        self.signUpBtn.layer.borderWidth = 1
        self.dontHaveAccountBtn.setTitleColor(UIColor.black, for: UIControlState.normal)
        
    }
    


}
