import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 2.0) {
//            self.button.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//            self.button.center = self.view.center
//            self.button.layer.cornerRadius = 50
            let oldValue = self.button.frame.width/2
            let newButtonWidth: CGFloat = 60
            
            /* Do Animations */
            CATransaction.begin()
            CATransaction.setAnimationDuration(5.0)
            CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut))
            
            // View animations
            UIView.animate(withDuration: 5.0) {
                self.button.frame = CGRect(x: 0, y: 0, width: newButtonWidth, height: newButtonWidth)
                self.button.center = self.view.center
            }
            
            // Layer animations
            let cornerAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.cornerRadius))
            cornerAnimation.fromValue = oldValue
            cornerAnimation.toValue = newButtonWidth/2
            
            self.button.layer.cornerRadius = newButtonWidth/2
            self.button.layer.add(cornerAnimation, forKey: #keyPath(CALayer.cornerRadius))
            
            CATransaction.commit()
    }

  }

 }
