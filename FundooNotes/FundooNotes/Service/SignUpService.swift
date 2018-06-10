import Foundation

class SignUpService {
    
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
}
