//
//  AppUtil.swift
//  FundooNotes
//
//  Created by BridgeLabz on 26/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications


class AppUtil {
    
    static var shareInstance = AppUtil()
    private var currentUser:User?
    private var currentUserEmail:String?
    private init(){}
    private let userdefault = UserDefaults.standard
    
    
    func setUser(currentUser:User?){
        self.currentUser = currentUser
    }
    
    func getUser()-> User?{
        return self.currentUser
    }
    
    func setUserCredential(email:String?,password:String?){
        userdefault.set(email, forKey: Constants.CacheKeys.KEY_CURRENT_USER_EMAIL)
        userdefault.set(password, forKey: Constants.CacheKeys.KEY_CURRENT_USER_PASSWORD)
        
    }
    
    func getUserCredential() -> (email:String?,password:String?){
       let email = userdefault.string(forKey: Constants.CacheKeys.KEY_CURRENT_USER_EMAIL)
        let password = userdefault.string(forKey: Constants.CacheKeys.KEY_CURRENT_USER_PASSWORD)
        let credential = (email:email,password:password)
        return credential
    }
    
    func getMainVC()->MyNavigationController{
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let dashboardVC = storyBoard.instantiateViewController(withIdentifier: "DashBoardViewController") as!  DashBoardViewController
        let mymenuVC = MyMenuTableViewController()
        mymenuVC.delegate = dashboardVC
        let mynavVc = MyNavigationController(menuViewController: mymenuVC, contentViewController:dashboardVC)
        return mynavVc
    }
    
    func scheduleNotifications(notes:[NoteItem]) {
      UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
      UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        let content = UNMutableNotificationContent()
        content.badge = 1
        content.sound = UNNotificationSound.default()

        for noteObject in notes{
            let remindDate = noteObject.remindDate
            if let reminderDate = remindDate{
            let dateArray = reminderDate.components(separatedBy: ",")
                if dateArray[0] != "" && dateArray[1] != ""{
                    let stringDate = "\( dateArray[0]) \( dateArray[1])"
                    let repeatType = "\( dateArray[2])"
           let getDateComponent =  getDateComponents(repeatType:repeatType,stringDate:stringDate)
            
            let requestIdentifier = "\(noteObject.id)"
            content.title = "\(noteObject.title)"
            content.subtitle = "\(noteObject.subtitle)"
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: getDateComponent, repeats: true)
            
            let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)

                    UNUserNotificationCenter.current().add(request) { (error:Error?) in

            if error != nil {
                        }
        }
    }
            }
    }
    }
    
    
        func getDateComponents(repeatType:String,stringDate:String)->DateComponents{
            
            let date = stringDate.date(format: "yyyy-MM-dd hh:mm a")
            var dateComponent = DateComponents()
            
            switch repeatType {

                case Constants.repeatTypes.DOES_NOT_REPEAT:
                   dateComponent = Calendar.current.dateComponents([], from: date!)
                
                case Constants.repeatTypes.DAILY :
                      dateComponent =  Calendar.current.dateComponents([.hour,.minute], from: date!)
                
                case Constants.repeatTypes.WEEKLY:
                    dateComponent =  Calendar.current.dateComponents([.day,.hour,.minute], from: date!)
                
                case Constants.repeatTypes.MONTHLY:
                     dateComponent =  Calendar.current.dateComponents([.month,.day,.hour,.minute], from: date!)
                
                case Constants.repeatTypes.YEARLY:
                     dateComponent =  Calendar.current.dateComponents([.year,.month,.day,.hour,.minute], from: date!)
                
                default:
                    break
            }
                return dateComponent
        }
    }


extension String{
    func date(format:String) -> Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.date(from:self)
    }
}
