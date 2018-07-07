/*********************************************************************
 *  Purpose: Home VC.
 *
 *  @author Rohini
 *  @version 4.0
 *  @since   06-07-2018
 *
 *********************************************************************/
import UIKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var itemName = ["Pasta Salad","Pan Cakes","MineStrone Soup","Choclate Pudding","Alffredo Sauce","Sour Cream Meat Tacos"]
    var itemType = ["HEALTHY","BREAKFAST AND BRUNCH","SOUP","DESERT","PASTA","MAIN DISH"]
    var itemImg = [UIImage(named: "img_pastasalad"),UIImage(named: ""),UIImage(named: "img_pancake"),UIImage(named: "img_soup"),UIImage(named: "img_shake2"),UIImage(named: "img_sauce"),UIImage(named: "img_meat")]
    var time = ["25 minutes","14 minutes","2 minutes","10 minutes","15 minutes","5 minutes"]
    var level = ["Easy","Medium","Medium","Easy","Easy","Medium"]
    var peoples = ["5 people","15 people","51 people","6 people","5 people","45 people"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName:"TableViewCell",bundle:nil), forCellReuseIdentifier: "TableViewCell")
        self.tableView.register(UINib(nibName:"TableViewCell1",bundle:nil), forCellReuseIdentifier: "TableViewCell1")
    
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 1{
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.orders.text = peoples[indexPath.row]
        cell.time.text = time[indexPath.row]
        cell.level.text = level[indexPath.row]
        cell.imageview.image = itemImg[indexPath.row]
        cell.itemName.text = itemName[indexPath.row]
        cell.itemType.text = itemType[indexPath.row]
        cell.layoutIfNeeded()
        return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell1", for: indexPath) as! TableViewCell1
            cell.layoutIfNeeded()
            return cell
        }
    }
 
}
