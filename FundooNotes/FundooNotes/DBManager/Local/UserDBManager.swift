//
//  DatabaseManager.swift
//  FundooNotes
//
//  Created by BridgeLabz on 25/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class UserDataBase {
    static var sharedInstance = UserDataBase()
    public init(){
        
    }
    var userdata : UserModel?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var user : User?
    

    //MARK: Insert User Data
    func insertUserData(object : UserModel?) {
        let user = User(context: appDelegate.persistentContainer.viewContext)

        if let firstName = object?.firstName {
            user.firstName = firstName
        }
        if let lastName = object?.lastName {
            user.lastName = lastName
        }
        if let email = object?.email {
            user.email = email
        }
        if let password = object?.password {
            user.password = password
        }
        appDelegate.saveContext()

    }
    
    
    //MARK: Fetch User Data
    func fetchUserData(email : String?,callback: (_ isAvailable :Bool,_ object : UserModel?) -> Void){
    
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        request.predicate = NSPredicate(format: "email = %@", email!)
        request.returnsObjectsAsFaults = false
        do {
        let result1 = try appDelegate.persistentContainer.viewContext.fetch(request) as! [User]
            if result1.count == 1{
                let user1 = result1[0]
                //logic for store user
                print(user1.firstName)
            }
            let result = try appDelegate.persistentContainer.viewContext.fetch(request) as! [NSManagedObject]
            for obj in result{
                print(obj.value(forKey: "email") as! String)
            }
            if result.count > 0{
                let user = result[0]
                let firstName =  ((user as AnyObject).value(forKey: "firstName"))
                let lastName =  ((user as AnyObject).value(forKey: "lastName"))
                let password =  ((user as AnyObject).value(forKey: "password"))
                let email = ( (user as AnyObject).value(forKey: "email"))
                userdata = UserModel(firstName: firstName as! String, lastName: lastName as! String, email: email as! String, password: password as! String)
                callback(true,userdata)
                
            }else{
                callback(false,userdata)
            }
        
        }catch {
            print("Failed")
        }
}
  
}
