//
//  NoteAdditionViewController.swift
//  FundooNotes
//
//  Created by BridgeLabz on 21/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit
import XLActionController

class NoteAdditionViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    //Mark: IBOutlet
    @IBOutlet weak var heightConstraintOfView: NSLayoutConstraint!
    @IBOutlet weak var addNoteBottomView: AddNoteBottomView!
    @IBOutlet weak var noteAddUIView: NoteAddUIView!
    
    
    //Mark: Properties
    //var heightConstraintOfImageView: NSLayoutConstraint!
    let imagePicker = UIImagePickerController()
    var isBottonMenuVisible = true
    var note : NoteModel?
    var ispin = false
    var isArchive = false
    var remindDate : String?
//    var noteAddView : NoteAddUIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        configureNavigationBar()
        updateView()
//        noteAddUIView = NoteAddUIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 98))
       setTextFieldDelegates()
        addNoteBottomView.leftBottomMenuButton.addTarget(self, action: #selector(leftBottomButtonPress), for: .touchUpInside)
    }

    
    
    //MARK: NavigationBar buttons
    func configureNavigationBar(){
        
        let backBarButton = UIBarButtonItem(image : UIImage(named: "ic_keyboard_backspace"),landscapeImagePhone: nil, style: .done, target: self, action: #selector(backBarButtonPress))
        self.navigationItem.leftBarButtonItem = backBarButton
        let pinBarButton = UIBarButtonItem(image: UIImage(named: "ic_fiber_pin"), landscapeImagePhone: nil, style: .done, target: self, action: #selector(pinBarButtonPress))
        let reminderBarButton = UIBarButtonItem(image: UIImage(named: "ic_touch_app"), landscapeImagePhone: nil, style: .done, target: self, action: #selector(reminderBarButtonPress))
        let archiveBarButton = UIBarButtonItem(image: UIImage(named: "ic_archive"), landscapeImagePhone: nil, style: .done, target: self, action: #selector(archiveBarButtonPress))
        self.navigationItem.rightBarButtonItems = [archiveBarButton,reminderBarButton,pinBarButton]
         navigationController?.navigationBar.barTintColor = UIColor.white
    }
    
    @objc func backBarButtonPress(){
    if noteAddUIView.titleTextView.text == nil && noteAddUIView.noteTextView.text == nil && noteAddUIView.imageView.image == nil {
    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let newViewController = storyBoard.instantiateViewController(withIdentifier: "DashBoardViewController") as! DashBoardViewController
  self.navigationController?.pushViewController(newViewController, animated: true)

    }else {
        
//        note = NoteModel(title: noteAddView.titleTextView.text, note: noteAddView.noteTextView.text,image: noteAddView.imageView.image)
//            UserDataBase.sharedInstance.insertNoteData(object: note)
        
                }
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
        print("Tapped with Pin Button")
    }
    
    //Mark: Action on archiveBarButtonPress
    @objc func archiveBarButtonPress(){
        print("Tapped with Archive Button")
    }
    
    //Mark: Action on reminderBarButtonPress
    @objc func reminderBarButtonPress() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ReminderViewController") as! ReminderViewController
        self.navigationController?.pushViewController(newViewController, animated: true)
    }

    //Mark: Image picker Controller
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            let newImage = Helper.shared.getScaledImage(image: pickedImage, width: view.frame.size.width)
            self.noteAddUIView.imageView.contentMode = .scaleAspectFit
            self.noteAddUIView.imageView.image = newImage
            updateView(imageHeight : newImage.size.height)
        }
        dismiss(animated: true, completion: nil)
    }
}

    //Mark: TextView Delegates
    extension NoteAdditionViewController:UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        return true
    }
    
        
    func textViewDidBeginEditing(_ textView : UITextView){
        setPlaceholderText(textview: textView)
        
    }
    
        
    func textViewDidEndEditing(_ textView : UITextView){
        setPlaceholderText(textview: textView)
        

    }
    
        
    func textViewDidChange(_ textView: UITextView) {
        
        var text = ""
        var width : CGFloat = 0
        let font = UIFont.systemFont(ofSize: 14)
        if textView.tag == 1{
            text = self.noteAddUIView.titleTextView.text
            width = self.noteAddUIView.titleTextView.frame.size.width
            let height = heightForView(text: text, font: font, width: width)
            self.updateView(titleHeight : height)
            self.noteAddUIView.heightConstraintOftitleTextView.constant = height
            print("Title height is increasing  = ",height)
        } else if textView.tag == 2{
            text = self.noteAddUIView.noteTextView.text
            width = self.noteAddUIView.noteTextView.frame.size.width
            let height = heightForView(text: text, font: font, width: width)
            self.updateView(noteHeight : height)
            self.noteAddUIView.heightConstraintOfNoteTextView.constant = height
            print("Notes height is increasing  = ",height)
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
    
    //Mark: View Update
        func updateView(noteHeight : CGFloat = 0,titleHeight : CGFloat = 0,imageHeight : CGFloat = 0){
        
        if let image = self.noteAddUIView.imageView.image{
            let size = image.size
            let imgHeight = view.frame.width * (size.height/size.width)
            self.noteAddUIView.heightConstraintOfImageView.constant = imgHeight
        }else{
            self.noteAddUIView.heightConstraintOfImageView.constant = 0
        }
            var noteHeightConstant : CGFloat = self.noteAddUIView.heightConstraintOfNoteTextView.constant
            var titleHeightConstant : CGFloat =  self.noteAddUIView.heightConstraintOftitleTextView.constant
            if noteHeight != 0 {
                noteHeightConstant = noteHeight
            } else if titleHeight != 0 {
                titleHeightConstant = titleHeight
            }
        let height = self.noteAddUIView.heightConstraintOfImageView.constant + 38 + titleHeightConstant + noteHeightConstant
        print("Height of the updated view = ",height)
        self.noteAddUIView.contentView.frame.size.height = height + 50
        self.heightConstraintOfView.constant = height + 50
        self.noteAddUIView.layoutIfNeeded()
        self.view.layoutIfNeeded()
        
    }
   
    //Mark: Set PlaceHolder to TextView
    func setPlaceholderText(textview : UITextView){
            if textview.tag == 2 {
                if textview.text == "" {
                    textview.text = "Note"
                }else if textview.text == "Note"{
                    textview.text = ""
                    
                }
            } else if textview.tag == 1{
                if textview.text == ""{
                    textview.text = "Title"
                }else if textview.text == "Title"{
                    textview.text = ""
                }
            }
}
        
        
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
        
        func setTextFieldDelegates(){
            noteAddUIView.titleTextView.delegate = self
            noteAddUIView.titleTextView.tag = 1
            noteAddUIView.noteTextView.delegate = self
            noteAddUIView.noteTextView.tag = 2
        }
}
