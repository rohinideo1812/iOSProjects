import UIKit
import SwiftKeychainWrapper

class ViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func SaveBtnPress(_ sender: UIButton) {
        if let password = passwordTextField.text {
            let saveSuccessful: Bool = KeychainWrapper.standard.set(password, forKey: "userPassword")
            print("Save was successful: \(saveSuccessful)")
            self.view.endEditing(true)
        }
    }
    
    @IBAction func retriveBtnPress(_ sender: UIButton) {
        
        let retrievedPassword: String? = KeychainWrapper.standard.string(forKey: "userPassword")
        print("Retrieved passwork is: \(retrievedPassword!)")
    }
    @IBAction func removeBtnPress(_ sender: UIButton) {
        
        let removeSuccessful: Bool = KeychainWrapper.standard.remove(key: "userPassword")
        print("Renmove was Successfull \(removeSuccessful)")
    }
}
