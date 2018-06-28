import UIKit
import XLActionController
import UITextView_Placeholder

class DashBoardViewController: UIViewController, ENSideMenuDelegate,MenuDelegate,UIGestureRecognizerDelegate,UITextFieldDelegate,NoteCellDelegate,ColorSelected {
    
    //Mark:IBOutlet
    @IBOutlet var longPressGesture: UILongPressGestureRecognizer!
    @IBOutlet weak var dashboardBottomView: DashBoardBottomView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    //Mark:Properties
    let dashBoardPresenter = DashBoardPresenter(dashBoardService:DashBoardService())
    var notes = [NoteItem]()
    var noOfColumns = 2
    let reuseIdentifier = "NotesCell"
    var viewTypeBtn:UIBarButtonItem!
    var name : String?
    var email : String?
    var selectedNavColor:String? = Constants.Color.NavBarColor.yellowDark.rawValue
    var slideMenuVC:MyMenuTableViewController?
    var type:NoteType = .notes
    var selectedIndexPath: [IndexPath] = []
    var longPressed = false
    var tapPressed = false
    var menuButton:UIBarButtonItem!
    var optionButton:UIBarButtonItem!
    var searchButton:UIBarButtonItem!
    var chooseColorButton:UIBarButtonItem!
    var backButton:UIBarButtonItem!
    var closeButton:UIBarButtonItem!
    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let textField = UITextField()
    var restoreButton:UIBarButtonItem!
    var isTappedUserNotification = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        longPressGesture.minimumPressDuration = 0.5
        longPressGesture.delegate = self
        longPressGesture.delaysTouchesBegan = true
        self.collectionView?.addGestureRecognizer(longPressGesture)
        slideMenuVC = MyMenuTableViewController()
        slideMenuVC?.delegate = self
        self.sideMenuController()?.sideMenu?.delegate = self
        dashBoardPresenter.attachView(view: self)
        dashBoardPresenter.getNotes(type:.notes)
        dashboardBottomView.addNoteBtn.addTarget(self, action: #selector(takeNoteButtonPress), for: .touchUpInside)
        textField.delegate = self
        //        let myMenuTableViewController = MyMenuTableViewController()
        //        myMenuTableViewController.email = email!
        //        myMenuTableViewController.name = name!
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
            layout.numberOfColumns = 2
            layout.cellPadding = 8
        
        }
        let nib = UINib(nibName: reuseIdentifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        
    }
    
    
    //Mark: Protocol implementation of SideMenu Selection
    func sideMenuDidSelected(noteType: NoteType) {
        print(noteType)
        self.type = noteType
        switch type {
        case .archive,.reminders:
            self.selectedNavColor = Constants.Color.NavBarColor.brownDark.rawValue
        case .notes:
            self.selectedNavColor = Constants.Color.NavBarColor.yellowDark.rawValue
        case .delete:
            self.selectedNavColor = Constants.Color.NavBarColor.greyDark.rawValue
        case .search:
            self.selectedNavColor = Constants.Color.colorWhite
        }
        if let navColor = self.selectedNavColor{
        self.navigationController?.navigationBar.barTintColor = UIColor(hexString: navColor)
        }
        dashBoardPresenter.attachView(view: self)
        dashBoardPresenter.getNotes(type:self.type)
    }

    
    func colorSelected(color: String) {
        var tempNotes:[NoteItem]? = []
        let noteIndex =  Helper.shared.getIndexPathRow(selectedNotes:selectedIndexPath)
        for index in noteIndex {
            self.notes[index].color = color
            self.notes[index].date = Helper.shared.getFormatedDate()
            tempNotes?.append(self.notes[index])
        }
        self.dashBoardPresenter.updateNotesWith(objects: tempNotes!)
        self.dashBoardPresenter.getNotes(type: .notes)
        self.navigationItem.leftBarButtonItem = self.menuButton
        self.menuButton.tintColor = UIColor.blue
        self.searchButton.tintColor = UIColor.blue
        self.navigationItem.rightBarButtonItems = [self.viewTypeBtn,self.searchButton]
        self.deSelectAllCell()
        
        defer{
            tempNotes = nil
        }
        
    }
    

    func sideMenuWillOpen() {
        
    }
    
    func sideMenuWillClose() {

    }
    
    func sideMenuShouldOpenSideMenu() -> Bool {
        return true
    }
    
    func sideMenuDidOpen() {
        
    }
    
    func sideMenuDidClose() {
        
    }
    
    func onImageLoaded(indexPath:IndexPath) {
        self.collectionView.reloadItems(at: [indexPath])
    }
    
    
    //Mark: Action on Long Press
    @IBAction func longPressGesture(_ sender: UILongPressGestureRecognizer) {
        self.collectionView.allowsMultipleSelection = true
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.rightBarButtonItems = nil
        if self.type == .delete{
            self.navigationItem.rightBarButtonItems = [self.optionButton,self.restoreButton]
        }else if self.type == .archive{
            self.navigationItem.rightBarButtonItem = self.optionButton
        }
        else{
        self.navigationItem.rightBarButtonItems = [self.optionButton,self.chooseColorButton]
        }
        self.navigationItem.leftBarButtonItem = backButton
        if sender.state != .ended {
            return
        }
        
            let point = sender.location(in: self.collectionView)
            if let indexPath = self.collectionView.indexPathForItem(at: point){
                
                if selectedIndexPath.contains(indexPath){
                    self.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: UICollectionViewScrollPosition.centeredHorizontally)
                    self.collectionView.delegate?.collectionView!(collectionView, didDeselectItemAt: indexPath)
                } else {
                    self.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: UICollectionViewScrollPosition.centeredHorizontally)
                    self.collectionView.delegate?.collectionView!(collectionView, didSelectItemAt: indexPath)
                
                }
            }else{
                print("Index not found")
        }
    }
    
    //Mark:Configure Navigation Bar
    func configureNavigationBar(){
        
        //create Bar Button
        viewTypeBtn = UIBarButtonItem(image: UIImage(named: "ic_view_stream"), style: .plain, target: self, action: #selector(changeViewType))
        menuButton = UIBarButtonItem(image: UIImage(named: "ic_view_headline"), style: .plain, target: self, action: #selector(menuButtonPress))
        searchButton = UIBarButtonItem(image: UIImage(named: "ic_search"), style: .plain, target: self, action: #selector(searchButtonPress))
         optionButton = UIBarButtonItem(image: UIImage(named: "ic_more_vert_black"), style: .done, target: self, action: #selector(options))
        backButton = UIBarButtonItem(image: UIImage(named: "ic_keyboard_backspace"), style: .plain, target: self, action: #selector(backButtonPress))
        chooseColorButton = UIBarButtonItem(image: UIImage(named: "ic_color_lens_black_18dp"), style: .plain, target: self, action: #selector(chooseColorButtonPress))
        restoreButton =  UIBarButtonItem(image: UIImage(named: "ic_restore"), style: .plain, target: self, action: #selector(restoreButtonPress))
        
        
        //set Bar Buttons on NavBar
        self.navigationItem.leftBarButtonItem = menuButton
        self.navigationItem.rightBarButtonItems = [viewTypeBtn,searchButton]
       
        //Edit NavBar
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.black.cgColor
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width:2.0,height: 2.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 4.0
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.5
        
        //set color to Bar Buttons
        self.viewTypeBtn.tintColor = UIColor.white
        self.optionButton.tintColor = UIColor.white
        self.backButton.tintColor = UIColor.white
        self.chooseColorButton.tintColor = UIColor.white
        self.menuButton.tintColor = UIColor.white
        self.searchButton.tintColor = UIColor.white
        self.restoreButton.tintColor = UIColor.white
        
        
    }
    
   
    //Mark: Options on OptionBtn Click
    @objc func options(){
    
    let noteIndex =  Helper.shared.getIndexPathRow(selectedNotes:selectedIndexPath)
        
    let actionController = YoutubeActionController()
    
        if self.type == .delete {
            
            actionController.addAction(Action(ActionData(title: "Delete foreever"), style: .default, handler: { action in
                
                var tempNotes:[NoteItem]? = []
                for index in noteIndex {
                    tempNotes?.append(self.notes[index])
                    self.notes.remove(at: index)
                }
                DataManager.shared.deleteNoteDataWith(objects: tempNotes!, callback: {result,message in
                    
                })
                //self.dashBoardPresenter.updateNotes(objects: tempNotes!)
                self.collectionView.performBatchUpdates({ () -> Void in
                    self.collectionView.deleteItems(at: self.selectedIndexPath)
                }, completion: { _ in
                    self.dashBoardPresenter.getNotes(type: self.type)
                    self.navigationItem.leftBarButtonItem = self.menuButton
                    self.navigationItem.rightBarButtonItems = [self.viewTypeBtn,self.searchButton]
                    self.deSelectAllCell()
                })
               
            }))

        }else if self.type == .archive {
            
            actionController.addAction(Action(ActionData(title: "Unarchive"), style: .default, handler: { action in
                
                var tempNotes:[NoteItem]? = []
                for index in noteIndex {
                    self.notes[index].isArchive = false
                    self.notes[index].date = Helper.shared.getFormatedDate()
                    tempNotes?.append(self.notes[index])
                    self.notes.remove(at: index)
                }
                self.dashBoardPresenter.updateNotesWith(objects: tempNotes!)
                //self.dashBoardPresenter.updateNotes(objects: tempNotes!)
                self.collectionView.performBatchUpdates({ () -> Void in
                    self.collectionView.deleteItems(at: self.selectedIndexPath)
                }, completion: { _ in
                    self.dashBoardPresenter.getNotes(type: self.type)
                    self.navigationItem.leftBarButtonItem = self.menuButton
                    self.navigationItem.rightBarButtonItems = [self.viewTypeBtn,self.searchButton]
                    self.deSelectAllCell()
                })
                defer{
                    tempNotes = nil
                }
                
                
            }))
        }else{
    actionController.addAction(Action(ActionData(title: "Archive"), style: .default, handler: { action in
        var tempNotes:[NoteItem]? = []
        for index in noteIndex {
            self.notes[index].isArchive = true
            self.notes[index].date = Helper.shared.getFormatedDate()
            tempNotes?.append(self.notes[index])
            self.notes.remove(at: index)
        }
        self.dashBoardPresenter.updateNotesWith(objects: tempNotes!)
        //self.dashBoardPresenter.updateNotes(objects: tempNotes!)
        self.collectionView.performBatchUpdates({ () -> Void in
        self.collectionView.deleteItems(at: self.selectedIndexPath)
        }, completion: { _ in
            self.dashBoardPresenter.getNotes(type: .notes)
            self.navigationItem.leftBarButtonItem = self.menuButton
            self.navigationItem.rightBarButtonItems = [self.viewTypeBtn,self.searchButton]
            self.deSelectAllCell()
        })
        defer{
            tempNotes = nil
        }
        
    }))
        
    actionController.addAction(Action(ActionData(title: "Delete"), style: .default, handler: { action in
        var tempNotes:[NoteItem]? = []
        self.dashBoardPresenter.attachView(view: self)
        
        for index in noteIndex {
            self.notes[index].isDelete = true
            self.notes[index].date = Helper.shared.getFormatedDate()
            tempNotes?.append(self.notes[index])
            self.notes.remove(at: index)
        }
        self.dashBoardPresenter.updateNotesWith(objects: tempNotes!)
        // self.dashBoardPresenter.updateNotes(objects: tempNotes!)
        self.collectionView.performBatchUpdates({ () -> Void in
            self.collectionView.deleteItems(at: self.selectedIndexPath)
        }, completion: { _ in
            self.dashBoardPresenter.getNotes(type: .notes)
            self.navigationItem.leftBarButtonItem = self.menuButton
            self.navigationItem.rightBarButtonItems = [self.viewTypeBtn,self.searchButton]
            self.deSelectAllCell()

        })
        defer{
            tempNotes = nil
            self.collectionView.allowsMultipleSelection = false
        }
    }))
        }
        
       present(actionController, animated: true, completion: nil)
    }
    
    func deSelectAllCell(){
        if let indexPaths = collectionView.indexPathsForSelectedItems{
            if indexPaths.count > 0{
                for indexPath in indexPaths{
                    self.collectionView.delegate?.collectionView!(self.collectionView, didDeselectItemAt: indexPath)
                }
                self.collectionView.allowsMultipleSelection = false
            }
        }
    }
    
    
    //Mark: Action on chooseColorButtonPress
    @objc func chooseColorButtonPress(){
        let colorVC = ColorViewController()
        colorVC.delegate = self
        colorVC.modalPresentationStyle = .overCurrentContext
        colorVC.modalTransitionStyle = .crossDissolve
        self.present(colorVC, animated: true, completion:nil)
        
    }
    
    
    //Mark: Action on Closebtn Click
     @objc func closeButtonPress(){
       dashboardBottomView.isHidden = false
       self.searchButton.tintColor = UIColor.blue
       self.navigationItem.leftBarButtonItem = menuButton
       self.navigationItem.rightBarButtonItem = viewTypeBtn
       self.dashBoardPresenter.getNotes(type: .notes)
       self.textField.text = ""
       self.textField.isHidden = true
    }
    
    
   //Mark:Restore Button Press
   @objc func restoreButtonPress(){
    
    let noteIndex =  Helper.shared.getIndexPathRow(selectedNotes:selectedIndexPath)

    var tempNotes:[NoteItem]? = []
    for index in noteIndex {
        self.notes[index].isDelete = false
        self.notes[index].date = Helper.shared.getFormatedDate()
        tempNotes?.append(self.notes[index])
        self.notes.remove(at: index)
    }
    self.dashBoardPresenter.updateNotesWith(objects: tempNotes!)
    //self.dashBoardPresenter.updateNotes(objects: tempNotes!)
    self.collectionView.performBatchUpdates({ () -> Void in
        self.collectionView.deleteItems(at: self.selectedIndexPath)
    }, completion: { _ in
        self.dashBoardPresenter.getNotes(type: self.type)
        self.navigationItem.leftBarButtonItem = self.menuButton
        self.navigationItem.rightBarButtonItems = [self.viewTypeBtn,self.searchButton]
        self.deSelectAllCell()
    })
    defer{
        tempNotes = nil
    }
    
    }
    
    
    @objc func backButtonPress(){
       deSelectAllCell()
    }
    
    //Mark: Action on Searchbtn Click
    @objc func searchButtonPress(){
        self.textField.isHidden = false
        notes.removeAll()
        collectionView.reloadData()
        dashboardBottomView.isHidden = true
        backButton = UIBarButtonItem(image: UIImage(named: "ic_keyboard_backspace"), style: .done, target: self, action: #selector(closeButtonPress))
        closeButton = UIBarButtonItem(image: UIImage(named: "ic_close"), style: .done, target: self, action: #selector(closeButtonPress))
        self.searchButton.tintColor = UIColor.clear
        self.navigationItem.leftBarButtonItem = backButton
        self.navigationItem.rightBarButtonItem = closeButton
        textField.placeholder = "Search Notes"
        self.navigationItem.titleView = textField
    }
    
    //Mark: Action on Viewbtn Click
    @objc func changeViewType(){
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
            if noOfColumns == 1{
                layout.numberOfColumns = 2
                noOfColumns = 2
                viewTypeBtn.image = UIImage(named : "ic_view_stream")
            }else if noOfColumns == 2{
                layout.numberOfColumns = 1
                noOfColumns = 1
                viewTypeBtn.image = UIImage(named : "ic_view_quilt")
            }
            collectionView.collectionViewLayout.invalidateLayout()
            collectionView.reloadData()
        }
    }
    
    
    //Mark: Action on Menubtn Click
     @objc func menuButtonPress(){
        toggleSideMenuView()
        //self.dismiss(animated: true, completion: nil)

    }
    
    //Mark: Action on TakeNoteBtn Press
    @objc func takeNoteButtonPress(){
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "NoteAdditionViewController") as!  NoteAdditionViewController
        self.navigationController?.pushViewController(newViewController, animated: true)
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newString = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
        dashBoardPresenter.userEnteredString = newString
        self.dashBoardPresenter.getNotes(type: .search)
        return true
    }
    
}

extension DashBoardViewController:DashBoardView,UICollectionViewDataSource,UICollectionViewDelegate,PinterestLayoutDelegate{
    
    
    func showMessage(message: String) {
        
    }
    
    func startLoading() {
        
    }
    
    func finishLoading() {
        
    }
    
    func setNoteItems(notes: [NoteItem]) {
        print("After update latest count",notes.count)
        self.notes.removeAll()
        self.notes = notes
        self.collectionView.reloadData()
    }
    
    func setEmptyNotes() {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return notes.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cellColor = UIColor.white
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! NotesCell
        cell.delegate = self
        cell.indexPath = indexPath
        if let color = notes[indexPath.row].color{
           cellColor = UIColor(hexString: color)
        }
        cell.backgroundColor = cellColor
        cell.configureData(note: notes[indexPath.row])
        return cell
    }
   
    
    
    func collectionView(collectionView: UICollectionView,
                        heightForImageAtIndexPath indexPath: IndexPath,
                        withWidth: CGFloat) -> CGFloat
    {
        return 0
    }
    
    
    func collectionView(collectionView: UICollectionView,
                        heightForAnnotationAtIndexPath indexPath: IndexPath,
                        withWidth: CGFloat) -> CGFloat {
        
        let note = notes[indexPath.row]
        var height:CGFloat = 24
//        if let image = note.image {
//            let scaledImage = Helper.shared.getScaledImage(image: image, width: withWidth)
//            height += scaledImage.size.height
//        }
        //New
        if note.imageUrl != nil {
            let imageSize = Helper.shared.getScaledImageSize(oldSize: CGSize(width:note.imageWidth!,height:note.imageHeight!), width: withWidth)
            height += imageSize.height
        }
        //End
        let text = Helper.shared.getAttributedString(mTitle: note.title, mSubtitle: note.subtitle)
        let textHeight = Helper.shared.getAttributedStringHeight(text: text, width: withWidth)
        if textHeight != 0 {
        height += textHeight
        }
        if let date = note.date {
            let font = UIFont.systemFont(ofSize: 12)
            let dateHeight = Helper.shared.getStringHeight(text: date, width: withWidth,font: font)
            height += dateHeight
        }
        return height
    
  }
   
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        //NEW
//        if collectionView.allowsMultipleSelection{
//            let cell = collectionView.cellForItem(at: indexPath)
//            cell?.isSelected = true
//            cell?.backgroundColor = UIColor.lightGray
//        }
//        //---------END
        
        if collectionView.allowsMultipleSelection {
        let cell = self.collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.lightGray
        //New
        cell?.isSelected = true
        selectedIndexPath.append(indexPath as IndexPath)
        } else {
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "NoteAdditionViewController") as!  NoteAdditionViewController
        newViewController.isUpdate = true
        newViewController.noteObject = notes[indexPath.item]
        self.navigationController?.pushViewController(newViewController, animated: true)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        //NEW
//        if collectionView.allowsMultipleSelection{
//            let cell = collectionView.cellForItem(at: indexPath)
//                cell?.isSelected = false
//                cell?.backgroundColor = UIColor.white
//
//        }
//        //---------END
        let cell = collectionView.cellForItem(at: indexPath)
        if let color = notes[indexPath.row].color{
        cell?.backgroundColor = UIColor(hexString: color)
        }
        if let index = selectedIndexPath.index(of:indexPath) {
            selectedIndexPath.remove(at: index)
        }
        if selectedIndexPath.count <= 0 {
            self.navigationItem.rightBarButtonItem = nil
            self.navigationItem.leftBarButtonItem = menuButton
            self.navigationItem.rightBarButtonItems = [viewTypeBtn,searchButton]
            self.collectionView.allowsMultipleSelection = false
        }
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
        if let navColor = self.selectedNavColor{
            self.navigationController?.navigationBar.barTintColor = UIColor(hexString: navColor)
        }
        self.textField.isHidden = true
        self.textField.text = ""
        dashBoardPresenter.attachView(view: self)
        dashBoardPresenter.getNotes(type:type)
        
    }
  }

