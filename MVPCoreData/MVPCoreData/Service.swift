//
//  Service.swift
//  MVPCoreData
//
//  Created by BridgeLabz on 07/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import Foundation

class Service{
    var userdata = UserData()
    func getUsers(name : String?,callBack:(_ isAvailable : Bool?,_ object :  UserData?) -> Void){
        DatabaseManager.sharedInstance.fetchUserData(name:name,callback:{ isAvailable,object in
            callBack(isAvailable,object)
            
            }
        )
        
    }
    func insertUserData(user : UserData?){
        DatabaseManager.sharedInstance.insertUserData(object: user)
    }
}
