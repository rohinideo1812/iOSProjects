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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName:"TableViewCell",bundle:nil), forCellReuseIdentifier: "TableViewCell")
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemImg.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        return cell
    }
}
