

import UIKit

class SecondViewController: UIViewController,UITableViewDataSource, UITableViewDelegate   {
    let cellIdentifier = "CellIdentifier"
    var fruits: [String] = []
    @IBOutlet weak var tableView: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

       return fruits.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as UITableViewCell

        // Fetch Fruit
        let fruit = fruits[indexPath.row]

        // Configure Cell
        cell.textLabel?.text = fruit

        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
fruits = ["Apple", "Pineapple", "Orange", "Blackberry", "Banana", "Pear", "Kiwi", "Strawberry", "Mango", "Walnut", "Apricot", "Almond", "Date", "Melon", "Water Melon", "Lemon", "Coconut", "Fig", "Passionfruit", "Star Fruit", "Clementin", "Citron", "Cherry", "Cranberry"]
        tableView.reloadData()

  }

    
    

   

}
