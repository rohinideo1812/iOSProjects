/******************************************************************************
 *  Purpose: Login VC.
 *
 *  @author Rohini
 *  @version 4.0
 *  @since   06-07-2018
 *
 ******************************************************************************/
import UIKit

class LogInViewController: UIViewController {

      //Mark:Properties
      @IBOutlet weak var logInBtn: UIButton!
    
    var flag :Int?
        override func viewDidLoad() {
            super.viewDidLoad()
            configureBtns()
            flag = 10
            if let m = flag{
                print(m)
            }
           
    }

    
        //Mark:Configure Btns
        func configureBtns(){
            self.logInBtn.layer.cornerRadius = 15
            self.logInBtn.layer.backgroundColor = UIColor.orange.cgColor
            self.logInBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
            
         }
    
    }
