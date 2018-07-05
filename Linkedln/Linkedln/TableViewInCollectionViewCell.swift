import UIKit

protocol TableViewCellDelegate: class {
    func didEnteredText(indexPath:IndexPath)
}

class TableViewInCollectionViewCell: UICollectionViewCell,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    weak var delegate:TableViewCellDelegate? = nil

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        self.tableView.estimatedRowHeight = 56
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.backgroundColor = UIColor.clear
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.cornerRadius = 2
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize.zero
        
    }
    
    func reloadView(indexPath:IndexPath){
        
        if let del = self.delegate {
            del.didEnteredText(indexPath: indexPath)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }else{
            return 3
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0{
            return "Experience"
        }else{
            return "Education"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        if indexPath.section == 0{
            cell.icon.backgroundColor = UIColor.red
            cell.label.text = "dfhdbfjhgfdjfbdgjdfjgdfjgbjhdfgbjdhgjdfhgbhjdfbgjhdfgjdhfgjdhfbgdjhfbgdjhfbgjdfhbgjhdfbgjhdfbgdfg"
            
        }else{
            if indexPath.row == 0{
                
                cell.icon.backgroundColor = UIColor.yellow
                cell.label.text = "fgdfgfdgdfgdfgfd"
                
            }else if indexPath.row == 1{
                
                cell.icon.backgroundColor = UIColor.green
                cell.label.text = "dsfdgdfbgdfjgbkdfjgkjdfgdfkjbgdfkjbgdfjkgbdfjkgbdfjkdfgdfgdfg"
                
            }else{
                
                cell.icon.backgroundColor = UIColor.blue
                cell.label.text = "fdjkdjfbgjdhfbgjhfdgjhdfbgjhfdbgjhdfbgjdfhbgdjfhbgdfjhbgfdjgbdfjhbgdfjhbgdfjhbgdfjhbgdhfbgdfhjbgdfhjbgdjfhbgdhjfbgdjfhbgjdfhbgjdhfbgjhdfbghjdfbghdjfbgdhjfbgdhjfbgjfhdgbhjdfbghjdfgbhjdghdbghdjfbgjhdfbghdfjbghjdfbghdjfhjdfgdhfjgbdhjfgbhjdfbghjdfhdbg"
                
            }
            
            
        }
        
        
        return cell
    }

}
