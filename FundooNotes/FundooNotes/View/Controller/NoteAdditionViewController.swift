import UIKit
import XLActionController

class NoteAdditionViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,ReminderSetDelegate,AddNoteView,ColorSelected {
  
    
    //Mark: IBOutlet
    @IBOutlet weak var heightConstraintOfView: NSLayoutConstraint!
    @IBOutlet weak var addNoteBottomView: AddNoteBottomView!
    @IBOutlet weak var noteAddUIView: NoteAddUIView!
    
    
    //Mark: Properties
    let imagePicker = UIImagePickerController()
    var isBottonMenuVisible = true
    var isPin:Bool!
    var isArchive:Bool!
    var remindDate : String?
    var dictionary = [String : Any]()
    var noteObject : NoteItem!
    var isUpdate = false
    var archiveBarButton : UIBarButtonItem!
    var pinBarButton : UIBarButtonItem!
    let font = UIFont.systemFont(ofSize: 14)
    var addNotePresenter:AddNotePresenter?
    var notesCell:NotesCell!
    var colorSelected = "#ffffff"
    
    //Mark: Protocol Stub
    func pressedCheckButton(info: String) {
        remindDate = info
    }
    
    func startLoading() {
        
    }
    
    func finishLoading() {
        
    }
    
    func showMessage(message: String) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNotePresenter = AddNotePresenter(addnoteService:AddNoteService())
        addNotePresenter?.attachView(view: self)
        imagePicker.delegate = self
        configureNavigationBar()
        setData()
        updateView()
        initializeView()
        setTextFieldDelegates()
        addNoteBottomView.leftBottomMenuButton.addTarget(self, action: #selector(leftBottomButtonPress), for: .touchUpInside)
        addNoteBottomView.rightBottomMenuButton.addTarget(self, action: #selector(rightBottomButtonPress), for: .touchUpInside)
        navigationController?.navigationBar.barTintColor = UIColor.white
    }

    //Mark: Add Color To VC
    func colorSelected(color: String) {
        self.colorSelected = color
        setColorToView(hexvalue:colorSelected)
    }
    
    //Mark: Set Color To View
    func setColorToView(hexvalue : String){
        self.view.backgroundColor = UIColor(hexString: hexvalue)
        self.noteAddUIView.contentView.backgroundColor = UIColor(hexString: hexvalue)
        self.noteAddUIView.titleTextView.backgroundColor =  UIColor(hexString: hexvalue)
        self.noteAddUIView.noteTextView.backgroundColor =  UIColor(hexString: hexvalue)
    }
    
    //MARK: NavigationBar buttons
    func configureNavigationBar(){
        //Create Bar Buttons
        let backBarButton = UIBarButtonItem(image : UIImage(named: "ic_keyboard_backspace"),landscapeImagePhone: nil, style: .done, target: self, action: #selector(backBarButtonPress))
        self.pinBarButton = UIBarButtonItem(image: UIImage(named: "ic_fiber_pin"), landscapeImagePhone: nil, style: .done, target: self, action: #selector(pinBarButtonPress))
        let reminderBarButton = UIBarButtonItem(image: UIImage(named: "ic_touch_app"), landscapeImagePhone: nil, style: .done, target: self, action: #selector(reminderBarButtonPress))
        self.archiveBarButton = UIBarButtonItem(image: UIImage(named: "ic_archive"), landscapeImagePhone: nil, style: .done, target: self, action: #selector(archiveBarButtonPress))
        
        //Set Default Color
        backBarButton.tintColor =  UIColor.black
        self.pinBarButton.tintColor = UIColor.black
        reminderBarButton.tintColor = UIColor.black
        self.archiveBarButton.tintColor = UIColor.black
        
        //Set Bar Buttons to NavBar
        self.navigationItem.leftBarButtonItem = backBarButton
        self.navigationItem.rightBarButtonItems = [archiveBarButton,reminderBarButton,pinBarButton]
        
        //Set Nav Bar Background
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = UIColor.white
    }
    
    
    @objc func backBarButtonPress(){
        addNotePresenter?.attachView(view: self)

        if isUpdate == false{
        let id = NSUUID().uuidString
        let date = Helper.shared.getFormatedDate()
            noteObject = NoteItem(title: noteAddUIView.titleTextView.text, subtitle: noteAddUIView.noteTextView.text,image: noteAddUIView.imageView.image, isPin: self.isPin, isArchive: self.isArchive, remindDate: self.remindDate,date: date,id: id,isDelete : false, imageHeight: noteAddUIView.imageView.image?.size.height, imageWidth: noteAddUIView.imageView.image?.size.width,imageUrl:"",color:colorSelected)
//            addNotePresenter?.addNote(object: self.noteObject)
            addNotePresenter?.storeNoteData(object: self.noteObject)
        }else {
            let date = Helper.shared.getFormatedDate()
            archiveBarButtonPress()
            pinBarButtonPress()
//           var previousSelectedColor = noteObject.color
//            if colorSelected == previousSelectedColor{
//                colorSelected = previousSelectedColor!
//            }
            noteObject = NoteItem(title: noteAddUIView.titleTextView.text, subtitle: noteAddUIView.noteTextView.text,image: noteAddUIView.imageView.image, isPin: isPin, isArchive: isArchive, remindDate: remindDate,date: date,id: noteObject?.id,isDelete : false, imageHeight: noteAddUIView.imageView.image?.size.height, imageWidth: noteAddUIView.imageView.image?.size.width,imageUrl:"",color:colorSelected)
//            addNotePresenter?.updateNote(object:self.noteObject)
          addNotePresenter?.updateNoteDataWith(object: self.noteObject)

        }

//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let newViewController = storyBoard.instantiateViewController(withIdentifier: "DashBoardViewController") as! DashBoardViewController
        self.navigationController?.popViewController(animated: true)
    }
    
    //Mark: Action on Bottom Right Button Press
    @objc func rightBottomButtonPress(){
        let colorVC = ColorViewController()
        colorVC.delegate = self
        colorVC.modalPresentationStyle = .overCurrentContext
        colorVC.modalTransitionStyle = .crossDissolve
        //colorVC.modalPresentationStyle = UIModalPresentationStyle.popover
        //colorVC.definesPresentationContext = true
        self.present(colorVC, animated: true, completion:nil)

    }
    
    
    //Mark: Action on Bottom Left Button Press
    @objc func leftBottomButtonPress() {
        
        let actionController = YoutubeActionController()
        
        actionController.addAction(Action(ActionData(title: "Take photo", image: UIImage(named: "ic_camera_alt")!), style: .default, handler: { action in
        }))
        actionController.addAction(Action(ActionData(title: "Choose image", image: UIImage(named: "ic_choose_image")!), style: .default, handler: { action in
            self.imagePicker.allowsEditing = false
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: true, completion: nil)
        }))
        actionController.addAction(Action(ActionData(title: "Drawing", image: UIImage(named: "ic_border_color")!), style: .default, handler: { action in
        }))
        actionController.addAction(Action(ActionData(title: "Recording", image: UIImage(named: "ic_settings_voice")!), style: .cancel, handler: nil))
        
        actionController.addAction(Action(ActionData(title: "Tick boxes", image: UIImage(named: "ic_view_list")!), style: .cancel, handler: nil))
        present(actionController, animated: true, completion: nil)
    }
    
    
    //Mark: Action on pinBarButtonPress
    @objc func pinBarButtonPress(){
        self.isPin = self.isPin ? false : true
        pinBarButton.tintColor = self.isPin ? UIColor.blue : UIColor.black
        
   }
    
    
    //Mark: Action on archiveBarButtonPress
    @objc func archiveBarButtonPress(){
        isArchive =  isArchive ? false : true
        archiveBarButton.tintColor = isArchive ?  UIColor.blue : UIColor.black
        
    }
    
    
    //Mark: Action on reminderBarButtonPress
    @objc func reminderBarButtonPress() {
        if let title = noteAddUIView.titleTextView.text{
            dictionary.updateValue(title, forKey: "Title")

        }
        if let note = noteAddUIView.noteTextView.text{
            dictionary.updateValue(note, forKey: "Note")

        }
        if let image = noteAddUIView.imageView.image{
    dictionary.updateValue(UIImagePNGRepresentation(image), forKey: "Image")
            
        }
    Helper.shared.updateUserDefaultVCData(forKey:Constants.CacheKeys.ADD_NOTE_VC , value: dictionary)
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ReminderViewController") as! ReminderViewController
        newViewController.delegate = self
        self.navigationController?.pushViewController(newViewController, animated: true)
    }

    
    //Mark: Image picker Controller
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            let newImage = Helper.shared.getScaledImage(image: pickedImage, width: view.frame.size.width)
            self.noteAddUIView.imageView.contentMode = .scaleAspectFit
            self.noteAddUIView.imageView.image = newImage
            updateView()
                }
        dismiss(animated: true, completion: nil)
        
        }
    }

    //Mark: TextView Delegates
    extension NoteAdditionViewController:UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        return true
    }
    
 
    func textViewDidChange(_ textView: UITextView) {
        var text = ""
        var width : CGFloat = 0
        if textView.tag == 1{
            text = self.noteAddUIView.titleTextView.text
            width = self.noteAddUIView.titleTextView.frame.size.width
            let height = heightForView(text: text, font: font, width: width)
            self.updateView()
        self.noteAddUIView.heightConstraintOftitleTextView.constant = height
        } else if textView.tag == 2{
            text = self.noteAddUIView.noteTextView.text
            width = self.noteAddUIView.noteTextView.frame.size.width
            let height = heightForView(text: text, font: font, width: width)
            self.updateView()
        self.noteAddUIView.heightConstraintOfNoteTextView.constant = height
        }
    
        if textView.tag == 1{
            setTextViewSize(textview: textView)
        }else if textView.tag == 2{
            setTextViewSize(textview: textView)
        }
        
    }
 
        
    //Mark: Get height of View
    func heightForView(text:String?, font:UIFont, width:CGFloat) -> CGFloat {
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        if label.frame.height < 40 {
            return 40
        }else {
            return label.frame.height
        }
    }
    
        //Mark: Update View
        func updateView(){
        var height:CGFloat = 84
        var titleTextViewHeight : CGFloat = 0
        var noteTextViewHeight : CGFloat = 0
        if let image = self.noteAddUIView.imageView.image{
        let size = image.size
        let imgHeight = view.frame.width * (size.height/size.width)
        self.noteAddUIView.heightConstraintOfImageView.constant = imgHeight
            height  += imgHeight
        }else{
         self.noteAddUIView.heightConstraintOfImageView.constant = 0
        }
            if (self.noteAddUIView.titleTextView.text) != nil{
               titleTextViewHeight = self.noteAddUIView.titleTextView.frame.size.height
                self.noteAddUIView.heightConstraintOftitleTextView.constant = titleTextViewHeight
                height += titleTextViewHeight
            }
            if titleTextViewHeight < 30{
                self.noteAddUIView.heightConstraintOfNoteTextView.constant = 30
                  height += 30
            }
            if (self.noteAddUIView.noteTextView.text) != nil{
               noteTextViewHeight = self.noteAddUIView.noteTextView.frame.size.height
                self.noteAddUIView.heightConstraintOfNoteTextView.constant = noteTextViewHeight
                height += noteTextViewHeight
           
            }
            if noteTextViewHeight < 30{
                self.noteAddUIView.heightConstraintOfNoteTextView.constant = 30
                height += 30
            }
            self.noteAddUIView.contentView.frame.size.height = height
            self.heightConstraintOfView.constant = height
            self.noteAddUIView.layoutIfNeeded()
            self.view.layoutIfNeeded()
            
        }


        //Mark: Set TextView Size
        func setTextViewSize(textview : UITextView){
            if textview.contentSize.height > textview.frame.size.height {
                
                let fixedWidth = textview.frame.size.width
                textview.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
                
                var newFrame = textview.frame
                let newSize = textview.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
                
                newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
                
                textview.frame = newFrame;
            }
        }
        
        
        //Mark: Set TextField Delegates
        func setTextFieldDelegates(){
            noteAddUIView.titleTextView.delegate = self
            noteAddUIView.titleTextView.tag = 1
            noteAddUIView.noteTextView.delegate = self
            noteAddUIView.noteTextView.tag = 2
        }
        
        private func setData(){
            if isUpdate == true{
                guard let title = noteObject.title else{
                    return
                }
                self.noteAddUIView.titleTextView.text = title
                var text = title
                var width = self.noteAddUIView.titleTextView.frame.size.width
                var height = heightForView(text: text, font: font, width: width)
                self.noteAddUIView.heightConstraintOftitleTextView.constant = height
                self.updateView()
                guard let subtitle = noteObject.subtitle else{
                    return
                }
                self.noteAddUIView.noteTextView.text = subtitle
                text = subtitle
                width = self.noteAddUIView.noteTextView.frame.size.width
                height = heightForView(text: text, font: font, width: width)
            self.noteAddUIView.heightConstraintOfNoteTextView.constant = height
                self.updateView()
            if let url = noteObject.imageUrl{
                let width = self.noteAddUIView.imageView.frame.size.width
                let imageSize = Helper.shared.getScaledImageSize(oldSize: CGSize(width:noteObject.imageWidth!,height:noteObject.imageHeight!), width: width)
                        self.noteAddUIView.imageView.sd_setImage(with: URL(string: url), completed: nil)
                 self.noteAddUIView.heightConstraintOfImageView.constant = imageSize.height
                    } else {
                self.noteAddUIView.heightConstraintOfImageView.constant = 0
                    }
                   self.updateView()
                
//                guard let image = noteObject.image else{
//                    return
//                }
//                self.noteAddUIView.imageView.image = image
//                self.noteAddUIView.heightConstraintOfImageView.constant = image.size.height
//                updateView()
                if let color = noteObject.color{
                    setColorToView(hexvalue:color)
                    colorSelected = color
                }
            }
        }


        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
           navigationController?.navigationBar.barTintColor = UIColor.white
        }
        
        
        func initializeView(){
            if isUpdate{
                self.isPin = noteObject.isPin!
                self.isArchive = noteObject.isArchive!
                self.isPin = self.isPin ? false : true
                pinBarButton.tintColor = self.isPin ? UIColor.black : UIColor.blue
                self.isArchive =  self.isArchive ? false : true
                archiveBarButton.tintColor = isArchive ?  UIColor.black : UIColor.blue
            }else{
                self.isPin = false
                self.isArchive = false
            }
        }
}
