/**********************************************************************
 *  Purpose: Favourites VC.
 *
 *  @author Rohini
 *  @version 4.0
 *  @since   10-07-2018
 *
 *********************************************************************/

import UIKit

class FavouritesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    //Mark:Properties
    @IBOutlet weak var tableView: UITableView!
    let text = ["fghklgfglnlghknlkghghlkhgklhfghfgh",";fghlkfghlfghlfghfgnhfinhfglnhfghfgh","fkhfglkhfglhfglknhfglknhgflnhflknhfgknhfglknhfglkhn","nfgfgnjhnfgjkhnfgjkhnfgjkhnfgjkhn","gklhjgflhgflkhjfglkhfglkhnfkglhnfkglhnfghfghfghfg",";lfhlfghlkgfhlhgflkhnfglhngflhnlfgknhlfgnhlkfgnhlkfgnhlkfgnhfglnh","fhkfgnlkhnfgkhnfkgjhnfgkhnfgkjhngfkjhnfkgjhnfkgjhnfgkjhnkfjghnkfjgnhkfjgnhkfgnhkjfgnhkfjgnhkfgjhkfgjnhkjnfhkjfgnh","","gflkngfknhfgkjhnkjfgnhkjfgnhkjfgn","lfkgnhlfgknhlfgknhlfgknhlkfgnhfg,bngfnfgklngflknfgklnhklfgnhlfgkhn"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName:"ItemCardCell",bundle:nil), forCellReuseIdentifier: "ItemCardCell")
  self.tableView.register(UINib(nibName:"FavoritesTableViewCell",bundle:nil), forCellReuseIdentifier: "FavoritesTableViewCell")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
        return 1
        }else{
            return text.count
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "ItemCardCell", for: indexPath) as! ItemCardCell
         let cell2 = tableView.dequeueReusableCell(withIdentifier: "FavoritesTableViewCell", for: indexPath) as! FavoritesTableViewCell

        if indexPath.section == 0{
            cell1.imageView1.image = UIImage(named: "img_pastasalad")
            cell1.level.text = "Easy"
            cell1.likes.text = "25 minutes"
            cell1.peoples.text = "5 people"
            cell1.type.text = "HEALTHY"
            cell1.name.text = "Pasta Salad"
            cell1.name.textAlignment = .center
            cell1.type.textAlignment = .center
            return cell1
            
        }else if indexPath.section == 1{
            cell2.label.text = text[indexPath.row]
            cell2.imgView.image = UIImage(named:"baseline_dns_black_18dp")
            return cell2
    }else{
            cell2.label.text = text[indexPath.row]
            cell2.imgView.image = UIImage(named:"baseline_home_black_18dp")
            return cell2
        }
     }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return nil
        }else if section == 1{
            return "Rohini"
        }else{
            return "Deo"
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0
        }else {
            return 50
        }
    }
}

