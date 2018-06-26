import UIKit

class ProfileViewController: UIViewController {
   
    //Mark : IBOutlet
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.layer.cornerRadius =
        profileImage.frame.size.width / 2
        profileImage.clipsToBounds = true
        if let username = AppUtil.shareInstance.getFIRUserCredential().name{
            nameLabel.text = username
        }
        if let email = AppUtil.shareInstance.getFIRUserCredential().email{
            userIdLabel.text = email
        }
        if let imageUrl = AppUtil.shareInstance.getFIRUserCredential().imageUrl{
            if let url = URL(string: imageUrl){
            profileImage.sd_setImage(with: url, completed: nil)
            }
        }
    }
}
