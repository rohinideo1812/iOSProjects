import Foundation
import UIKit
import Firebase
import FirebaseAuth

class LoginService {
    
    func checkUser(email:String,password:String,callback: (_ isavailable : Bool,_ message:String) -> Void){
        UserDataBase.sharedInstance.checkUser(email: email, password: password, callback: ({ isavailable,message  in
          
            callback(isavailable,message)

        }))
    }
    
    func loginWith(email:String,password:String,callback: @escaping (_ isavailable : Bool,_ message:String) -> Void){
        //1 Check Network
        if (AppUtil.shareInstance.isConnectedToNetwork()){
            //2 Create Account
            Auth.auth().signIn(withEmail: email, password: password, completion: { result,error in
                if error == nil{
                    callback(true,"Successfull Logined")
                }else{
                    callback(true,error.debugDescription)
                }
            })
        }else{
            callback(false,Constants.Message.MSG_INTERNET_NOT_AVAILABLE)
        }
    }
    
    
}

