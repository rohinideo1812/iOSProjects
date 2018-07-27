import UIKit
import SnapKit
import SMIconLabel

class ViewController: UIViewController {
    let upperView = UIView()
    let ambulanceImg = UIImageView()
    let baseView = UIView()
    let labelOnUpperView = SMIconLabel()
    let labelBelowUpperView = UILabel()
    let imageOnUpperView = UIImageView()
    let bottomView = UIView()
    let phoneView = UIView()
    let otpView = UIView()
    let loginBtn = UIButton()
    let phoneImg = UIImageView()
    let otpImg = UIImageView()
    let phoneTextField = UITextField()
    let otpTextField = UITextField()
    let resendOtpBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(ambulanceImg)
         ambulanceImg.snp.makeConstraints { (make) -> Void in
                    make.top.equalTo(self.view.snp.top).offset(20)
                    make.bottom.equalTo(self.view.snp.bottom).offset(0)
                    make.left.equalTo(self.view.snp.left).offset(0)
                    make.right.equalTo(self.view.snp.right).offset(0)
        }
        ambulanceImg.image = UIImage(named:"ambulance")
        self.view.addSubview(baseView)
        baseView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.view.snp.top).offset(20)
            make.bottom.equalTo(self.view.snp.bottom).offset(0)
            make.left.equalTo(self.view.snp.left).offset(0)
            make.right.equalTo(self.view.snp.right).offset(0)
        }
        baseView.backgroundColor = UIColor.lightGray
        baseView.layer.opacity = 0.9
        self.view.addSubview(upperView)
        upperView.layer.cornerRadius = 50
        upperView.snp.makeConstraints {(make) -> Void in
            make.top.equalTo(self.view.snp.top).offset(50)
            make.centerX.equalTo(self.view.snp.centerX)
            make.height.equalTo(85)
            make.width.equalTo(200)
        }
        self.view.addSubview(imageOnUpperView)
        imageOnUpperView.snp.makeConstraints {(make) -> Void in
            make.top.equalTo(upperView.snp.top).offset(8)
            make.left.equalTo(upperView.snp.left).offset(8)
            make.width.equalTo(40)
            make.height.equalTo(60)
        }
        imageOnUpperView.backgroundColor = UIColor.clear
        imageOnUpperView.image = UIImage(named:"baseline_language_white_18dp")
        self.view.addSubview(labelOnUpperView)
        labelOnUpperView.snp.makeConstraints {(make) -> Void in
            make.top.equalTo(upperView.snp.top).offset(8)
            make.right.equalTo(upperView.snp.right).offset(-8)
            make.left.equalTo(imageOnUpperView.snp.right).offset(8)
            make.height.equalTo(60)
        }
        labelOnUpperView.backgroundColor = UIColor.clear
        labelOnUpperView.layer.cornerRadius = 50
        labelOnUpperView.textColor = UIColor.white
        let normalText = "Care"
        let boldText = "SOS"
        let attrs2 = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 30)]
        let attrs1 = [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 30)]
        let boldString = NSMutableAttributedString(string: boldText, attributes:attrs2)
        let normalString = NSMutableAttributedString(string: normalText, attributes:attrs1)
        boldString.append(normalString)
        labelOnUpperView.attributedText = boldString
        self.view.addSubview(labelBelowUpperView)
        labelBelowUpperView.snp.makeConstraints{(make) in
            make.top.equalTo(upperView.snp.bottom).offset(4)
            make.centerX.equalTo(self.view.snp.centerX)
            make.height.equalTo(25)
            make.width.equalTo(200)
        }
        labelBelowUpperView.textAlignment = .center
        labelBelowUpperView.backgroundColor = UIColor.clear
        labelBelowUpperView.text = "Fast & Reliable"
        labelBelowUpperView.textColor = UIColor.white
        self.view.addSubview(bottomView)
        bottomView.snp.makeConstraints{(make)-> Void in
            make.top.equalTo(labelBelowUpperView.snp.bottom).offset(24)
            make.bottom.equalTo(self.view.snp.bottom).offset(-24)
            make.left.equalTo(self.view.snp.left).offset(24)
            make.right.equalTo(self.view.snp.right).offset(-24)
        }
        bottomView.backgroundColor = UIColor.clear
        bottomView.layer.opacity = 0
        self.view.addSubview(phoneView)
        phoneView.snp.makeConstraints{(make)-> Void in
            make.top.equalTo(bottomView.snp.top).offset(24)
            make.left.equalTo(bottomView.snp.left).offset(0)
            make.right.equalTo(bottomView.snp.right).offset(0)
            make.height.equalTo(50)
        }
        phoneView.backgroundColor = UIColor.white
        phoneView.layer.cornerRadius = 25
        phoneView.layer.opacity = 0.3
        self.view.addSubview(otpView)
        otpView.snp.makeConstraints{(make)-> Void in
            make.top.equalTo(phoneView.snp.bottom).offset(24)
            make.left.equalTo(bottomView.snp.left).offset(0)
            make.right.equalTo(bottomView.snp.right).offset(0)
            make.height.equalTo(50)
        }
        otpView.backgroundColor = UIColor.white
        otpView.layer.cornerRadius = 25
        otpView.layer.opacity = 0.3
        self.view.addSubview(loginBtn)
        loginBtn.snp.makeConstraints{(make)-> Void in
            make.top.equalTo(otpView.snp.bottom).offset(24)
            make.left.equalTo(bottomView.snp.left).offset(0)
            make.right.equalTo(bottomView.snp.right).offset(0)
            make.height.equalTo(50)
        }
        loginBtn.backgroundColor = UIColor(hexString: "#20EAE1")
        loginBtn.layer.cornerRadius = 25
        loginBtn.setTitle("Login", for: .normal)
        loginBtn.titleLabel?.textColor = UIColor.white
        phoneView.backgroundColor = UIColor.white
        phoneView.layer.cornerRadius = 25
        phoneView.layer.opacity = 0.3
        self.view.addSubview(phoneImg)
        phoneImg.snp.makeConstraints{(make)-> Void in
            make.top.equalTo(phoneView.snp.top).offset(8)
            make.left.equalTo(phoneView.snp.left).offset(24)
            make.width.equalTo(35)
            make.height.equalTo(35)
        }
        phoneImg.backgroundColor = UIColor.clear
        phoneImg.image = UIImage(named:"baseline_stay_current_portrait_white_18dp")
        self.view.addSubview(otpImg)
        otpImg.snp.makeConstraints{(make)-> Void in
            make.top.equalTo(otpView.snp.top).offset(8)
            make.left.equalTo(otpView.snp.left).offset(24)
            make.width.equalTo(35)
            make.height.equalTo(35)
        }
//        otpImg.transform = CGAffineTransform(rotationAngle: (360 * 180) / CGFloat.pi)
        otpImg.transform = otpImg.transform.rotated(by: CGFloat(M_PI_2))
        otpImg.backgroundColor = UIColor.clear
        otpImg.image = UIImage(named:"baseline_vpn_key_white_18dp")
        self.view.addSubview(phoneTextField)
        phoneTextField.snp.makeConstraints{(make)-> Void in
            make.top.equalTo(phoneView.snp.top).offset(8)
            make.left.equalTo(phoneImg.snp.right).offset(8)
            make.right.equalTo(phoneView.snp.right).offset(-8)
            make.height.equalTo(35)
        }
        phoneTextField.attributedPlaceholder = NSAttributedString(string: "Phone number",
                                                               attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        phoneTextField.textColor = UIColor.white
        self.view.addSubview(otpTextField)
        otpTextField.snp.makeConstraints{(make)-> Void in
            make.top.equalTo(otpView.snp.top).offset(8)
            make.left.equalTo(otpImg.snp.right).offset(8)
            make.right.equalTo(otpView.snp.right).offset(-8)
            make.height.equalTo(35)
        }
        otpTextField.attributedPlaceholder = NSAttributedString(string: "OTP",
                                                                  attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        otpTextField.textColor = UIColor.white
        otpTextField.isSecureTextEntry = true
        self.view.addSubview(resendOtpBtn)
        resendOtpBtn.snp.makeConstraints{(make)-> Void in
            make.top.equalTo(loginBtn.snp.bottom).offset(24)
            make.left.equalTo(bottomView.snp.left).offset(0)
            make.right.equalTo(bottomView.snp.right).offset(0)
            make.height.equalTo(50)
        }
            resendOtpBtn.backgroundColor = UIColor.clear
            resendOtpBtn.setTitle("Resend OTP", for: .normal)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.upperView.bounds
        gradientLayer.colors = [UIColor(hexString: "#3498DB").cgColor,UIColor(hexString:"#2ECC71").cgColor]
        gradientLayer.startPoint = CGPoint(x : 0.0,y : 0.5)
        gradientLayer.endPoint = CGPoint(x : 1.0,y : 0.5)
        gradientLayer.cornerRadius = 25
        upperView.layer.addSublayer(gradientLayer)
        }
    

}
