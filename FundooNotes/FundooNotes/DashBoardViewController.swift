//
//  DashBoardViewController.swift
//  FundooNotes
//
//  Created by BridgeLabz on 22/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class DashBoardViewController: UIViewController,ENSideMenuDelegate {
 
    @IBOutlet weak var dashboardBottomView: DashBoardBottomView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let dashBoardPresenter = DashBoardPresenter(dashBoardService:DashBoardService())
    var notes = [NoteItem]()
    var noOfColumns = 2
    let reuseIdentifier = "NotesCell"
    var viewTypeBtn:UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.sideMenuController()?.sideMenu?.delegate = self
       configureNavigationBar()
        dashBoardPresenter.attachView(view: self)
        dashBoardPresenter.getNotes()
        dashboardBottomView.addNoteBtn.addTarget(self, action: #selector(takeNoteButtonPress), for: .touchUpInside)
            
            if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
            layout.numberOfColumns = 2
            layout.cellPadding = 8
        }
        let nib = UINib(nibName: reuseIdentifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier )
        
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
    
    
    func configureNavigationBar(){
        viewTypeBtn = UIBarButtonItem(image: UIImage(named: "ic_view_stream"), style: .plain, target: self, action: #selector(changeViewType))
        self.navigationItem.rightBarButtonItem = viewTypeBtn
        
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.black.cgColor
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width:2.0,height: 2.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 4.0
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.5
        let menuButton = UIBarButtonItem(image: UIImage(named: "ic_view_headline"), style: .plain, target: self, action: #selector(menuButtonPress))
        self.navigationItem.leftBarButtonItem = menuButton
    }
    
    
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
    
     @objc func menuButtonPress(){
        toggleSideMenuView()

    }
}

extension DashBoardViewController:DashBoardView,UICollectionViewDataSource,UICollectionViewDelegate,PinterestLayoutDelegate{
    func startLoading() {
        
    }
    
    func finishLoading() {
        
    }
    
    func setNoteItems(notes: [NoteItem]) {
        self.notes = notes
        self.collectionView.reloadData()
    }
    
    
    func setEmptyNotes() {
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return notes.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! NotesCell
        cell.configureData(note: notes[indexPath.row])

        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView,
                        heightForImageAtIndexPath indexPath: IndexPath,
                        withWidth: CGFloat) -> CGFloat
    {
        return 0//(notes[indexPath.row].image?.size.height)!
    }
    
    
    func collectionView(collectionView: UICollectionView,
                        heightForAnnotationAtIndexPath indexPath: IndexPath,
                        withWidth: CGFloat) -> CGFloat
    {
        var height:CGFloat = 24
        let note = notes[indexPath.row]
        if let image = note.image {
            let scaledImage = Helper.shared.getScaledImage(image: image, width: withWidth)
            height += scaledImage.size.height
        }
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
    
   @objc func takeNoteButtonPress(){
    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let newViewController = storyBoard.instantiateViewController(withIdentifier: "NoteAdditionViewController") as!  NoteAdditionViewController
    self.navigationController?.pushViewController(newViewController, animated: true)

    }
    
    
}


