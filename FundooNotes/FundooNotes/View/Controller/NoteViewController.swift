//
//  NoteViewController.swift
//  FundooNotes
//
//  Created by BridgeLabz on 05/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit
import Foundation


class NoteViewController: UIViewController,ENSideMenuDelegate{
    
    
    //Mark: Properties
    var name = ""
    var email = ""
    
    
    //Mark: IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
 
    //Mark: Action on takeNoteButtonPress
    @IBAction func takeNoteButtonPress(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "NoteAdditionViewController") as! NoteAdditionViewController
        self.navigationController?.pushViewController(newViewController, animated: true)

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
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let myMenuTableViewController = MyMenuTableViewController()
        myMenuTableViewController.email = email
        myMenuTableViewController.name = name
        self.sideMenuController()?.sideMenu?.delegate = self
        configureNavigationBar()
    
    }
    
    //Mark: Navigation Bar Buttons
    func configureNavigationBar()
    {
        let navigationButton = UIBarButtonItem(image : UIImage(named: "navigation"),landscapeImagePhone: nil, style: .done, target: self, action: #selector(navigatioBarButtonPress))
        self.navigationItem.leftBarButtonItem = navigationButton
        let listViewBarButton = UIBarButtonItem(image: UIImage(named: "ic_view_stream"), landscapeImagePhone: nil, style: .done, target: self, action: #selector(listViewBarButtonPress))
        let searchBarButton = UIBarButtonItem(image: UIImage(named: "ic_search"), landscapeImagePhone: nil, style: .done, target: self, action: #selector(searchBarButtonPress))
        self.navigationItem.rightBarButtonItems = [listViewBarButton,searchBarButton]
    }
    
    //Mark: Action on listViewBarButtonPress
    @objc func listViewBarButtonPress(){
        print("Tapped")
    }
    
    
    //Mark: Action on searchBarButtonPress
    @objc func searchBarButtonPress(){
        print("Tapped")
    }
    
    
    //Mark: Action on navigatioBarButtonPress
    @objc func navigatioBarButtonPress(){
        print("navigationTapped")
        toggleSideMenuView()

    }
    
}

