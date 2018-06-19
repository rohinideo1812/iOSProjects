import UIKit
import XLActionController


class ReminderViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    //Mark: IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    //Mark: Properties
    var titles = ["Date","Time","Repeat"]
    var subtitles : [String] = []
    var repeatTime = "Does not repeat"
    var selectedDate = ""
    var selectedTime = ""
    var remindDate = ""
    var selectedIndexPath:IndexPath!
    let noteAdditionViewController = NoteAdditionViewController()
    weak var delegate: ReminderSetDelegate? = nil

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReminderCell")
        cell?.textLabel?.text = titles[indexPath.row]
        cell?.detailTextLabel?.text = subtitles[indexPath.row]
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
        if indexPath.row == 0 {
        print("Date pressed")
            dateClick()
        }else if indexPath.row == 1 {
       print("Time Pressed")
            timeClick()
        }else if indexPath.row == 2 {
           print("Repeat Pressed")
            repeatClick()
        }
    }
    
    override func viewDidLoad() {
        super .viewDidLoad()
        configureNavigationBar()
        setDate(increament : 0)
    }
    
  
    func configureNavigationBar(){
        
        let cancelBarButton = UIBarButtonItem(image : UIImage(named: "ic_wrong"),landscapeImagePhone: nil, style: .done, target: self, action: #selector(cancelBarButtonPress))
        self.navigationItem.leftBarButtonItem = cancelBarButton
        let checkBarButton = UIBarButtonItem(image : UIImage(named: "ic_right"),landscapeImagePhone: nil, style: .done, target: self, action: #selector(checkBarButtonPress))
        self.navigationItem.rightBarButtonItem = checkBarButton
        navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.black

    }
    
    
    @objc func cancelBarButtonPress(){
    self.navigationController?.popViewController(animated: true)
    
    }
    
    @objc func checkBarButtonPress(){
        remindDate = selectedDate + "," + selectedTime + "," + repeatTime
        print(remindDate)
        delegate?.pressedCheckButton(info: remindDate)
        self.navigationController?.popViewController(animated: true)

    }
    
      func dateClick(){
        let actionController = YoutubeActionController()
    
        actionController.addAction(Action(ActionData(title: "Today"), style: .default, handler: { action in
            self.setDate(increament : 0)
        }))
        actionController.addAction(Action(ActionData(title: "Tommorow"), style: .default, handler: { action in
            self.setDate(increament : 1)
        }))
        actionController.addAction(Action(ActionData(title: "Next Sunday"), style: .default, handler: { action in
            self.setDate(increament : 7)
        }))
        actionController.addAction(Action(ActionData(title: "Select a date..."), style: .cancel, handler: { action in
            self.selectDate()
        }))
        
    present(actionController, animated: true, completion: nil)
        
    }
    
    
    func timeClick(){
        let actionController = YoutubeActionController()
        
        actionController.addAction(Action(ActionData(title: "Morning\t\t\t\t\t\t\t8:00 AM"), style: .default, handler: { action in
            self.setTime(choice: 1)
        }))
        actionController.addAction(Action(ActionData(title: "Afternoon\t\t\t\t\t\t\t1:00 PM"), style: .default, handler: { action in
            self.setTime(choice: 2)

        }))
        actionController.addAction(Action(ActionData(title: "Evening\t\t\t\t\t\t\t6:00 PM"), style: .default, handler: { action in
            self.setTime(choice: 3)

        }))
        actionController.addAction(Action(ActionData(title: "Night\t\t\t\t\t\t\t\t8:00 PM"), style: .cancel, handler: { action in
            self.setTime(choice: 4)

        }))
        
        actionController.addAction(Action(ActionData(title: "Select a time..."), style: .cancel, handler: { action in
            self.selectTime()
        }))
        present(actionController, animated: true, completion: nil)
    }
    
    
    func repeatClick(){
        let actionController = YoutubeActionController()
        
        actionController.addAction(Action(ActionData(title: "Does not repeat"), style: .default, handler: { action in
            self.setRepeat(choice: 1)
        }))
        actionController.addAction(Action(ActionData(title: "Daily"), style: .default, handler: { action in
            self.setRepeat(choice: 2)
        }))
        actionController.addAction(Action(ActionData(title: "Weekly"), style: .default, handler: { action in
            self.setRepeat(choice: 3)
        }))
        actionController.addAction(Action(ActionData(title: "Monthly"), style: .cancel, handler: {action in
            self.setRepeat(choice: 4)
        }))
        actionController.addAction(Action(ActionData(title: "Yearly"), style: .cancel, handler: {action in
            self.setRepeat(choice: 5)
            }))
        actionController.addAction(Action(ActionData(title: "Custom.."), style: .cancel, handler: {action in

        }))
        
        present(actionController, animated: true, completion: nil)
    }
    
    
    func selectDate(){
        Helper.shared.openDialogFor(mode: .date, title: "Select Date", format: "hh:mm a", callback: { result in
            self.selectedDate = result
            self.subtitles[self.selectedIndexPath.row] = self.selectedDate
            self.tableView.reloadRows(at: [self.selectedIndexPath], with: .automatic)
        })
    }

    func selectTime(){
  
        Helper.shared.openDialogFor(mode: .time, title: "Select Time", format: "hh:mm a", callback: { result in
            self.selectedTime = result
            self.subtitles[self.selectedIndexPath.row] = self.selectedTime
            self.tableView.reloadRows(at: [self.selectedIndexPath], with: .automatic)
        })
        
    }
    
    func setDate(increament : Int) {
    let date = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "hh:mm"
    formatter.timeStyle = .short
    let time = formatter.string(from: date)
    formatter.dateFormat = "yyyy-MM-dd"
        let currentDate = formatter.string(from: date)
        print("Current Date",currentDate)
        if increament > 0 {
    let next = Calendar.current.date(byAdding: .day, value: increament, to: date)
     selectedDate = formatter.string(from : next!)
            self.subtitles[self.selectedIndexPath.row] = self.selectedDate
            self.tableView.reloadRows(at: [self.selectedIndexPath], with: .automatic)
            
        }else {
            selectedDate = currentDate
            selectedTime = time

        }
        subtitles = ["\(selectedDate)","\(selectedTime)","\(repeatTime)"]
        self.tableView.reloadData()

    }
    
    func setTime(choice : Int){
        switch choice{

        case 1: selectedTime = "08:00 AM"
        case 2: selectedTime = "01:00 PM"
        case 3: selectedTime = "06:00 PM"
        case 4: selectedTime = "08:00 PM"
        default: break
        }

        self.subtitles[self.selectedIndexPath.row] = self.selectedTime
        self.tableView.reloadRows(at: [self.selectedIndexPath], with: .automatic)
        
    }
    
    func setRepeat(choice : Int){
        switch choice{
            
        case 1: repeatTime = "Does not repeat"
        case 2: repeatTime = "Daily"
        case 3: repeatTime = "Weekly"
        case 4: repeatTime = "Monthly"
        case 5: repeatTime = "Yearly"
            
        default: break
        }

        self.subtitles[self.selectedIndexPath.row] = self.repeatTime
        self.tableView.reloadRows(at: [self.selectedIndexPath], with: .automatic)
    }
    
   
    
}


