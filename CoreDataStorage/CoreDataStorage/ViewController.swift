//
//  ViewController.swift
//  CoreDataStorage
//
//  Created by BridgeLabz on 04/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {
    var user1 = User()
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let user = User(context: context)
//        user.firstName = "Rohini"
//        user.lastName = "Patil"
//        appDelegate.saveContext()
        var request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        request.predicate = NSPredicate(format: "firstName = %@", "Rohini")
        request.returnsObjectsAsFaults = false
        do {
            let result = try appDelegate.persistentContainer.viewContext.fetch(request) as! [NSManagedObject]
            var u =  result[0]
           
                print(u.value(forKey: "firstName"))
            
            
            
            
        }catch {
            
            print("Failed")
        }
        
    }
}

