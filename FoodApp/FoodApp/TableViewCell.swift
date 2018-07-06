import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var itemType: UILabel!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var orders: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var level: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    
}
