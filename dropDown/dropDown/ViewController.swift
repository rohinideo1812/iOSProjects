import UIKit

struct State {
    var isExpanded : Bool
    var cities :  [String]
    var stateName : String
    var selectedCity : String
}

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var states = [
        State(isExpanded: false, cities: ["Aurangabad","Jalna","Mumbai","Pune"], stateName: "Maharashatra", selectedCity: ""),
                  State(isExpanded: false, cities: ["Bhopal","Indore"], stateName: "M.P", selectedCity: ""),
                  State(isExpanded: false, cities: ["Surat","Ahemdabad"], stateName: "Gujrat", selectedCity: "")
                 ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return states.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return states[section].cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = states[indexPath.section].cities[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        states[indexPath.section].selectedCity = states[indexPath.section].cities[indexPath.row]
        let selectedSection = indexPath.section
        states[selectedSection].isExpanded = !states[selectedSection].isExpanded
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if states[indexPath.section].isExpanded {
            return 50
        }
         return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerLabel = UILabel()
        headerLabel.frame = CGRect(x: 0, y: 1, width: self.view.frame.width, height: 50)
        headerLabel.numberOfLines = 0
        if states[section].selectedCity == "" {
            headerLabel.text = states[section].stateName + "\n Select city --"
        } else {
            headerLabel.text = states[section].stateName + "\nSelected city - \(states[section].selectedCity)"
        }
        
        headerLabel.textAlignment = .center
        headerLabel.textColor = .purple
        headerLabel.backgroundColor = .gray
        let viewForHeader = UIView()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        viewForHeader.addGestureRecognizer(tap)
        viewForHeader.addSubview(headerLabel)
        viewForHeader.tag = section
        return viewForHeader
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 50
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
            return 2
        }
    
    // function which is triggered when handleTap is called
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        if let selectedSection = sender.view?.tag {
            states[selectedSection].isExpanded = !states[selectedSection].isExpanded
            tableView.beginUpdates()
            for i in 0 ..< states[selectedSection].cities.count {
                tableView.reloadRows(at: [IndexPath(row: i, section: selectedSection)], with: .automatic)
            }
            tableView.endUpdates()
        }
    }
   
}

