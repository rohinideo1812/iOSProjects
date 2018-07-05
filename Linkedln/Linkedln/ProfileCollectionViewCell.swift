import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var upperView: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var heightConstraintOfLabel: NSLayoutConstraint!
    @IBOutlet weak var rightBtn: UIButton!
    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var heightConstraintOfObjectiveLbl: NSLayoutConstraint!
    @IBOutlet weak var objectiveLabel: UILabel!
    let name = "Rohini Deo\n"
    let desriptn = "Software Engineer at BridgeLabz Solution,Mumbai\n"
    let college = "BridgeLabz.K.G.C.E,Mumbai,Maharashtra,India"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.clear
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.cornerRadius = 2
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize.zero
        rightBtn.layer.borderColor = UIColor.black.cgColor
        rightBtn.layer.borderWidth = 0.5
        setLayoutToImage()
        setGradientToView()
        showInfo()
        showObjective()
   
    }
    
    func setLayoutToImage(){
        
        imageView.layer.cornerRadius = imageView.frame.height/2
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.backgroundColor = UIColor.red.cgColor
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOpacity = 0.3
        imageView.layer.shadowRadius = 7
        imageView.layer.shadowOffset = CGSize.zero

    }
    
    
    func setGradientToView(){
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = upperView.bounds
        gradientLayer.colors = [UIColor(hexString: Constants.Color.colorBackgroundLightBlue).cgColor,UIColor(hexString:Constants.Color.colorBackgroundLightGreen).cgColor]
        gradientLayer.startPoint = CGPoint(x : 0.0,y : 0.5)
        gradientLayer.endPoint = CGPoint(x : 1.0,y : 0.5)
        self.upperView.layer.addSublayer(gradientLayer)
        
    }
    
    
    func showInfo(){
        
        let attrs1 = [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 30)]
        let boldString1 = NSMutableAttributedString(string: name, attributes:attrs1)
        let attrs2 = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 20)]
        let boldString2 = NSMutableAttributedString(string: desriptn, attributes:attrs2)
        let attrs3 = [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 15)]
        let boldString3 = NSMutableAttributedString(string: college, attributes:attrs3)
        let attrs4 = NSMutableAttributedString()
        attrs4.append(boldString1)
        attrs4.append(boldString2)
        attrs4.append(boldString3)
        label.attributedText = attrs4
        label.sizeToFit()
        heightConstraintOfLabel.constant = label.frame.size.height
        layoutIfNeeded()
        
    }
    
    
    func showObjective(){
        
        objectiveLabel.text = "Learning new and challenging technologies and become expertise."
        objectiveLabel.sizeToFit()
        heightConstraintOfObjectiveLbl.constant = objectiveLabel.frame.size.height
        layoutIfNeeded()

    }
 }
