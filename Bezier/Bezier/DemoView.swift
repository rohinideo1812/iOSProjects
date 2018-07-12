import UIKit


class DemoView: UIView {

    var path: UIBezierPath!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.gray
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func draw(_ rect: CGRect) {
        self.createRectangle()
        
        UIColor.orange.setFill()
        path.fill()
        
        // Specify a border (stroke) color.
        UIColor.purple.setStroke()
        path.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        self.layer.mask = shapeLayer
        
//        let image = #imageLiteral(resourceName: "cover")
//        let imageView = UIImageView(image: image)
//        imageView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
//        addSubview(imageView)
        let button   = UIButton(type: UIButtonType.system) as UIButton
        // set the frame
        button.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        button.setTitle("Test Button", for: .normal)
        button.addTarget(self, action: #selector(btnPress), for: UIControlEvents.touchUpInside)

        addSubview(button)
    }
    
    
    func createRectangle() {
        // Initialize the path.
        path = UIBezierPath()
        
        // Specify the point that the path should start get drawn.
        path.move(to: CGPoint(x: 0.0, y: 0.0))
        
        // Create a line between the starting point and the bottom-left side of the view.
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        
        // Create the bottom line (bottom-left to bottom-right).
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height - 100))
        
        // Create the vertical line from the bottom-right to the top-right side.
        path.addLine(to: CGPoint(x: self.frame.size.width, y: 0.0))
        
        // Close the path. This will create the last line automatically.
        path.close()

    }
    
    @objc func btnPress(){
        print("Btn pressed")
    }
    
}


