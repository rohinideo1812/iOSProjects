import Foundation
import FirebaseAuth

class SignUpService {
    
    //Mark:SignUp on Local DB
    func signUp(userObject : UserModel?,callback: @escaping (_ result :Bool,_ message : String) -> Void){
        
        UserDataBase.sharedInstance.checkUser(email:(userObject?.email)!,password: (userObject?.password)!, callback: { isavailable,displayMessage   in
            if isavailable == false{
        UserDataBase.sharedInstance.insertUserData(object:userObject,callback: { result,message in
            callback(result,message)
        })
            }else{
                callback(false,"User already exists")
            }
        })
        
    }
    
    
    //Mark:SignUp on Firebase
    func signUpWith(userObject : UserModel,callback: @escaping (_ isavailable : Bool,_ message:String) -> Void){
        let userInfo =
        Auth.auth().createUser(withEmail: (userObject.email)!, password: (userObject.password)!, completion: { result,error in
            if error == nil {
//
                Auth.auth().signIn(withEmail: (userObject.email)!, password: (userObject.password)!, completion: { result1,error in
                    DataManager.shared.storeUserData(object: userObject, callback: {isSuccessfull,message in
                    })
                })
                callback(true,"Registration Successfull")
            }else{
                callback(false, error.debugDescription)
            }
        })
        
    }
    
}
