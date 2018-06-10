//
//  ViewController.swift
//  LocalNotification
//
//  Created by BridgeLabz on 02/06/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scheduleNotifications()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func scheduleNotifications() {
        
        let content = UNMutableNotificationContent()
        let requestIdentifier = "rajanNotification"
        content.badge = 1
        content.title = "This is a rich notification"
        content.subtitle = "Hello there, I am Rajan Maheshwari"
        content.body = "Hello body"
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { (error:Error?) in
            
            if error != nil {
                print(error?.localizedDescription)
            }
        }
    }
}

