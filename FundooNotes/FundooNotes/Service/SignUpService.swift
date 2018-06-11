import Foundation
import FirebaseAuth

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
    
    
    func signUpWith(userObject : UserModel,callback: @escaping (_ isavailable : Bool,_ message:String) -> Void){
        
        let userInfo = convertUserToJSON(userItem: userObject)
        Auth.auth().createUser(withEmail: (userObject.email)!, password: (userObject.password)!, completion: { result,error in
            if error == nil {
                print(userInfo)
                Auth.auth().signIn(withEmail:(userObject.email)!,password:(userObject.password)! )
            }else{
                callback(false, error.debugDescription)
            }
        })
        
    }
    
    
    private func convertUserToJSON(userItem:UserModel) -> [String:String]{
        var userInfo:[String:String] = [:]
        do{
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(userItem)
            if let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: .mutableLeaves) as? [String:String]{
                userInfo = jsonObject
            }
        }catch let error as NSError {
            debugPrint(error.debugDescription)
        }
        return userInfo
    }
}
