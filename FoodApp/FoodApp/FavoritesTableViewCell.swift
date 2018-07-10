/**********************************************************************
 *  Purpose: Favourites VC.
 *
 *  @author Rohini
 *  @version 4.0
 *  @since   10-07-2018
 *
 *********************************************************************/
import UIKit

class FavoritesTableViewCell: UITableViewCell {

    
    //Mark:Properties
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var heightConstraintOfLbl: NSLayoutConstraint!
    @IBOutlet weak var widthConstraintOfImg: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        label.sizeToFit()
        heightConstraintOfLbl.constant = label.frame.size.height
   
     }
   
 }
