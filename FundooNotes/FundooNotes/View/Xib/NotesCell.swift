import UIKit
import SDWebImage

protocol NoteCellDelegate {
    func onImageLoaded(indexPath:IndexPath)
}
class NotesCell: UICollectionViewCell {
    
    //Mark : IBOulet
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pinBtn: UIButton!
    @IBOutlet weak var dateLabelHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleLabelHeightConstraint: NSLayoutConstraint!
    var delegate:NoteCellDelegate!
    var indexPath:IndexPath!
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.sizeToFit()
        self.backgroundColor = UIColor.clear
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.cornerRadius = 2
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize.zero

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        dateLabel.text = nil
        titleLabel.text = nil
    }
    
    func configureData(note : NoteItem){
        var date = ""
//            if let image = note.image {
//                let scaledImage = Helper.shared.getScaledImage(image: image, width: self.frame.size.width)
//                imageView.image = scaledImage
//                self.imageViewHeightConstraint.constant = scaledImage.size.height
//                
//            }else {
//                self.imageViewHeightConstraint.constant = 0
//            }
        
            //New
            if let url = note.imageUrl{
                let imageSize = Helper.shared.getScaledImageSize(oldSize: CGSize(width:note.imageWidth!,height:note.imageHeight!), width: self.frame.size.width)
              
                self.imageView.sd_setImage(with: URL(string: url), completed: nil)
                self.imageViewHeightConstraint.constant = imageSize.height
            }else{
                self.imageViewHeightConstraint.constant = 0
            }
            //End
            let text = Helper.shared.getAttributedString(mTitle: note.title, mSubtitle: note.subtitle)
            if text.length != 0{
                let textHeight = Helper.shared.getAttributedStringHeight(text: text, width: self.frame.size.width)
                self.titleLabel.attributedText = text
                self.titleLabelHeightConstraint.constant = textHeight
            }else{
                self.titleLabelHeightConstraint.constant = 0
                
            }
            if let reminderDate = note.remindDate {
                let dateArray = reminderDate.components(separatedBy: ",")
                if dateArray[0] != "" {
                     date = "\( dateArray[0])"
                }
                let font = UIFont.systemFont(ofSize: 12)
                let dateHeight = Helper.shared.getStringHeight(text: date, width: self.frame.size.width,font: font)
                dateLabel.text = date
                self.dateLabelHeightConstraint.constant = dateHeight
            }else{
                self.dateLabelHeightConstraint.constant = 0
                }
        
        if let pin = note.isPin {
            if pin {
                let image = UIImage(named: "ic_pin-1")
                self.pinBtn.setImage(image, for: UIControlState.normal)

            }else{
                self.pinBtn.alpha = 0
            }
        }
            }
    }
