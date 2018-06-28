import UIKit

final class ViewController: UIViewController {

   @IBOutlet weak var segmentControl: UISegmentedControl!
    
   private lazy var sessionVC : SessionViewController = {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "SessionViewController") as! SessionViewController
        addChildVC(viewController: newViewController)
        return newViewController
    }()
    
   private lazy var summaryVC : SummaryViewController = {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "SummaryViewController") as! SummaryViewController
        addChildVC(viewController: newViewController)
        return newViewController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        segmentControl.addTarget(self, action: #selector(selectionDidChange), for: .valueChanged)
        segmentControl.selectedSegmentIndex = 0
        updateView()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @objc func selectionDidChange(){
        updateView()
    }
    
    func updateView(){
        if segmentControl.selectedSegmentIndex == 0 {
            removeVC(viewController: sessionVC)
            addChildVC(viewController: summaryVC)
        } else {
            removeVC(viewController: summaryVC)
            addChildVC(viewController: sessionVC)
        }
    }
    
    
    func addChildVC(viewController : UIViewController){
        addChildViewController(viewController)
        view.addSubview(viewController.view)
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        // Notify Child View Controller
        viewController.didMove(toParentViewController: self)
    }
    
    
    func removeVC(viewController:UIViewController){
        viewController.willMove(toParentViewController: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParentViewController()
    }
    
    
    
    
}


