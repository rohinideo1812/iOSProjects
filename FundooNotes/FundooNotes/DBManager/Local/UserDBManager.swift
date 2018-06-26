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
    func insertUserData(object : UserModel?,callback:(_ result:Bool,_ message:String)->Void){
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
        callback(true,"SuccessFull Registration")
    }

    
    //MARK: Fetch User Data
    func checkUser(email:String,password:String,callback: (_ isAvailable :Bool,_ message : String) -> Void){
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        request.predicate = NSPredicate(format: "email = %@ && password = %@", email,password)
        request.returnsObjectsAsFaults = false
        do {
            
        let result1 = try appDelegate.persistentContainer.viewContext.fetch(request) as! [User]
            
            if result1.count == 1{
                let currentUser = result1[0]
                
            AppUtil.shareInstance.setUserCredential(email:currentUser.email, password:currentUser.password )
            AppUtil.shareInstance.setUser(currentUser: currentUser)
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
                userdata = UserModel(firstName: firstName as! String, lastName: lastName as! String, email: email as! String, password: password as! String,imageUrl:"")
                callback(true,"Successfull Login")
                
            }else{
                callback(false,"User with this id does not exists.Please register to login!!!")
            }
        
        }catch {
            print("Failed")
        }
  }
    
    
    //Mark: Remove DB
    func removeUsersFromDB(){
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            let result = try context.fetch(fetchRequest) as! [User]
            for user in result{
                context.delete(user)
                
            }
            try context.save()
            //try context.execute(fetchRequest)
            //try context.save()
        } catch {
            print ("There was an error")
        }
    }
  
}
