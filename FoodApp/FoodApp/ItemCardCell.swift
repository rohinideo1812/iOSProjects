/**********************************************************************
 *  Purpose: ItemCardCell.
 *
 *  @author Rohini
 *  @version 4.0
 *  @since   10-07-2018
 *
 *********************************************************************/
import UIKit


class ItemCardCell: UITableViewCell {

    //Mark:Properties
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var likes: SMIconLabel!
    @IBOutlet weak var level: SMIconLabel!
    @IBOutlet weak var peoples: SMIconLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        type.sizeToFit()
        name.sizeToFit()
        likes.icon = UIImage(named:"baseline_restaurant_black_18dp")
        likes.iconPosition = (.left,.center)
        likes.iconPadding = 5
        peoples.icon = UIImage(named:"baseline_query_builder_black_18dp")
        peoples.iconPosition = (.left,.center)
        peoples.iconPadding = 5
        level.icon = UIImage(named:"baseline_dns_black_18dp")
        level.iconPosition = (.left,.center)
        level.iconPadding = 5
    
    
    }


}
