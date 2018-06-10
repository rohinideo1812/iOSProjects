import UIKit

class MyMenuTableViewController: UITableViewController {
    
    //Properties
    var selectedMenuItem : Int = 0
    let logoarray = ["Notes","Reminders","Create new label","Archive","Deleted","Settings","Help & feedback"]
    let imagearray = ["ic_lightbulb_outline","ic_touch_app","ic_add","ic_archive","ic_delete","ic_settings","ic_help"]
    var name = ""
    var email = ""
    var delegate:MenuDelegate?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset = UIEdgeInsetsMake(64.0, 0, 0, 0)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.white
        tableView.scrollsToTop = false
        self.clearsSelectionOnViewWillAppear = false
        let profileViewController = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
        profileViewController.email = email
        profileViewController.name = name
        tableView.tableHeaderView = profileViewController.view
        tableView.selectRow(at: IndexPath(row: selectedMenuItem, section: 0), animated: false, scrollPosition: .middle)
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
        return logoarray.count
        }else{
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CELL")
        
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "CELL")
            cell!.backgroundColor = UIColor.clear
            cell!.textLabel?.textColor = UIColor.darkGray
            let selectedBackgroundView = UIView(frame: CGRect(x: 0, y: 0, width: cell!.frame.size.width, height: cell!.frame.size.height))
            selectedBackgroundView.backgroundColor = UIColor.gray.withAlphaComponent(0.2)
            cell!.selectedBackgroundView = selectedBackgroundView
        }
        if indexPath.section == 0{

        let logodata = logoarray[indexPath.row]
        let imagedata = imagearray[indexPath.row]
        cell!.textLabel?.text = logodata
        cell!.imageView?.image  = UIImage(named : imagedata)
        return cell!
        }else {
            cell?.imageView?.image = UIImage(named : "ic_signout")
            cell?.textLabel?.text = "SignOut"
            return cell!
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("did select row: \(indexPath.row)")
        
        selectedMenuItem = indexPath.row
        
        if (indexPath.section == 0){
            switch (indexPath.row) {
                case 0:
                    delegate?.sideMenuDidSelected(noteType: .notes)
                    break
                case 1:
                    delegate?.sideMenuDidSelected(noteType: .reminders)
                    break
                case 3:
                    delegate?.sideMenuDidSelected(noteType: .archive)
                    break
                case 4:
                    delegate?.sideMenuDidSelected(noteType: .delete)
                    break
                default:
                break
            }
            sideMenuController()?.sideMenu?.toggleMenu()
        }else if indexPath.section == 1{
                switch(indexPath.row){
                case 0 :
                    let alert = UIAlertController(title: "Alert Message", message: "Do you want to sign out", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
                    self.present(alert, animated: true)
                    alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
                        AppUtil.shareInstance.setUserCredential(email: nil,password: nil)
                        AppUtil.shareInstance.setUser(currentUser: nil)
                        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let newViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as!  LoginViewController
                        self.present(newViewController, animated: true, completion: nil)
                    }))
                    
                default:
                    break

            
        }            }

}
}
