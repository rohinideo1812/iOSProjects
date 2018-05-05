//
//  UserService.swift
//  MVPUsingJson
//
//  Created by BridgeLabz on 18/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import Foundation
struct User : Codable {
    let name : String
    let age : Int
}
class UserService {
    var mUserList:[User]?
    let mPath = "/Users/bridgelabz/Documents/iOS/MVPUsingJson/MVPUsingJson/UserData.json"
    func getUser(callback : ([User])->Void){
        if  let file : FileHandle = FileHandle(forReadingAtPath: mPath){
            if  let usersJson = try? JSONSerialization.jsonObject(with: file.availableData, options: .mutableLeaves) as! [Dictionary<String,Any>]{
            mUserList = [User]()
            for userObj in usersJson{
                let data =  try? JSONSerialization.data(withJSONObject: userObj, options: .prettyPrinted)
                let decoder = JSONDecoder()
                guard let user = try? decoder.decode(User.self, from: data!) else{
                    return
                }
                print("Data has been sent")
                  mUserList?.append(user)
                }
                callback(mUserList!)
            }
            defer {
                print("Defer is called")
         file.closeFile()
                mUserList = nil
            }
    }

    }
    
}
