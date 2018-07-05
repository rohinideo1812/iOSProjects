import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var heightConstrntOfLbl: NSLayoutConstraint!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var heightConstrntOfImg: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        label.sizeToFit()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
