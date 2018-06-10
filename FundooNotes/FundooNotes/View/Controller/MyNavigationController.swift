import UIKit

class MyNavigationController: ENSideMenuNavigationController {
    
    //Mark : Properties
    var name = ""
    var email = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myMenuTableViewController = MyMenuTableViewController()
        myMenuTableViewController.email = email
        myMenuTableViewController.name = name
        
        sideMenu = ENSideMenu(sourceView: self.view, menuViewController:myMenuTableViewController, menuPosition:.left)
        
        sideMenu?.menuWidth = 150
        sideMenu?.bouncingEnabled = false
        view.bringSubview(toFront: navigationBar)
    }
}


extension MyNavigationController: ENSideMenuDelegate {
    func sideMenuDidSelected(type: NoteType) {
        
        
    }
    
    func sideMenuWillOpen() {
        print("sideMenuWillOpen")
    }
    
    func sideMenuWillClose() {
        print("sideMenuWillClose")
    }
    
    func sideMenuDidClose() {
        print("sideMenuDidClose")
    }
    
    func sideMenuDidOpen() {
        print("sideMenuDidOpen")
    }
    
    func sideMenuShouldOpenSideMenu() -> Bool {
        return true
    }
    
}
