//
//  Service.swift
//  FundooNotes
//
//  Created by BridgeLabz on 05/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import Foundation
class Service {
    static var sharedInstance = Service()
    var user : UserModel?
    func getUsers(email : String?,callback : (_ isAvailable : Bool,_ object : UserModel?)-> Void){
        UserDataBase.sharedInstance.fetchUserData(email: email, callback: {isavailable,object in
            callback(isavailable,object)
            
            })
  }
}
