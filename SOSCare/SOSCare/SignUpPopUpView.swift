import UIKit

class PopUpView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       commoninit()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commoninit()
    }
    
    
    func commoninit(){
        Bundle.main.loadNibNamed("PopUpView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [UIColor(hexString: "#1175E5").cgColor,UIColor(hexString:"#11E531")]
        gradientLayer.startPoint = CGPoint(x : 0.0,y : 0.5)
        gradientLayer.endPoint = CGPoint(x : 1.0,y : 0.5)
    }
}
