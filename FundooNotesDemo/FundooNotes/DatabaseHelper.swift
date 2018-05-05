//
//  Database.swift
//  FundooNotes
//
//  Created by BridgeLabz on 21/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//


import Foundation
import CoreData
import UIKit

class DatabaseHelper{
    
    static var shareInstance = DatabaseHelper()
    var appDelegate:AppDelegate?
    
    
    func save(object : [String : String]){
        appDelegate = (UIApplication.shared.delegate as? AppDelegate)
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: (appDelegate?.persistentContainer.viewContext)!) as! User
        user.firstName = object["firstName"]
        user.lastName = object["lastName"]
        user.email = object["email"]
        user.mobile = object["mobile"]
        user.password = object["password"]
        do{
            try appDelegate?.persistentContainer.viewContext.save()
        }catch{
            print("Data is not saved")
        }
    }
//    func getData()->[User]{
//        var user = [User]()
//        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName : "User")
//        do{
//           user =  try context?.fetch(fetchRequest) as! [User]
//        }catch{
//            print("Cannot get Data")
//        }
//
//        return user
//    }
}
