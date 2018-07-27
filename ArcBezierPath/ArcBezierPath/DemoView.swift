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
//        UIColor.orange.setFill()
//        path.fill()
        UIColor.purple.setStroke()
        path.stroke()
    }
    
    func createRectangle(){
        path = UIBezierPath()
        path.move(to: CGPoint(x: self.frame.size.width/2 + 150, y: 0))
//        path.addLine(to: CGPoint(x: self.frame.size.width - 50, y:0.0))
//        path.addArc(withCenter: CGPoint(x: -50, y: -50),
//                    radius: 400.0,
//                    startAngle: CGFloat(0.0).toRadians(),
//                    endAngle: CGFloat(90.0).toRadians(),
//                    clockwise: true)
//        path.close()to: CGPoint(x: self.frame.size.width - 200, y: self.frame.size.height/2 - 200)
        
        path.addCurve(to: CGPoint(x:-10, y: self.frame.size.height/2),
                      controlPoint1: CGPoint(x:200, y:200),
                      controlPoint2: CGPoint(x: self.frame.size.width/2 + 150, y:self.frame.size.height/2 + 200 ))
        
    }
   }

extension CGFloat {
    func toRadians() -> CGFloat {
        return self * CGFloat(M_PI) / 180.0
    }
}
