import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var uiView: UIView!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var mainMenuView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiView.layer.cornerRadius = 22
        uiView.clipsToBounds = true
       
    }

    @IBAction func btnPress(_ sender: UIButton) {
        if uiView.transform == .identity{
        UIView.animate(withDuration: 1, animations: {
            self.uiView.transform = CGAffineTransform(scaleX: 11, y: 11)
            self.mainMenuView.transform = CGAffineTransform(translationX: 0, y: -55)
            self.btn.transform = CGAffineTransform(rotationAngle: self.radians(degress:180))
            
        }){(true) in
            
        }
        }else{
            UIView.animate(withDuration: 1, animations: {
                self.uiView.transform = .identity
                self.mainMenuView.transform = .identity
                self.btn.transform = .identity
            }){(true) in
                
            }
        }
        
    }
    
    func radians(degress:Double)->CGFloat{
        return CGFloat(degress * .pi / degress)
    }
}

