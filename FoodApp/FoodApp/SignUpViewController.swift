/**********************************************************************
 *  Purpose: SignUp VC.
 *
 *  @author Rohini
 *  @version 4.0
 *  @since   06-07-2018
 *
 *********************************************************************/
import UIKit

class SignUpViewController: UIViewController {

    //Mark:Properties
    @IBOutlet weak var createAccountBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureBtns()
   
    }
    
    //Mark:Configure Btns
    func configureBtns(){
        
        self.createAccountBtn.layer.cornerRadius = 15
        self.createAccountBtn.layer.borderColor = UIColor.orange.cgColor
        self.createAccountBtn.setTitleColor(UIColor.white, for: UIControlState.normal)

    }


}
