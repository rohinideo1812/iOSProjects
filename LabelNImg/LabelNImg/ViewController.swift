import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: SMIconLabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.icon = #imageLiteral(resourceName: "baseline_dns_black_18dp")
        label.iconPosition = (.left,.center)
        label.iconPadding = 5
        label.text = "Rohini is very nice"
        label.sizeToFit()
        
    }

}

