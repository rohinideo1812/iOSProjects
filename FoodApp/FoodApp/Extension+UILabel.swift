import UIKit

extension UILabel {
    func set(image: UIImage, with text: String) {
        let attachment = NSTextAttachment()
        attachment.image = image
        attachment.bounds = CGRect(x: 0, y: 0, width: 10, height: 10)
        let attachmentStr = NSAttributedString(attachment: attachment)
        
        let mutableAttributedString = NSMutableAttributedString()
        mutableAttributedString.append(attachmentStr)
        
        let textString = NSAttributedString(string: text, attributes: [.font: self.font])
        mutableAttributedString.append(textString)
        
        self.attributedText = mutableAttributedString
    }
}
