import UIKit
import SnapKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
            NotificationCenter.default.addObserver(self, selector: #selector(deviceDidRotate), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)

        
     }
    
    @objc func deviceDidRotate(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor(hexString: "#5DADE2").cgColor,UIColor(hexString:"#2ECC71").cgColor]
        self.view.layer.addSublayer(gradientLayer)
        let imageView = UIImageView()
        self.view.addSubview(imageView)
        imageView.layer.cornerRadius = 100
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.backgroundColor = UIColor.red.cgColor
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOpacity = 0.3
        imageView.layer.shadowRadius = 7
        imageView.layer.shadowOffset = CGSize.zero
        let bottomView = UIView()
        self.view.addSubview(bottomView)
        let nameTextField = UITextField()
        self.view.addSubview(nameTextField)
        let passwordTextField = UITextField()
        self.view.addSubview(passwordTextField)
        let button = UIButton()
        self.view.addSubview(button)
        bottomView.layer.backgroundColor = UIColor.white.cgColor
        bottomView.layer.opacity = 0
        passwordTextField.layer.opacity = 0.3
        passwordTextField.layer.backgroundColor = UIColor.white.cgColor
        passwordTextField.layer.cornerRadius = 15.0
        passwordTextField.placeholder = "Enter Password"
        button.setTitle("SignIn",for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.backgroundColor = UIColor.red.cgColor
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 15.0
        nameTextField.layer.opacity = 0.3
        nameTextField.layer.backgroundColor = UIColor.white.cgColor
        nameTextField.layer.cornerRadius = 15.0
        nameTextField.placeholder = "Enter userId"
        
        if  UIDeviceOrientationIsPortrait(UIDevice.current.orientation){
            imageView.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(self.view.snp.top).offset(50)
                make.centerX.equalTo(self.view.snp.centerX)
                make.width.equalTo(200)
                make.height.equalTo(200)
            }
            bottomView.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(imageView.snp.bottom).offset(24)
                make.centerX.equalTo(self.view.snp.centerX)
                make.left.equalTo(self.view.snp.left).offset(24)
                make.right.equalTo(self.view.snp.right).offset(-24)
                make.bottom.equalTo(self.view.snp.bottom).offset(-24)
            }
            
            nameTextField.snp.makeConstraints {(make)  -> Void in
                make.top.equalTo(bottomView.snp.top).offset(24)
                make.centerX.equalTo(self.view.snp.centerX)
                make.left.equalTo(bottomView.snp.left).offset(0)
                make.right.equalTo(bottomView.snp.right).offset(0)
                make.height.equalTo(40)
            }
            
            passwordTextField.snp.makeConstraints {(make)  -> Void in
                make.top.equalTo(nameTextField.snp.bottom).offset(24)
                make.centerX.equalTo(self.view.snp.centerX)
                make.left.equalTo(bottomView.snp.left).offset(0)
                make.right.equalTo(bottomView.snp.right).offset(0)
                make.height.equalTo(40)
            }
            
            button.snp.makeConstraints {(make)  -> Void in
                make.top.equalTo(passwordTextField.snp.bottom).offset(24)
                make.centerX.equalTo(self.view.snp.centerX)
                make.left.equalTo(bottomView.snp.left).offset(0)
                make.right.equalTo(bottomView.snp.right).offset(0)
                make.height.equalTo(40)
            }
        }
        
         if UIDeviceOrientationIsLandscape(UIDevice.current.orientation) {
            imageView.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(self.view.snp.top).offset(50)
                make.left.equalTo(self.view.snp.left).offset(8)
                make.width.equalTo(200)
                make.height.equalTo(200)
            }
            bottomView.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(self.view.snp.top).offset(50)
                make.left.equalTo(imageView.snp.right).offset(24)
                make.right.equalTo(self.view.snp.right).offset(-24)
                make.bottom.equalTo(self.view.snp.bottom).offset(-24)
            }
            nameTextField.snp.makeConstraints {(make)  -> Void in
                make.top.equalTo(bottomView.snp.top).offset(24)
                make.left.equalTo(bottomView.snp.left).offset(0)
                make.right.equalTo(bottomView.snp.right).offset(0)
                make.height.equalTo(40)
            }
            
            passwordTextField.snp.makeConstraints {(make)  -> Void in
                make.top.equalTo(nameTextField.snp.bottom).offset(24)
                make.left.equalTo(bottomView.snp.left).offset(0)
                make.right.equalTo(bottomView.snp.right).offset(0)
                make.height.equalTo(40)
            }
            
            button.snp.makeConstraints {(make)  -> Void in
                make.top.equalTo(passwordTextField.snp.bottom).offset(24)
                make.left.equalTo(bottomView.snp.left).offset(0)
                make.right.equalTo(bottomView.snp.right).offset(0)
                make.height.equalTo(40)
            }
        }
        }
        
       }
    

    

    



    



