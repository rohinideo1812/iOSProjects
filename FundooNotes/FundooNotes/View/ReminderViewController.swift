//
//  ReminderViewController.swift
//  FundooNotes
//
//  Created by BridgeLabz on 20/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit
import XLActionController
import DatePickerDialog


class ReminderViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    //Mark: IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    //Mark: Properties
    var titles = ["Date","Time","Repeat"]
    var subtitles : [String] = []
    var time = ""
    var repeatTime = ""
    var selectedDate = ""
    var selectedTime = ""
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReminderCell") as! UITableViewCell
        cell.textLabel?.text = titles[indexPath.row]
        cell.detailTextLabel?.text = subtitles[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "NoteAdditionViewController") as! NoteAdditionViewController
    self.navigationController?.pushViewController(newViewController, animated: true)
        
    }
    
    
    @objc func checkBarButtonPress(){
        
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
    let currentDate = Date()
    var dateComponents = DateComponents()
    dateComponents.month = -3
    let threeMonthAgo = Calendar.current.date(byAdding: dateComponents, to: currentDate)

    let datePicker = DatePickerDialog(textColor: .red,
                                      buttonColor: .red,
                                      font: UIFont.boldSystemFont(ofSize: 17),
                                      showCancelButton: true)
    datePicker.show("DatePickerDialog",
    doneButtonTitle: "Done",
    cancelButtonTitle: "Cancel",
    minimumDate: threeMonthAgo,
    maximumDate: currentDate,
    datePickerMode: .date) { (date) in
    if let dt = date {
    let formatter = DateFormatter()
    formatter.dateFormat = "MM/dd/yyyy"
        self.selectedDate =  formatter.string(from: dt)
    }
    }
}

    
    func selectTime(){
        let currentTime = Date()
        var timeComponents = DateComponents()
        timeComponents.month = -3
        let threeMonthAgo = Calendar.current.date(byAdding: timeComponents, to: currentTime)

        let datePicker = DatePickerDialog(textColor: .red,
                                          buttonColor: .red,
                                          font: UIFont.boldSystemFont(ofSize: 17),
                                          showCancelButton: true)
        datePicker.show("DatePickerDialog",
                        doneButtonTitle: "Done",
                        cancelButtonTitle: "Cancel",
                        minimumDate: threeMonthAgo,
                        maximumDate: currentTime,
                        datePickerMode: .time) { (time) in
                            if let tme = time {
                                let formatter = DateFormatter()
                                formatter.dateFormat = "MM/dd/yyyy"
                                 self.selectedTime =  formatter.string(from: tme)

                            }
        }
    }
    
    
    func setDate(increament : Int) {
    let date = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "hh:mm"
    formatter.timeStyle = .short
    let time = formatter.string(from: date)
    formatter.dateFormat = "yyyy-MM-dd"
    let todaysDate = formatter.string(from: date)
        print(todaysDate)
        if increament > 0 {
    let next = Calendar.current.date(byAdding: .day, value: increament, to: date)
    let nextDate = formatter.string(from : next!)
    print(nextDate)
    subtitles = ["\(nextDate)","\(time)","Does not repeat"]
        }else {
            subtitles = ["\(todaysDate)","\(time)","Does not repeat"]
        }
    }
    
    func setTime(choice : Int){
        switch choice{

        case 1: time = "8:00 AM"
        case 2: time = "1:00 PM"
        case 3: time = "6:00 PM"
        case 4: time = "8:00 PM"
        default: break
        }
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
    }
}









