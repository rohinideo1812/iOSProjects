import Foundation
import UIKit

class LoginService {
    
    func checkUser(email:String,password:String,callback: (_ isavailable : Bool,_ message:String) -> Void){
        UserDataBase.sharedInstance.checkUser(email: email, password: password, callback: ({ isavailable,message  in
          
            callback(isavailable,message)

        }))
    }
}



