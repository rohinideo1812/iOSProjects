import UIKit
import UITextView_Placeholder


class SearchNoteUpperView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var crossBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    
    
    override init(frame : CGRect){
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private  func commonInit(){
        Bundle.main.loadNibNamed("SearchNoteUpperView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth,.flexibleWidth]
        textView.placeholder = "Search Notes"
    }
}
