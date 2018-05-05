/******************************************************************************
 *  Purpose: User List using MVP.
 *
 *  @author Rohini
 *  @version 4.0
 *  @since   15-04-2018
 *
 ******************************************************************************/
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private let userPresenter = UserPresenter(userService: UserService())
    private var usersToDisplay = [UserViewData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.dataSource = self as UITableViewDataSource
        activityIndicator.hidesWhenStopped = true
    
        userPresenter.attachView(view: self)
        userPresenter.getUsers()
    }
}
extension ViewController: UserView {

    func startLoading() {
        activityIndicator?.startAnimating()
    }

    func finishLoading() {
        activityIndicator?.stopAnimating()
    }

    func setUsers(users: [UserViewData]) {
        usersToDisplay = users
        tableView?.isHidden = false
        tableView.reloadData()
    }

    func setEmptyUsers() {
        tableView?.isHidden = true
    }
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "cell") as UITableViewCell
        let userViewData = usersToDisplay[indexPath.row]
        cell.textLabel?.text = userViewData.name
        cell.detailTextLabel?.text = userViewData.age
        cell.textLabel
        return cell
    }
}


