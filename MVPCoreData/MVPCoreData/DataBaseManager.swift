//
//  DataBaseManager.swift
//  MVPCoreData
//
//  Created by BridgeLabz on 07/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import Foundation
import CoreData
import UIKit

struct UserData{
    var firstName  : String?
    var lastName : String?
}
class DatabaseManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    var user : User?
    static var sharedInstance = DatabaseManager()

    func insertUserData(object : UserData?) {
        let user = User(context: appDelegate.persistentContainer.viewContext)
        
        if let firstName = object?.firstName {
            user.firstName = firstName
        }
        if let lastName = object?.lastName {
            user.lastName = lastName
        }
        appDelegate.saveContext()
        
    }
    
    func fetchUserData(name : String?,callback: (_ isAvailable :Bool,_ object : UserData?) -> Void) {
        var userdata = UserData()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        request.predicate = NSPredicate(format: "firstName = %@", name!)
        request.returnsObjectsAsFaults = false
        do {
            let result = try appDelegate.persistentContainer.viewContext.fetch(request) as! [NSManagedObject]
            for obj in result{
                print(obj.value(forKey: "firstName") as! String)
            }
            if result.count > 0{
                let user = result[0]
                let firstName =  ((user as AnyObject).value(forKey: "firstName"))
                let lastName =  ((user as AnyObject).value(forKey: "lastName"))
                userdata = UserData(firstName: firstName as! String, lastName: lastName as! String)
      callback(true,userdata)

            }else{
                callback(false,userdata)
            }

        }catch {

            print("Failed")
        }

    }
}
