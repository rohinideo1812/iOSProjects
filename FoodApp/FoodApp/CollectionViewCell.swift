/**********************************************************************
 *  Purpose: Custom Collection Cell.
 *
 *  @author Rohini
 *  @version 4.0
 *  @since   10-07-2018
 *
 *********************************************************************/
import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.backgroundColor = UIColor.red.cgColor
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 7
        self.layer.shadowOffset = CGSize.zero
    }

}
