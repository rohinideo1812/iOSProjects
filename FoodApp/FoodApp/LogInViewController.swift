/*********************************************************************
 *  Purpose: Login VC.
 *
 *  @author Rohini
 *  @version 4.0
 *  @since   06-07-2018
 *
 *********************************************************************/
import UIKit

class LogInViewController: UIViewController {

      //Mark:Properties
      @IBOutlet weak var logInBtn: UIButton!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            configureBtns()
            
    }

    
        //Mark:Configure Btns
        func configureBtns(){
            
            self.logInBtn.layer.cornerRadius = 15
            self.logInBtn.layer.backgroundColor = UIColor.orange.cgColor
            self.logInBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
            
         }
    
    }
