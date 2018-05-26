//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by BridgeLabz on 23/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit
import CoreData
import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let user = User(context: context)
        let note = Note(context : context)
        var object : User?
        user.firstName = "Shahebz"
        user.lastName = "Shaikh"
        user.mobile = "456456676875645"
        user.email = "shahebaz@gmail.com"
        user.password = "12344567"
        appDelegate.saveContext()

        note.id = "10"
        note.color = "orange"
        note.createDate = "2/2/2018"
        note.imageUrl = "dfvd"
        note.isArchive = true
        note.isPin = true
        note.modifiedDate = "3/3/2018"
        note.remindDate = "5/3/2018"
        note.user = user
        appDelegate.saveContext()


        var request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        request.predicate = NSPredicate(format: "id = %@", "10")

        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "firstName") as! String)
                print(data.value(forKey: "lastName") as! String)
                print(data.value(forKey: "email") as! String)
//                context.delete(data)
//                context.delete(data)
                
            }
//            object = User()
//            object = result as! User
        }catch {
            
            print("Failed")
        }

        request = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
        
//        request.predicate = NSPredicate(format: "id = %@", "4")
//        request.predicate = NSPredicate(format: "id = %@", "2")

        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "id") as! String)
                print(data.value(forKey: "color") as! String)
                print(data.value(forKey: "createDate") as! String)
//                print(data.value(forKey: "user") as! String)

//                context.delete(data)
            }
        }catch {
            
            print("Failed")
        }

}
}
