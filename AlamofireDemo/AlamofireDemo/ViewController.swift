import UIKit
import Alamofire

typealias JSONObject = [String:Any]
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var persons = [[String: Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        print("Enter the name")
        print("Enter the last name")
        print("Enter the city")
        print("Enter the mobile number")
    let url = URL(string: "http://192.168.0.23:8181/fundooNotes/v1/getPersons")
        Alamofire.request(url!).responseJSON(completionHandler: {response in
            
            if let result = response.result.value as! [String:Any]? {
                if let personsData = result["persons"] as! [[String:Any]]?{
                    self.persons = personsData
                    self.tableView.reloadData()
                }
             }else{
                print(response.result)
            }
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        print(self.persons)
        
        if self.persons.count > 0{
            let eachPerson = self.persons[indexPath.row]
            cell.firstName.text = (eachPerson["firstName"] as? String) ?? ""
            cell.secondName.text = (eachPerson["lastName"] as? String) ?? ""
            cell.mobileNo.text = (eachPerson["mobileNumber"] as? String) ?? ""
            cell.city.text = (eachPerson["city"] as? String) ?? ""
            
        }
        
        return cell

      }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let deletedPerson = self.persons.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            self.tableView.reloadData()
            guard let mobileNumber = deletedPerson["mobileNumber"] as? String else{
                print("Failed to get mobile number from dict")
                return
            }
            Alamofire.request("http://192.168.0.23:8181/fundooNotes/v1/deleteUser",method: .post,parameters: ["mobileNumber":mobileNumber], headers: [:])
                .responseJSON(completionHandler: { response in
                
                    print(
                    response.result.description)
                    
            })
        }
    }
    }
