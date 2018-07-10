/**********************************************************************
 *  Purpose: Categories VC.
 *
 *  @author Rohini
 *  @version 4.0
 *  @since   10-07-2018
 *
 *********************************************************************/
import UIKit

class CategoriesViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    //Mark:Properties
    @IBOutlet weak var tableView: UITableView!
    var itemName = ["Pasta Salad","Pan Cakes","MineStrone Soup","Choclate Pudding","Alffredo Sauce","Sour Cream Meat Tacos"]
    var itemType = ["HEALTHY","BREAKFAST AND BRUNCH","SOUP","DESERT","PASTA","MAIN DISH"]
    var itemImg = [UIImage(named: "img_pastasalad"),UIImage(named: "img_pancake"),UIImage(named: "img_meat"),UIImage(named: "img_soup"),UIImage(named: "img_shake2"),UIImage(named: "img_sauce")]
    var time = ["25 minutes","14 minutes","2 minutes","10 minutes","15 minutes","5 minutes"]
    var level = ["Easy","Medium","Medium","Easy","Easy","Medium"]
    var peoples = ["5 people","15 people","51 people","6 people","5 people","45 people"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName:"ItemCardCell",bundle:nil), forCellReuseIdentifier: "ItemCardCell")
        self.tableView.estimatedRowHeight = 400
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.reloadData()

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemType.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCardCell", for: indexPath) as! ItemCardCell
        cell.peoples.text = peoples[indexPath.row]
        cell.likes.text = time[indexPath.row]
        cell.level.text = level[indexPath.row]
        cell.imageView1.image = itemImg[indexPath.row]
        cell.name.text = itemName[indexPath.row]
        cell.type.text = itemType[indexPath.row]
        return cell
        
    }
   
}
