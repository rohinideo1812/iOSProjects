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
      
        self.tableView.register(UINib(nibName:"TableViewCell",bundle:nil), forCellReuseIdentifier: "TableViewCell")
        self.tableView.register(UINib(nibName:"TableViewCell1",bundle:nil), forCellReuseIdentifier: "TableViewCell1")
        self.tableView.register(UINib(nibName:"ItemCardCell",bundle:nil), forCellReuseIdentifier: "ItemCardCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if section == 0{
                return 1
            }else{
                return peoples.count
            }
        }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCardCell", for: indexPath) as! ItemCardCell
         let cell2 = tableView.dequeueReusableCell(withIdentifier: "TableViewCell1", for: indexPath) as! TableViewCell1
        
        if indexPath.section == 0{
            return cell2
        }else {
           
            cell.peoples.text = peoples[indexPath.row]
            cell.likes.text = time[indexPath.row]
            cell.level.text = level[indexPath.row]
            cell.imageView1.image = itemImg[indexPath.row]
            cell.name.text = itemName[indexPath.row]
            cell.type.text = itemType[indexPath.row]
            return cell
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 100
        }else{
            return 210
        }
    }
 
}
