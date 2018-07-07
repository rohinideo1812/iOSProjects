import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var itemType: UILabel!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var orders: SMIconLabel!
    @IBOutlet weak var time: SMIconLabel!
    @IBOutlet weak var level: SMIconLabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.backgroundColor = UIColor.red.cgColor
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 7
        self.layer.shadowOffset = CGSize.zero
//        orders.icon = UIImage(named:"baseline_restaurant_black_18dp")
//        orders.iconPosition = (.left,.center)
//        orders.iconPadding = 5
//        time.icon = UIImage(named:"baseline_query_builder_black_18dp")
//        time.iconPosition = (.left,.center)
//        time.iconPadding = 5
//        level.icon = UIImage(named:"baseline_dns_black_18dp")
//        level.iconPosition = (.left,.center)
//        level.iconPadding = 5
    }

    
}
